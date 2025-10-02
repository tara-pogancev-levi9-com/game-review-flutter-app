# Supabase API Guide for Flutter 

## Table of Contents
- [Overview](#overview-what-is-the-supabase-api)
- [Initializing Supabase](#initializing-supabase-in-flutter)
- [Reading Data](#reading-data-fetching-rows-with-select)
- [Creating Data](#creating-data-inserting-rows-post)
- [Updating Data](#updating-data-modifying-existing-rows-patch)
- [Deleting Data](#deleting-data-removing-rows-delete)
- [Authentication](#authentication-sign-up-sign-in-and-sessions)
- [Querying](#querying-with-filters-ordering-and-pagination-fine-grained-queries)
- [Relationships](#using-foreign-key-relationships-joins)
- [Security & Best Practices](#security--best-practices-rls-rate-limits-etc)
- [Quick Start](#quick-start)

## Overview: What is the Supabase API?

Supabase gives us an auto-generated RESTful API on top of our Postgres database. Essentially, every table and view in the database instantly becomes accessible via HTTP endpoints without us writing any server code. This is powered by  **PostgREST**, which basically turns the database schema into a REST API. Whenever we update the schema, the API updates as well. That’s  means we can perform CRUD operations (Create, Read, Update, Delete) on our data directly from the client or server by hitting endpoints under our project’s API URL (e.g.  `https://<PROJECT>.supabase.co/rest/v1/...`) using the proper keys and headers.

Some of the main benefits of Supabase’s auto-API are:

-   **Instant API, No Boilerplate:**  We get immediate REST endpoints for all tables, speeding up development since no custom backend code is needed for basic operations. For example, a table named  `players`  is accessible at  `.../rest/v1/players`  for queries.
    
-   **Self-Documenting:**  The Supabase dashboard provides docs for our specific schema. As we add or alter tables, the API docs update automatically.
    
-   **Secure by Default:**  The API integrates with Postgres Row Level Security (RLS) and requires an API key. By default, all requests must include either the  **anon (public)**  key or the  **service (secret)**  key in the header. The anon key is used in client-side calls and works with RLS to allow or restrict data access per user, while the service key (never exposed on client) bypasses RLS for admin tasks. The API gateway (Kong) checks these keys and the JWT from Supabase Auth on each request.
    
-   **High Performance:**  The REST API is a thin layer over Postgres, translating HTTP requests into SQL. This design yields fast response times – Supabase benchmarks show basic reads can be very fast since Postgres does the heavy lifting. It’s also scalable to many simultaneous requests.
    

In summary, the Supabase API allows our Flutter app to talk to the database directly in a secure, controlled way. We can use the Supabase Dart client SDK to make these calls more easily, which under the hood issues the appropriate HTTP requests for us. Next, we'll cover how to use the Dart client for common operations.

## Initializing Supabase in Flutter

Before using the API, ensure Supabase is initialized in our Flutter project. We use the  `supabase_flutter`  package, which provides a singleton  `Supabase.instance.client`  once initialized. Typically, initialization is done once (e.g., in  `main()`  or a top-level widget) by supplying our project URL and anon API key:

```
	await Supabase.initialize(
	  url: 'https://<PROJECT>.supabase.co', 
	  anonKey: 'public-anon-key',
	);
```

After initialization, we can obtain the  `SupabaseClient`  via  `Supabase.instance.client`. This client will be used for all database and auth operations. The examples below assume we have a  `final supabase = Supabase.instance.client;`  ready to go.

## Reading Data: Fetching Rows with  `select()`

To retrieve data from a table, use the Dart client’s  `from(<table>).select()`  query builder. This corresponds to an HTTP GET request on the table’s REST endpoint. By default, selecting data returns an array of rows (as Dart maps) and will include all columns unless you specify a subset of columns.

**Example – Basic Query:**  Fetch all columns from the  `players`  table:

```
	final List players = await supabase
	    .from('players')
	    .select();
```

This will perform a  `SELECT *`  on the  `players`  table and return up to 1,000 rows by default. Supabase imposes a default limit of 1,000 rows per request for safety, so in case the table has more data, you’d retrieve the first 1,000. (We’ll discuss how to get additional rows in the Pagination section.)

**Selecting Specific Columns:**  You can reduce payload by specifying columns:

```
	final data = await supabase
	    .from('players')
	    .select('name, score');
```

This would fetch only the  `name`  and  `score`  columns for all player records. It’s good practice to select only needed fields to minimize data transfer.

**Filtering Results:**  You can apply filters to narrow results (more details in  **Filtering & Queries**  below). For example, to get players with a high score:

```
	final highScorers = await supabase
	    .from('players')
	    .select('*')
	    .gte('score', 1000);  // score >= 1000 
```

Filters should be appended  _after_  `select()`  in the query chain. The Supabase Dart SDK provides many filter operators (e.g.  `.eq`,  `.neq`,  `.lt`,  `.like`, etc.) to mimic SQL WHERE clauses.

**Reading a Single Row:**  If you expect only one row (for example, fetching by a unique  `id`), you can append  `.single()`  to get a single map back instead of a list. Alternatively, use  `.maybeSingle()`  if zero or one row is expected. These are convenient for scenarios like fetching a specific user profile by the user’s UUID.

**Underlying HTTP (for reference):**  If needed for testing, the equivalent HTTP GET request for the first example would look like:

```
	curl -X GET \ 'https://<PROJECT>.supabase.co/rest/v1/players?select=*' \
	  -H "apikey: <anon-key>" \
	  -H "Authorization: Bearer <user-jwt>" 
```

Here we include the  `apikey`  (anon key) and an  `Authorization: Bearer <token>`  header if a user is logged in. The Supabase Dart client handles these headers for us (including the JWT when the user is authenticated).

## Creating Data: Inserting Rows (POST)

To add new records to the database, use the  `insert()`  method. This corresponds to an HTTP POST to the table endpoint. With the Dart client, you can insert a single object (Map) or a list of objects for bulk insert.

**Example – Insert a Single Record:**  Add a new player to the  `players`  table:

```
	final response = await supabase
	    .from('players')
	    .insert({
	      'name': 'Alice',
	      'score': 42,
	      'team_id': 7
	    });
```

This will create a new row with the given data (assuming the keys match column names). The  `insert()`  returns a response; by default, the newly inserted data may not be included in the response unless specified. If you want to  **retrieve the inserted record**  (for example, to get its generated  `id`), you can chain a  `.select()`  after insert:


```final inserted = await supabase
    .from('players')
    .insert( { 'name': 'Bob', 'score': 99, 'team_id': 7 } )
    .select();
```

By appending  `.select()`, the request will ask the API to return the created row(s). Without it, the insert will still succeed, but return an empty list (due to the default "return minimal" policy on inserts).

**Bulk Insert:**  To insert multiple rows in one call, provide a list of maps:


```
	await supabase.from('players').insert([
	  { 'name': 'Charlie', 'score': 15, 'team_id': 7 },
	  { 'name': 'Dana', 'score': 27, 'team_id': 8 }
	]);
```

This will create all provided records in a single request. Bulk inserts are convenient for seeding data or batch operations (just be mindful of payload size).

**Underlying HTTP (reference):**  In cURL, a single insert might be:

```
	curl -X POST \ 'https://<PROJECT>.supabase.co/rest/v1/players' \
	  -H "Content-Type: application/json" \
	  -H "apikey: <anon-key>" \
	  -H "Authorization: Bearer <user-jwt>" \
	  -d '{ "name": "Alice", "score": 42, "team_id": 7 }'
```

The JSON body of the POST contains the new record. The response would include the inserted record if  `Prefer: return=representation`  is set (which the Dart client does when you chain  `.select()`  as shown above).

## Updating Data: Modifying Existing Rows (PATCH)

To update existing entries, use the  `update()`  method with a query filter to target specific rows. This issues an HTTP PATCH under the hood.  **Always use a filter**  with  `update()`  to avoid unintentionally modifying all rows. Commonly you’ll filter by an  `id`  or some unique key.

**Example – Update a Record:**  Change a player’s score:

```
	await supabase
	  .from('players')
	  .update({ 'score': 100 })
	  .eq('id', 42);
```

This finds the row in  `players`  with  `id = 42`  and sets its  `score`  to 100. Only that row is affected because of the  `.eq('id', 42)`  filter. You can chain multiple filters if needed (e.g.,  `.eq('team_id',7).eq('active',true)`  to update all active players of a team). If no filter is provided,  **all rows**  in the table would match and be updated – so it's critical to narrow the query.

Just like inserts, you can append  `.select()`  after an update to get the updated record back in one round trip:

```
	final updated = await supabase
	  .from('players')
	  .update({ 'score': 100 })
	  .eq('id', 42)
	  .select();
```

This would return the modified row(s) in the response. Without the select, the response is usually empty (indicating success with no return payload).

**Partial Updates:**  The  `update()`  operation in Supabase will only modify the fields you provide and leave other fields untouched (it performs a SQL  `UPDATE`  of those columns). For example, updating only the score as above doesn’t affect the player’s name or other columns.

**Updating JSON Fields:**  If your table has JSON columns, you can update nested JSON keys. For instance, suppose  `profiles`  table has a JSON column  `settings`  and you want to update one field inside it:

```
	await supabase
	  .from('profiles')
	  .update({ 'settings->notifications': true })
	  .eq('id', currentUserId);
```

The above syntax uses the  `->`  operator to target a JSON key in the update (the Dart SDK supports this via passing a map key like  `'settings': { 'notifications': true }`  as well). Ensure your filter also matches the intended row(s).

**Underlying HTTP:**  An update via HTTP would use PATCH method. For example:

```
	curl -X PATCH \ 'https://<PROJECT>.supabase.co/rest/v1/players?id=eq.42' \
	  -H "Content-Type: application/json" \
	  -H "apikey: <anon-key>" \
	  -H "Authorization: Bearer <user-jwt>" \
	  -d '{ "score": 100 }'
```

The query param  `id=eq.42`  filters the row, and the JSON body has the fields to update. The Supabase Dart client abstracts this into the fluent interface shown in the examples.

## Deleting Data: Removing Rows (DELETE)

To remove records, use the  `delete()`  method with a filter. This translates to an HTTP DELETE request. As with updates,  **always include a filter**  with  `delete()`  to avoid deleting everything.

**Example – Delete a Record:**  Remove a player by id:

```
	await supabase
	  .from('players')
	  .delete()
	  .eq('id', 42);
```

This will delete the row where  `id = 42`  in the  `players`  table. If no row matches, it simply does nothing (and typically returns an empty list).

You can delete multiple records by using a broader filter. For instance, to delete all players from a certain team:

```
	await supabase
	  .from('players')
	  .delete()
	  .eq('team_id', 7); 
```

All rows with  `team_id = 7`  would be removed (assuming RLS or permissions allow it).

For deleting multiple specific IDs, you can use  `.inFilter()`  (or  `.in`) operator:

```
	await supabase
	  .from('players')
	  .delete()
	  .in('id', [21, 37, 42]);
```

This would delete players with id 21, 37, or 42 in one call.

As with other mutations, you can chain  `.select()`  to get info on deleted rows. For example:

```
	final deleted = await supabase
	  .from('players')
	  .delete()
	  .match({'username': 'testuser'})
	  .select();
```

This would delete rows matching the given criteria and return the deleted records in  `deleted`  for confirmation. The  `.match()`  shown is another way to filter (it matches all keys in the provided map).

**Important – RLS and Deletes:**  If Row Level Security is enabled on a table, a delete will only succeed on rows the user has access to  **and**  that satisfy the RLS policies. Supabase notes that by default, if no RLS select policy allows a row to be visible, it also cannot be deleted. In practice, you need to have a policy that permits the user to at least select or specifically delete the row. Otherwise,  `delete()`  will return an empty result and the row will remain (from the client perspective it looks like nothing happened).

**Underlying HTTP:**  A delete via HTTP might look like:

```
	curl -X DELETE \ 'https://<PROJECT>.supabase.co/rest/v1/players?id=eq.42' \
	  -H "apikey: <anon-key>" \
	  -H "Authorization: Bearer <user-jwt>"
```

This would delete the record with id 42. No body is needed for the request. The response usually contains an empty array or, if  `Prefer: return=representation`  and RLS allows, the deleted record details.

## Authentication: Sign Up, Sign In, and Sessions

Supabase’s Auth system allows us to manage user sign-ups, logins, and session handling easily in Flutter. It uses email/password, phone OTP, OAuth providers, etc., but here we'll cover the common email/password flow in our project.

**Sign Up (Registration):**  To create a new user account (e.g., with email and password), use the  `supabase.auth.signUp`  method:

```
	final AuthResponse res = await supabase.auth.signUp(
	  email: 'user@example.com',
	  password: 'SuperSecret123',
	);

	final Session? session = res.session;
	final User? user = res.user;
```

This will register the user in the Supabase Auth system. By default, Supabase requires email verification: the user will receive a confirmation email and must click it before they can fully sign in. In that case,  `res.user`  will be non-null but  `res.session`  will be null (meaning no active session yet). If email confirmations are disabled in our project settings, the user will be signed in immediately upon sign-up and  `res.session`  will contain a valid session.

Important: Always handle  `res.error`  (if present) to catch cases like the email already being used, weak password, etc. For instance:

```
	if (res.error != null) {
	  print('Sign-up error: ${res.error!.message}');
	}
```

**Sign In (Login):**  To log in an existing user, use  `signInWithPassword`  (formerly just  `signIn`):

```
	final AuthResponse res = await supabase.auth.signInWithPassword(
	  email: 'user@example.com',
	  password: 'SuperSecret123',
	);
	
	final Session? session = res.session;
	final User? user = res.user;
``` 

If the credentials are correct,  `res.user`  will be the user object and  `res.session`  will contain the access token and refresh token. From this point, the Supabase client will automatically use the session’s JWT for authenticated requests. The user stays logged in until we call  `signOut()`  or the session expires.

**Session Handling:**  The Supabase Dart client (especially via  `supabase_flutter`) persists the session for us by default. This means if the app is closed or restarted, it can restore the last logged-in session (using secure storage). You can always access the current session or user:

-   `supabase.auth.currentSession`  gives the active session (JWT and other info).
-   `supabase.auth.currentUser`  gives the user object (with id, email, etc.) if logged in, or null if not.
    

Supabase tokens are JWTs with a short lifespan (usually 1 hour), but they auto-refresh. The client uses a refresh token behind the scenes to renew the session automatically. In most cases, you don’t need to manually refresh tokens; the client will emit events if a session expires or is refreshed.

**Sign Out:**  To log out the current user, call:

```
	await supabase.auth.signOut();
``` 

This will remove the session from the client (and revoke it server-side). After signing out,  `currentUser`  becomes null. We should update the UI accordingly (navigate to a login screen, etc.). Supabase supports signing out of all devices vs. just current device (using an optional parameter), but by default  `signOut()`  just logs out the current device session.

**Password Reset & Email Change:**  Though not explicitly asked, note that Supabase also supports password reset emails and email change flows via additional methods (these can be triggered via supabase.auth or the dashboard). For brevity, not covered here, but good to be aware of.

**Auth and Database Security:**  When a user is logged in, the Supabase JWT token includes their unique user ID (`auth.uid()`  in Postgres). We use this in RLS policies to ensure users can only access their own data where appropriate. For example, if we have a  `profiles`  table, we might have an RLS policy like  _"user_id = auth.uid()"_  to allow each user to  `SELECT/UPDATE`  only their own profile row. The Supabase client attaches the JWT to every request automatically, so the backend can enforce these rules.

In summary, our Flutter app will use  `signUp`  for new accounts,  `signInWithPassword`  for returning users, and maintain sessions so that the user stays authenticated. Always secure any data operations with RLS (discussed next) so that even though the anon API key is public, data access is properly restricted to the rightful users.

## Querying with Filters, Ordering, and Pagination (Fine-Grained Queries)

Supabase’s API allows  **fine-grained querying**  similar to SQL  `WHERE`,  `ORDER BY`, and  `LIMIT/OFFSET`. Using the Dart client, we chain methods to refine our queries.

### Filtering Data

To filter results (apply conditions), use the filter methods after  `select()`:

-   `.eq('column', value)`  – equals a value.
-   `.neq('column', value)`  – not equals.    
-   `.gt`,  `.gte`  – greater than, greater or equal.    
-   `.lt`,  `.lte`  – less than, less or equal.    
-   `.like('column', pattern)`  – pattern match (case-sensitive), and  `.ilike`  for case-insensitive.    
-   `.in('column', [values])`  – matches any of the values in the list.  
-   `.contains('column', [values])`  – for array or JSON contains.  
-   etc.
    

For example, to get players with score between 50 and 100:

```
	final results = await supabase
	  .from('players')
	  .select('name, score')
	  .gte('score', 50)
	  .lte('score', 100);
``` 

This adds two filters: score >= 50 and score <= 100. Filters are  **ANDed**  together by default when chained. If you need OR logic or more complex conditions, you might use  `.or()`  or write a stored procedure, but for most cases chaining works.

**Important:**  The order of calling  `select()`  vs filters matters. Always call  `select()`  first, then filters afterward as in the example. If you try to filter  _before_  selecting, it won’t work as expected.

You can also conditionally build queries. For instance:

```
	QueryBuilder q = supabase.from('players').select('*');

	if (teamId != null) 
		q = q.eq('team_id', teamId);
	if (minScore != null) 
		q = q.gte('score', minScore);
	
	final data = await q;
``` 

This way, you only apply filters if the values are provided (demonstrating dynamic query building similar to the  `if`  logic in the Supabase docs).

**Filtering on Related Tables:**  If you have a foreign key relationship and have joined data (see the section on Joins below), you can filter by fields of related tables. Supabase allows a syntax like  `"relatedTable.column"`  in filters after you’ve selected the related data. For example, if we load each player’s team and want only players from teams in a certain city:

```
	final data = await supabase
	  .from('players')
	  .select('*, team:teams(name, city)')
	  .eq('team.city', 'London');
``` 

Assuming  `players`  has  `team_id`  linking to  `teams`  table, this would return players whose related team’s city is London. Note that we used an alias  `team`  for the join in  `select()`  for clarity, then filtered on  `team.city`.

### Sorting (Ordering) Results

Use  `.order('column', ascending: true/false)`  to sort the results by a given column. For example:

```
	final topPlayers = await supabase
	  .from('players')
	  .select('name, score')
	  .order('score', ascending: false)
	  .limit(10);
``` 

This would get the top 10 scoring players, because we ordered by score descending and limited to 10. By default,  `ascending`  is false (so  `.order('score')`  would actually sort descending unless you specify  `ascending: true`).

You can also order by one column and then by another (like a secondary sort) by calling  `.order()`  again.

When dealing with related data (joins), Supabase provides options to order by columns of the embedded table. For instance, if we retrieved players with their team info, and wanted to order by the team’s name, we could do:

```
	final data = await supabase
	  .from('players')
	  .select('*, team:teams(name)')
	  .order('name', referencedTable: 'teams', ascending: true);
``` 

Here  `referencedTable: 'teams'`  tells the API to sort by the  `teams.name`  in the join. Another advanced example: ordering parent rows by a nested child property can be done using a syntax like  `.order('child_table.column')`  in some cases, but for most needs, ordering by a simple field or a referenced table as shown is sufficient.

### Pagination and Limits

**Limit & Range:**  To control how many rows are returned, use  `.limit(n)`  or the more explicit  `.range(start, end)`. For example,  `.limit(20)`  will fetch the first 20 rows. If you want to fetch rows 21–40, you could use  `.range(20, 39)`  (since ranges are inclusive of both boundaries).

Using  `.range()`  is useful for pagination because it lets you specify an offset (start index) and end index. Keep in mind:

-   `.range(0, 9)`  would get the first 10 rows (indexes 0 through 9).
-   `.range(10, 19)`  gets the next 10 rows, etc.
    

Alternatively,  `.limit(pageSize).offset(offset)`  can be used (Supabase Dart might not have an explicit  `.offset`  method, so using  `range`  is common). The API also supports  `?offset=`  query param if working via HTTP.

**Total Count:**  If you need the total number of rows that match a filter (for implementing pagination UI), you can request a count. In Dart, you can call  `.select('*', const FetchOptions(count: CountOption.exact))`  or use the older  `.count()`  method. For example:

```
	final res = await supabase
	    .from('players')
	    .select('*', const FetchOptions(count: CountOption.exact))
	    .eq('team_id', 7);
    
	final playersInTeam = res.data as List;
	final totalCount = res.count;
``` 

This query would fetch the players in team 7 and also give the exact total count of such players (ignoring the 1,000 limit). This is helpful for pagination to know how many pages of data exist. Note that requesting count may make the query slightly slower since the DB has to count all matching rows.

**Maximum Rows per Request:**  As mentioned, our Supabase project has a default maximum of  **1,000 rows per request**. This is configurable in the project settings, but it’s recommended to keep it reasonably low to avoid huge payloads. If you expect more than 1,000 results, use pagination (multiple requests) to retrieve them in chunks. For example, to get 5,000 rows, you might do 5 requests of 1,000 each via ranges. This is generally better for app performance as well.

**Best Practices for Querying:**

-   **Always Filter if Possible:**  Try to send specific queries (e.g., filter by user, by type, etc.) so that you don’t fetch massive datasets unnecessarily.
    
-   **Use Limits/Pagination:**  Especially for lists that could grow (like game history, user list, etc.), implement infinite scroll or paged requests rather than pulling everything. This prevents hitting the 1,000 row cap and improves perceived performance.
    
-   **Select Only Fields You Need:**  Avoid  `select(*)`  if you only need a couple of fields. This reduces bandwidth and processing on the client.
    
-   **Test with RLS:**  If RLS is enabled, test your queries with a user who has limited access to ensure the filters and policies work together (sometimes a query might return empty because of a policy, not because data isn’t there).
    

By following these practices, we keep our app fast and within any API limitations (Supabase doesn’t hard-cap normal requests on paid plans, but large responses or extremely frequent calls could hit network or performance bottlenecks).

### Example Combined Query

To illustrate, suppose we want to load the top 5 players of team 7, with their team info, who have a score above 100, sorted by score:

```
	final result = await supabase
	  .from('players')
	  .select('id, name, score, team:teams(name)')
	  .eq('team_id', 7)
	  .gt('score', 100)
	  .order('score', ascending: false)
	  .limit(5);
``` 

This will return at most 5 players from team 7 with score > 100, ordered by score descending, and each player object will include a nested  `team`  object with the team’s name. It combines filtering, ordering, limiting, and a foreign table join in one request – something that demonstrates the power of Supabase’s query syntax.

## Using Foreign Key Relationships (Joins)

Our database likely has relationships (foreign keys) between tables (e.g., players belong to teams, teams have a list of players, etc.). Supabase’s REST API can handle  **joins and nested data**  by leveraging those foreign keys. Instead of doing multiple round trips (fetch team, then fetch players), we can get related data in one query.

**Selecting Related Data:**  The Dart client’s  `select()`  method accepts a special syntax to indicate you want related rows. For example, if each  `player`  has a  `team_id`  foreign key to a  `teams`  table, you can fetch the player along with their team in one go:

```
	final data = await supabase
	  .from('players')
	  .select('id, name, score, teams(name, city)')
	  .eq('id', 42);
``` 

This will return the player with id 42, and include a nested object of the related  `teams`  row containing the team’s name and city. The syntax  `<foreign_table>(<columns>)`  tells Supabase to perform a join. Supabase knows the relationship from the foreign key constraint in the database.

If the relationship is one-to-many (e.g., one team has many players), doing a join from the "one" side will give you an  **array**  of related items. For instance, from a  `teams`  perspective:

```
	final data = await supabase
	  .from('teams')
	  .select('id, name, players(name, score)');
``` 

This would retrieve all teams, and for each team include a  `players`  array of that team’s players (with each player’s name and score). The result is a list of teams, each with an embedded list of players. Supabase handles serializing this nested structure from the SQL join automatically.

**Alias and Multiple Joins:**  If a table has multiple foreign keys to the same other table, or you simply want to rename for clarity, you can alias relationships. For example, imagine a  `matches`  table with two foreign keys:  `player1_id`  and  `player2_id`  both reference  `players`. You could do:

```
	final data = await supabase
	  .from('matches')
	  .select('id, player1:player1_id(name, score), player2:player2_id(name, score)');
``` 

Here we used  `player1:player1_id(...)`  to alias the first relationship as  `player1`  and similarly for  `player2`. The result for each match would have two nested player objects,  `player1`  and  `player2`. Aliasing ensures the keys in the JSON response are distinct and meaningful.

**Joining Through a Join Table (Many-to-Many):**  If you have a join table (e.g., players and teams might be many-to-many via a membership table), Supabase can sometimes traverse that as well. For example, if  `players_teams`  is a join table linking players and teams, you might be able to select through it like:

```
	final data = await supabase
	  .from('players')
	  .select('name, teams(name)')
``` 

If the relationships are set up (players -> players_teams -> teams), the above could yield each player with an array of  `teams`. Alternatively, querying from  `teams`  and selecting  `players`  might list players in each team. The Supabase docs demonstrate a similar pattern: selecting  `teams (...)`  from  `users`  where a join table links them. Ensure your foreign keys are correctly defined so that Supabase knows how the tables connect.

**Inner Joins for Filtering:**  By default, when you join related data, it performs a left join (all parent rows returned, with nested child if exists). If you want to filter out parent records that don’t have a related child, you can use an  `!inner`  directive in the select. For example:

```
	final data = await supabase
	  .from('teams')
	  .select('name, players!inner(name)')
	  .eq('players.score', 0);
``` 

Using  `players!inner(...)`  will only return teams that have at least one player (inner join requires a match). Combined with the filter  `.eq('players.score', 0)`, this would give teams that have a player with score 0, excluding any team that has no players or no players with score 0.

In practice, most of our queries will be simpler (you request a related object to avoid an extra query in your code). But knowing you can traverse relationships in queries helps to keep logic in the database and minimize over-fetching.

**Performance Note:**  Joining data via the API is convenient, but be mindful of how much data is being pulled. For example, selecting a team with all players will return potentially a large nested array of players. If you only need a count of players, it might be better to do a smaller query or use a foreign key count technique. However, for moderate data sizes, Supabase and PostgREST handle these joins efficiently on the server side.

## Security Best Practices (RLS, Rate Limits, etc.)

Finally, it's important to understand the security model and limitations of our Supabase API to use it effectively:

### Row Level Security (RLS)

RLS is  **critical**  for protecting data in Supabase. When enabled on a table, every query must satisfy the security policy rules defined for that table. In our project, we enable RLS on tables that contain user-specific or sensitive data (almost everything except perhaps reference data). With RLS on, the anon key (used by the Flutter client)  **cannot read or write any data unless**  a policy allows it. This ensures that even though the anon API key is public in our app, data is safe.

-   **Defining Policies:**  Policies are SQL conditions that determine if a row can be  **SELECTed**,  **INSERTed**,  **UPDATED**, or  **DELETED**  by a given user (identified by  `auth.uid()`, which comes from the Supabase JWT). For example, a typical policy on a  `players`  table might be:  _"Users can update a player row if players.user_id == auth.uid()"_. This ties the row to the user who created it.
    
-   **Using JWT Claims:**  Supabase JWTs include the user’s UUID as  `sub`  (and accessible via  `auth.uid()`  in policy definitions). They may also include a  `role`  claim (like  `authenticated`  for normal users). We can use these in policies. For instance, you might allow only users with role  `authenticated`  to insert, or allow an admin role to bypass certain restrictions.
    
-   **No Access by Default:**  When RLS is enabled and no policies are added,  **no data is accessible**  (select returns empty, inserts/updates/deletes will be denied). We must explicitly create policies for any access. This default secure stance is why sometimes a query returns nothing until the proper policy is in place.
    
-   **Testing Policies:**  Always test your endpoints with a real user session. Supabase provides a way to impersonate a user in the API by using a JWT or in the dashboard. We usually test by running the app and verifying that, e.g., user A cannot see user B’s data, etc. Also consider edge cases: if a policy uses  `auth.uid()`  but a request is made with no auth (public), then  `auth.uid()`  is null and the policy likely fails, meaning no data.
    
-   **Service Role for Admin:**  Our server-side or admin tools can use the  **service role key**  (supplied in the API settings). This key bypasses RLS entirely, so it should never be included in the app. But on a secure server (or Cloud Function), using the service key allows full access (useful for background jobs, or exporting data). In Flutter app, always use the anon key – never the service key.
    

In summary, RLS is the primary guard for our data. It works in concert with Supabase Auth: when a user is logged in, their JWT and policies decide what they can do. Keep policies as simple and as close to your business logic as possible (e.g., a foreign key user_id match, or membership in a team, etc.) to avoid confusion.

### Rate Limits and Quotas

Supabase’s pricing notes "unlimited API requests" on all plans (including free), which means we are not strictly limited in the number of calls. However, this doesn’t mean we should be reckless:

-   The database has finite resources. Extremely heavy query patterns (like polling or very large data transfers) can slow down responses or hit performance limits.
    
-   There are some implicit limits: for example, the Auth system limits how many OTPs or confirmation emails can be sent (e.g., currently around 2 emails per hour by default to prevent abuse). This might affect how often a user can request password recovery, etc.
    
-   Supabase Realtime and other sub-systems have their own limits (like maximum 1,000 real-time messages per second) which aren’t directly about the REST API but could be relevant if we use those features.
    

**Best Practices to Avoid Issues:**

-   **Batch Requests:**  Where possible, batch operations (Supabase allows some batching like inserting multiple rows, or using  `.in()`  to fetch multiple records in one call). This reduces the number of round trips.
    
-   **Use Query Filters (as discussed):**  This prevents fetching huge datasets which could saturate network or memory.
    
-   **Monitor Egress:**  The free plan has egress limits (data out). Large responses count against that. Our app likely won’t hit it unless transferring large files or thousands of rows frequently, but it’s good to be aware (the dashboard shows usage).
    
-   **Graceful Failures:**  Be mindful of how the app reacts if the API does start failing (e.g., if we somehow exceeded a quota or the database is under heavy load). Implement retries or user-friendly error messages where appropriate.
    

### Additional Notes

-   **HTTP vs. Dart SDK:**  Internally, the Dart SDK calls the REST endpoints. For troubleshooting, you can log or print the  `.toString()`  of a query builder to see the URL it will call, or use tools like the Supabase Dashboard "API" section to see example cURL requests for your tables. This can be helpful to debug issues (e.g., to confirm if a filter is being encoded correctly).
    
-   **Use of Bruno or Postman:**  If any team member wants to test endpoints outside the app, you can use API clients like Postman or Bruno. Remember to include the proper  `apikey`  and  `Authorization`  header with a valid JWT. You can obtain a JWT easily by calling  `supabase.auth.currentSession!.accessToken`  in the app after logging in (for testing purposes).
    
-   **Edge Functions:**  Although not covered here, if we ever need custom business logic that the auto-generated API can’t handle (complex transactions, third-party API calls on the backend, etc.), consider using Supabase Edge Functions (serverless functions) and calling them from Flutter. This allows extending functionality beyond basic CRUD while still integrating with Supabase Auth and DB.
    

## Quick Start


Here are the most common Supabase API examples you’ll need in Flutter:

### 1. Fetch Data (SELECT)

```
	final players = await supabase
	  .from('players')
	  .select('id, name, score');
```

Returns a list of players with their `id`, `name`, and `score`.

----------

### 2. Insert a New Row

```
	final inserted = await supabase
	  .from('players')
	  .insert({'name': 'Alice', 'score': 42})
	  .select();
```

Inserts a new player and returns the created row.

----------

### 3. Update an Existing Row

```
	await supabase
	  .from('players')
	  .update({'score': 100})
	  .eq('id', 42);
```

Updates the score of the player where `id = 42`.

----------

### 4. Delete a Row

```
	await supabase
	  .from('players')
	  .delete()
	  .eq('id', 42);
```

Deletes the player with `id = 42`.

----------

### 5. Authentication (Sign Up & Sign In)

**Sign up (registration):**

```
	final res = await supabase.auth.signUp(
	  email: 'user@example.com',
	  password: 'SuperSecret123',
	);

```

**Sign in (login):**

```
	final res = await supabase.auth.signInWithPassword(
	  email: 'user@example.com',
	  password: 'SuperSecret123',
	);
```


The user receives a JWT token that Supabase automatically attaches to all future API calls.

----------

**Tip:** Always use filters like `.eq('id', value)` when calling `update()` or `delete()` to avoid accidentally modifying or removing all rows.

