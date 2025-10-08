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
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

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

	late final TranslationsNavigationEn navigation = TranslationsNavigationEn._(_root);
}

// Path: navigation
class TranslationsNavigationEn {
	TranslationsNavigationEn._(this._root);

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

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'welcome': return 'Welcome!';
			case 'greeting': return 'Hello, {name}!';
			case 'changeLanguage': return 'Change Language';
			case 'appTitle': return 'Game Review App';
			case 'home': return 'Home';
			case 'settings': return 'Settings';
			case 'searchGames': return 'Search for games';
			case 'favoriteGames': return 'Favorite Games';
			case 'recentReviews': return 'Recent Reviews';
			case 'addReview': return 'Add Review';
			case 'myProfile': return 'My Profile';
			case 'logout': return 'Logout';
			case 'login': return 'Login';
			case 'goodbye': return 'Goodbye!';
			case 'king': return 'King';
			case 'register': return 'Register';
			case 'email': return 'Email';
			case 'password': return 'Password';
			case 'confirmPassword': return 'Confirm Password';
			case 'submit': return 'Submit';
			case 'username': return 'Username';
			case 'profileSettings': return 'Profile Settings';
			case 'notifications': return 'Notifications';
			case 'back': return 'Back';
			case 'next': return 'Next';
			case 'discover': return 'Discover';
			case 'details': return 'Details';
			case 'ratings': return 'Ratings';
			case 'evaluation': return 'Evaluation';
			case 'overall': return 'Overall';
			case 'gameplay': return 'Gameplay';
			case 'graphics': return 'Graphics';
			case 'sound': return 'Sound';
			case 'story': return 'Story';
			case 'value': return 'Value';
			case 'pros': return 'Pros';
			case 'cons': return 'Cons';
			case 'media': return 'Media';
			case 'discussions': return 'Discussions';
			case 'save': return 'Save';
			case 'edit': return 'Edit';
			case 'delete': return 'Delete';
			case 'update': return 'Update';
			case 'navigation.home': return 'Home';
			case 'navigation.search': return 'Search';
			case 'navigation.library': return 'Library';
			case 'navigation.profile': return 'Profile';
			default: return null;
		}
	}
}

