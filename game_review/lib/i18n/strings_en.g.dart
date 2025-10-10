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

	/// en: 'No games found'
	String get NoGamesFound => 'No games found';

	/// en: 'Failed to load games'
	String get errorLoadingGames => 'Failed to load games';

	/// en: 'Failed to load more games'
	String get errorLoadingMoreGames => 'Failed to load more games';

	late final TranslationsErrorsEn errors = TranslationsErrorsEn.internal(_root);
	late final TranslationsBrandingEn branding = TranslationsBrandingEn.internal(_root);

	/// en: 'You have already reviewed this game'
	String get youHaveAlreadyReviewedThisGame => 'You have already reviewed this game';

	/// en: 'Completed'
	String get completed => 'Completed';

	/// en: 'Not started'
	String get notStarted => 'Not started';

	/// en: 'In progress'
	String get inProgress => 'In progress';

	/// en: 'Abandoned'
	String get abandoned => 'Abandoned';

	/// en: 'Failed to save review'
	String get FailedToSaveReview => 'Failed to save review';

	/// en: 'Review added successfully!'
	String get reviewAddedSuccessfully => 'Review added successfully!';

	/// en: 'Review title *'
	String get reviewTitle => 'Review title *';

	/// en: 'Review title is required'
	String get reviewTitleIsRequired => 'Review title is required';

	/// en: 'Review description *'
	String get reviewDescription => 'Review description *';

	/// en: 'Review description is required'
	String get reviewDescriptionIsRequired => 'Review description is required';

	/// en: 'Pros & Cons'
	String get prosCons => 'Pros & Cons';

	/// en: 'Game pros (comma-separated)'
	String get gamePros => 'Game pros (comma-separated)';

	/// en: 'Game cons (comma-separated)'
	String get gameCons => 'Game cons (comma-separated)';

	/// en: 'Overall Rating *'
	String get overallRating => 'Overall Rating *';

	/// en: 'Individual Ratings'
	String get individualRatings => 'Individual Ratings';

	/// en: 'Miscellaneous'
	String get miscellaneous => 'Miscellaneous';

	/// en: 'Game completion (%)'
	String get gameCompletion => 'Game completion (%)';

	/// en: 'Completion status'
	String get completionStatus => 'Completion status';

	/// en: 'In-game hours'
	String get inGameHours => 'In-game hours';

	/// en: 'Please enter a valid number'
	String get pleaseEnterAValidNumber => 'Please enter a valid number';

	/// en: 'I recommend this game *'
	String get iRecommendThisGame => 'I recommend this game *';

	/// en: 'Select a game from your library...'
	String get selectAGameFromYourLibrary => 'Select a game from your library...';

	/// en: 'Completed (100%)'
	String get completed100 => 'Completed (100%)';

	/// en: 'Not Started (0%)'
	String get notStarted0 => 'Not Started (0%)';
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

	/// en: '{field} required'
	String get requiredField => '{field} required';

	/// en: 'Invalid email'
	String get invalidEmail => 'Invalid email';

	/// en: 'Min {n} char'
	String get minLength => 'Min {n} char';

	/// en: 'Invalid credentials'
	String get invalidCredentials => 'Invalid credentials';

	/// en: 'Login failed, please try again'
	String get loginFailed => 'Login failed, please try again';

	/// en: 'The app failed to start. Please restart and try again.'
	String get appFailedToStart => 'The app failed to start. Please restart and try again.';

	/// en: 'Game not found'
	String get gameNotFound => 'Game not found';

	/// en: 'Reviews not found'
	String get reviewsNotFound => 'Reviews not found';
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
