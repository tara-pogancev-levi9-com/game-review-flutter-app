1. Setup API key for translations
Get the API key:

Create your .env file:
Option 1: Create manually

touch .env
open -a TextEdit .env
Add a line I sent you on Slack

Save and close the file.

IMPORTANT:
* Never commit the .env file to Git
* It's already listed in .gitignore so Git will ignore it automatically
* Each team member needs to create their own .env file locally

Verify the setup:
cat .env

You should see:
OPENAI_API_KEY=sk-proj-...

2. Run the app
flutter run

To add new translations:

1. Edit the English file: open lib/i18n/en.i18n.json

Add your new text strings in English only.

1. Run the translation script:   ./scripts/translate.sh

This will automatically:
* Translate your English text to Serbian using AI
* Generate the necessary Dart code files

1. Test the app:   flutter run

Switch languages to verify both English and Serbian work correctly.

If the translation script doesn't work:
Manually translate and regenerate:
1. Add text to lib/i18n/en.i18n.json
2. Add Serbian translation to lib/i18n/sr.i18n.json
3. Run: dart run slang
4. Run: flutter run

Using Translations in Your Code
Basic Usage
After running dart run slang, you can access translations using the t variable.

Import in your Dart file:
import 'i18n/strings.g.dart';

Access translations:
final t = Translations.of(context);

// Simple text
Text(t.welcome)
Text(t.appTitle)
Text(t.home)

Examples
In a button:
ElevatedButton(
  onPressed: () {},
  child: Text(t.login),
)

In AppBar:
AppBar(
  title: Text(t.appTitle),
)

With parameters:
If your JSON has:
{
  "greeting": "Hello, {name}!"
}

Use it like this:
Text(t.greeting.replaceAll('{name}', 'John'))

Real Example
JSON file (en.i18n.json):
{
  "searchGames": "Search for games",
  "addReview": "Add Review",
  "logout": "Logout"
}

In your code:
class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {},
          child: Text(t.searchGames),
        ),
        ElevatedButton(
          onPressed: () {},
          child: Text(t.addReview),
        ),
        TextButton(
          onPressed: () {},
          child: Text(t.logout),
        ),
      ],
    );
  }
}






