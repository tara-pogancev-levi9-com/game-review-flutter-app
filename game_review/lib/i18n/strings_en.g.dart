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
  static Translations of(BuildContext context) =>
      InheritedLocaleData.of<AppLocale, Translations>(context).translations;

  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  Translations({
    Map<String, Node>? overrides,
    PluralResolver? cardinalResolver,
    PluralResolver? ordinalResolver,
    TranslationMetadata<AppLocale, Translations>? meta,
  }) : assert(
         overrides == null,
         'Set "translation_overrides: true" in order to enable this feature.',
       ),
       $meta =
           meta ??
           TranslationMetadata(
             locale: AppLocale.en,
             overrides: overrides ?? {},
             cardinalResolver: cardinalResolver,
             ordinalResolver: ordinalResolver,
           );

  /// Metadata for the translations of <en>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  late final Translations _root = this; // ignore: unused_field

  Translations $copyWith({
    TranslationMetadata<AppLocale, Translations>? meta,
  }) => Translations(meta: meta ?? this.$meta);

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
  String get dicsover => 'Discover';

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

  String get registrationError => "Error occurred. Try again later";
  String get passwordMismatch => "Passwords do not match!";
  String get passwordLength => "Password must be at least 8 characters long!!";
  String get emailInvalid => "Email address is not valid!";
  String get registrationSuccessful => "Registration successful!";
  String get registrationEmailExistsError => "The provided email is already registered.!";
}
