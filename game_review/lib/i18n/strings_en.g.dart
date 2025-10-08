///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  );

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations

	/// en: 'Welcome!'
	String get welcome => 'Welcome!';

	/// en: 'Hello, {name}!'
	String get greeting => 'Hello, {name}!';

	/// en: 'Change Language'
	String get changeLanguage => 'Change Language';

	/// en: 'Game Review App'
	String get appTitle => 'Game Review App';

	/// en: 'Home'
	String get home => 'Home';

	/// en: 'Settings'
	String get settings => 'Settings';

	/// en: 'Search for games'
	String get searchGames => 'Search for games';

	/// en: 'Favorite Games'
	String get favoriteGames => 'Favorite Games';

	/// en: 'Recent Reviews'
	String get recentReviews => 'Recent Reviews';

	/// en: 'Add Review'
	String get addReview => 'Add Review';

	/// en: 'My Profile'
	String get myProfile => 'My Profile';

	/// en: 'Logout'
	String get logout => 'Logout';

	/// en: 'Login'
	String get login => 'Login';

	/// en: 'Goodbye!'
	String get goodbye => 'Goodbye!';

	/// en: 'King'
	String get king => 'King';

	/// en: 'Register'
	String get register => 'Register';

	/// en: 'Email'
	String get email => 'Email';

	/// en: 'Password'
	String get password => 'Password';

	/// en: 'Confirm Password'
	String get confirmPassword => 'Confirm Password';

	/// en: 'Submit'
	String get submit => 'Submit';

	/// en: 'Username'
	String get username => 'Username';

	/// en: 'Profile Settings'
	String get profileSettings => 'Profile Settings';

	/// en: 'Notifications'
	String get notifications => 'Notifications';

	/// en: 'Back'
	String get back => 'Back';

	/// en: 'Next'
	String get next => 'Next';

	/// en: 'Discover'
	String get discver => 'Discover';

	/// en: 'Discover'
	String get discover => 'Discover';

	/// en: 'Details'
	String get details => 'Details';

	/// en: 'Ratings'
	String get ratings => 'Ratings';

	/// en: 'Evaluation'
	String get evaluation => 'Evaluation';

	/// en: 'Overall'
	String get overall => 'Overall';

	/// en: 'Gameplay'
	String get gameplay => 'Gameplay';

	/// en: 'Graphics'
	String get graphics => 'Graphics';

	/// en: 'Sound'
	String get sound => 'Sound';

	/// en: 'Story'
	String get story => 'Story';

	/// en: 'Value'
	String get value => 'Value';

	/// en: 'Pros'
	String get pros => 'Pros';

	/// en: 'Cons'
	String get cons => 'Cons';

	/// en: 'Media'
	String get media => 'Media';

	/// en: 'Discussions'
	String get discussions => 'Discussions';

	/// en: 'Save'
	String get save => 'Save';

	/// en: 'Edit'
	String get edit => 'Edit';

	/// en: 'Delete'
	String get delete => 'Delete';

	/// en: 'Update'
	String get update => 'Update';

	/// en: 'Missing API_URL environment variable'
	String get missingApiUrl => 'Missing API_URL environment variable';

	/// en: 'Error occurred. Try again later'
	String get registrationError => 'Error occurred. Try again later';

	/// en: 'Passwords do not match!'
	String get passwordMismatch => 'Passwords do not match!';

	/// en: 'Password must be at least 8 characters long!'
	String get passwordLength => 'Password must be at least 8 characters long!';

	/// en: 'Email address is not valid!'
	String get emailInvalid => 'Email address is not valid!';

	/// en: 'Registration successful!'
	String get registrationSuccessful => 'Registration successful!';

	/// en: 'The provided email is already registered.!'
	String get registrationEmailExistsError => 'The provided email is already registered.!';

	late final TranslationsNavigationEn navigation = TranslationsNavigationEn.internal(_root);
	late final TranslationsErrorsEn errors = TranslationsErrorsEn.internal(_root);

	/// en: 'App failed to start:\n\n@{error}'
	String get appFailedToStart => 'App failed to start:\n\n@{error}';

	late final TranslationsLibraryEn library = TranslationsLibraryEn.internal(_root);
	late final TranslationsBrandingEn branding = TranslationsBrandingEn.internal(_root);
	late final TranslationsGameServiceEn gameService = TranslationsGameServiceEn.internal(_root);
	late final TranslationsGameDetailsEn gameDetails = TranslationsGameDetailsEn.internal(_root);
}

// Path: navigation
class TranslationsNavigationEn {
	TranslationsNavigationEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Home'
	String get home => 'Home';

	/// en: 'Search'
	String get search => 'Search';

	/// en: 'Library'
	String get library => 'Library';

	/// en: 'Profile'
	String get profile => 'Profile';
}

// Path: errors
class TranslationsErrorsEn {
	TranslationsErrorsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Invalid credentials'
	String get invalidCredentials => 'Invalid credentials';

	/// en: 'Login failed. Please try again.'
	String get loginFailed => 'Login failed. Please try again.';

	/// en: '{field} required'
	String get requiredField => '{field} required';

	/// en: 'Invalid email'
	String get invalidEmail => 'Invalid email';

	/// en: 'Min {n} char'
	String get minLength => 'Min {n} char';

	/// en: 'The app failed to start. Please restart and try again.'
	String get appFailedToStart => 'The app failed to start. Please restart and try again.';

	/// en: 'Game not found'
	String get gameNotFound => 'Game not found';

	/// en: 'Reviews not found'
	String get reviewsNotFound => 'Reviews not found';
}

// Path: library
class TranslationsLibraryEn {
	TranslationsLibraryEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Latest'
	String get latest => 'Latest';

	/// en: 'Popular'
	String get popular => 'Popular';

	/// en: 'Owned Games'
	String get ownedGames => 'Owned Games';

	/// en: 'Wishlist'
	String get wishlist => 'Wishlist';

	/// en: 'My Library'
	String get myLibrary => 'My Library';

	/// en: 'Game already in wishlist'
	String get gameAlreadyInWishlist => 'Game already in wishlist';

	/// en: 'Game added to wishlist'
	String get gameAddedToWishlist => 'Game added to wishlist';

	/// en: 'Failed to add to wishlist'
	String get failedToAddToWishlist => 'Failed to add to wishlist';

	/// en: 'Game already in library'
	String get gameAlreadyInLibrary => 'Game already in library';

	/// en: 'Game added to library'
	String get gameAddedToLibrary => 'Game added to library';

	/// en: 'Failed to add to library'
	String get failedToAddToLibrary => 'Failed to add to library';

	/// en: 'Game not found in wishlist'
	String get gameNotFoundInWishlist => 'Game not found in wishlist';

	/// en: 'Game not found in library'
	String get gameNotFoundInLibrary => 'Game not found in library';

	/// en: 'Wishlist addition failed'
	String get wishlistAdditionFailed => 'Wishlist addition failed';

	/// en: 'Library addition failed'
	String get libraryAdditionFailed => 'Library addition failed';

	/// en: 'Failed to fetch games'
	String get failedToFetchGames => 'Failed to fetch games';
}

// Path: branding
class TranslationsBrandingEn {
	TranslationsBrandingEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'PAW GAMES'
	String get title => 'PAW GAMES';

	/// en: 'Discover. Rate. Share.'
	String get tagline => 'Discover. Rate. Share.';

	/// en: 'App logo'
	String get logoLabel => 'App logo';
}

// Path: gameService
class TranslationsGameServiceEn {
	TranslationsGameServiceEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Cannot add to wishlist - no token found'
	String get noTokenWishlist => 'Cannot add to wishlist - no token found';

	/// en: 'Cannot add to library - no token found'
	String get noTokenLibrary => 'Cannot add to library - no token found';

	/// en: 'Cannot fetch wishlist - no token found'
	String get noTokenFetchWishlist => 'Cannot fetch wishlist - no token found';

	/// en: 'Cannot fetch library - no token found'
	String get noTokenFetchLibrary => 'Cannot fetch library - no token found';

	/// en: 'Cannot remove from wishlist - no token found'
	String get noTokenRemoveWishlist => 'Cannot remove from wishlist - no token found';

	/// en: 'Cannot remove from library - no token found'
	String get noTokenRemoveLibrary => 'Cannot remove from library - no token found';

	/// en: 'Game added to wishlist successfully'
	String get gameAddedToWishlistSuccess => 'Game added to wishlist successfully';

	/// en: 'Game added to library successfully'
	String get gameAddedToLibrarySuccess => 'Game added to library successfully';

	/// en: 'Failed to add to wishlist, status'
	String get failedToAddToWishlistStatus => 'Failed to add to wishlist, status';

	/// en: 'Failed to add to library, status'
	String get failedToAddToLibraryStatus => 'Failed to add to library, status';

	/// en: 'Failed to fetch latest games'
	String get failedToFetchLatestGames => 'Failed to fetch latest games';

	/// en: 'Failed to fetch popular games'
	String get failedToFetchPopularGames => 'Failed to fetch popular games';

	/// en: 'Failed to add game to wishlist'
	String get failedToAddGameToWishlist => 'Failed to add game to wishlist';

	/// en: 'Failed to add game to library'
	String get failedToAddGameToLibrary => 'Failed to add game to library';

	/// en: 'Failed to fetch wishlist games'
	String get failedToFetchWishlistGames => 'Failed to fetch wishlist games';

	/// en: 'Failed to fetch library games'
	String get failedToFetchLibraryGames => 'Failed to fetch library games';

	/// en: 'Removed from wishlist on server'
	String get removedFromWishlist => 'Removed from wishlist on server';

	/// en: 'Removed from library on server'
	String get removedFromLibrary => 'Removed from library on server';

	/// en: 'Failed to remove from wishlist'
	String get failedToRemoveFromWishlist => 'Failed to remove from wishlist';

	/// en: 'Failed to remove from library'
	String get failedToRemoveFromLibrary => 'Failed to remove from library';
}

// Path: gameDetails
class TranslationsGameDetailsEn {
	TranslationsGameDetailsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Added to Wishlist'
	String get addedToWishlist => 'Added to Wishlist';

	/// en: 'Game already in Wishlist'
	String get gameAlreadyInWishlist => 'Game already in Wishlist';

	/// en: 'Failed to add to Wishlist'
	String get failedToAddToWishlist => 'Failed to add to Wishlist';

	/// en: 'Added to My Library'
	String get addedToLibrary => 'Added to My Library';

	/// en: 'Game already in Library'
	String get gameAlreadyInLibrary => 'Game already in Library';

	/// en: 'Failed to add to Library'
	String get failedToAddToLibrary => 'Failed to add to Library';

	/// en: 'Removed from Wishlist'
	String get removedFromWishlist => 'Removed from Wishlist';

	/// en: 'Failed to remove from Wishlist'
	String get failedToRemoveFromWishlist => 'Failed to remove from Wishlist';

	/// en: 'Removed from Library'
	String get removedFromLibrary => 'Removed from Library';

	/// en: 'Failed to remove from Library'
	String get failedToRemoveFromLibrary => 'Failed to remove from Library';

	/// en: 'Add review feature coming soon!'
	String get addReviewComingSoon => 'Add review feature coming soon!';

	/// en: 'Add to Wishlist'
	String get addToWishlist => 'Add to Wishlist';

	/// en: 'Add to My Library'
	String get addToMyLibrary => 'Add to My Library';

	/// en: 'Remove from Wishlist'
	String get removeFromWishlist => 'Remove from Wishlist';

	/// en: 'Remove from My Library'
	String get removeFromMyLibrary => 'Remove from My Library';

	/// en: 'Add Review'
	String get addReview => 'Add Review';

	/// en: 'x of players recommend this game'
	String get recommendText => 'x of players recommend this game';

	/// en: 'Overall'
	String get overall => 'Overall';

	/// en: 'Details'
	String get details => 'Details';

	/// en: 'Developer'
	String get developer => 'Developer';

	/// en: 'Publisher'
	String get publisher => 'Publisher';

	/// en: 'Released'
	String get released => 'Released';

	/// en: 'Available on'
	String get availableOn => 'Available on';

	/// en: 'Recent reviews'
	String get recentReviews => 'Recent reviews';
}
