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

	late final TranslationsGameDetailsEn gameDetails = TranslationsGameDetailsEn.internal(_root);
	late final TranslationsReviewsEn reviews = TranslationsReviewsEn.internal(_root);
	late final TranslationsActionsEn actions = TranslationsActionsEn.internal(_root);
	late final TranslationsNavigationEn navigation = TranslationsNavigationEn.internal(_root);
	late final TranslationsErrorsEn errors = TranslationsErrorsEn.internal(_root);
	late final TranslationsCommonEn common = TranslationsCommonEn.internal(_root);
	late final TranslationsBrandingEn branding = TranslationsBrandingEn.internal(_root);
}

// Path: gameDetails
class TranslationsGameDetailsEn {
	TranslationsGameDetailsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Game Details'
	String get title => 'Game Details';

	/// en: 'Developer'
	String get developer => 'Developer';

	/// en: 'Publisher'
	String get publisher => 'Publisher';

	/// en: 'Released'
	String get released => 'Released';

	/// en: 'Available on'
	String get availableOn => 'Available on';

	/// en: '{percentage}% of players recommend this game'
	String get overallRecommendation => '{percentage}% of players recommend this game';

	/// en: 'Add to Wishlist'
	String get addToWishlist => 'Add to Wishlist';

	/// en: 'Remove from Wishlist'
	String get removeFromWishlist => 'Remove from Wishlist';

	/// en: 'Add to Library'
	String get addToLibrary => 'Add to Library';

	/// en: 'Track Hours'
	String get trackHours => 'Track Hours';

	/// en: 'Hours Played'
	String get hoursPlayed => 'Hours Played';

	/// en: 'Completion %'
	String get completionPercentage => 'Completion %';

	/// en: 'Last Played'
	String get lastPlayed => 'Last Played';

	/// en: 'Favorite'
	String get isFavorite => 'Favorite';

	/// en: '{count} reviews'
	String get reviewsCount => '{count} reviews';

	/// en: '{count} in wishlist'
	String get wishlistCount => '{count} in wishlist';

	/// en: '{count} in library'
	String get libraryCount => '{count} in library';

	/// en: 'No reviews yet'
	String get noReviews => 'No reviews yet';

	/// en: 'No genres specified'
	String get noGenres => 'No genres specified';

	/// en: 'No platforms specified'
	String get noPlatforms => 'No platforms specified';

	/// en: 'No description available'
	String get noDescription => 'No description available';

	/// en: 'Developer not specified'
	String get noDeveloper => 'Developer not specified';

	/// en: 'Publisher not specified'
	String get noPublisher => 'Publisher not specified';

	/// en: 'Release date not specified'
	String get noReleaseDate => 'Release date not specified';

	/// en: 'Statistics'
	String get statistics => 'Statistics';

	/// en: 'Recent reviews'
	String get recentReviews => 'Recent reviews';

	/// en: 'Unknown User'
	String get unknownUser => 'Unknown User';

	/// en: 'Retry'
	String get retry => 'Retry';

	/// en: 'Review functionality coming soon!'
	String get reviewComingSoon => 'Review functionality coming soon!';

	/// en: 'Share functionality coming soon!'
	String get shareComingSoon => 'Share functionality coming soon!';

	/// en: 'Added to wishlist!'
	String get addedToWishlist => 'Added to wishlist!';

	/// en: 'Removed from wishlist!'
	String get removedFromWishlist => 'Removed from wishlist!';

	/// en: 'Added to library!'
	String get addedToLibrary => 'Added to library!';

	/// en: 'Removed from library!'
	String get removedFromLibrary => 'Removed from library!';

	/// en: 'Already in library!'
	String get alreadyInLibrary => 'Already in library!';

	/// en: 'Already in wishlist!'
	String get alreadyInWishlist => 'Already in wishlist!';

	/// en: 'Please log in to add games to your wishlist'
	String get loginRequiredWishlist => 'Please log in to add games to your wishlist';

	/// en: 'Please log in to add games to your library'
	String get loginRequiredLibrary => 'Please log in to add games to your library';

	/// en: 'Please log in to view game details'
	String get loginRequiredToView => 'Please log in to view game details';
}

// Path: reviews
class TranslationsReviewsEn {
	TranslationsReviewsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Reviews'
	String get title => 'Reviews';

	/// en: 'Add Comment'
	String get addComment => 'Add Comment';

	/// en: 'Like'
	String get like => 'Like';

	/// en: 'Unlike'
	String get unlike => 'Unlike';

	/// en: 'Reply'
	String get reply => 'Reply';

	/// en: 'Show More'
	String get showMore => 'Show More';

	/// en: 'Show Less'
	String get showLess => 'Show Less';

	/// en: '{hours}h ago'
	String get hoursAgo => '{hours}h ago';

	/// en: '{days}d ago'
	String get daysAgo => '{days}d ago';

	/// en: '{weeks}w ago'
	String get weeksAgo => '{weeks}w ago';

	/// en: '{months}mo ago'
	String get monthsAgo => '{months}mo ago';

	/// en: '{years}y ago'
	String get yearsAgo => '{years}y ago';

	/// en: 'Just now'
	String get justNow => 'Just now';

	/// en: 'Playtime: {hours} hours'
	String get playtimeHours => 'Playtime: {hours} hours';

	/// en: 'Status: {status}'
	String get completionStatus => 'Status: {status}';

	/// en: 'Recommended'
	String get recommended => 'Recommended';

	/// en: 'Not Recommended'
	String get notRecommended => 'Not Recommended';
}

// Path: actions
class TranslationsActionsEn {
	TranslationsActionsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Add to Wishlist'
	String get addToWishlist => 'Add to Wishlist';

	/// en: 'Remove from Wishlist'
	String get removeFromWishlist => 'Remove from Wishlist';

	/// en: 'Add to Library'
	String get addToLibrary => 'Add to Library';

	/// en: 'Remove from Library'
	String get removeFromLibrary => 'Remove from Library';

	/// en: 'Mark as Favorite'
	String get markAsFavorite => 'Mark as Favorite';

	/// en: 'Remove from Favorites'
	String get removeFromFavorites => 'Remove from Favorites';

	/// en: 'Track Progress'
	String get trackProgress => 'Track Progress';

	/// en: 'Write Review'
	String get writeReview => 'Write Review';

	/// en: 'Share Game'
	String get shareGame => 'Share Game';
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

	/// en: 'Failed to fetch game'
	String get failedToFetchGame => 'Failed to fetch game';

	/// en: 'Failed to fetch games'
	String get failedToFetchGames => 'Failed to fetch games';

	/// en: 'Failed to fetch game statistics'
	String get failedToFetchGameStatistics => 'Failed to fetch game statistics';

	/// en: 'Failed to fetch recent reviews'
	String get failedToFetchRecentReviews => 'Failed to fetch recent reviews';

	/// en: 'Failed to add to wishlist'
	String get failedToAddToWishlist => 'Failed to add to wishlist';

	/// en: 'Failed to remove from wishlist'
	String get failedToRemoveFromWishlist => 'Failed to remove from wishlist';

	/// en: 'Failed to add to library'
	String get failedToAddToLibrary => 'Failed to add to library';

	/// en: 'Failed to remove from library'
	String get failedToRemoveFromLibrary => 'Failed to remove from library';

	/// en: 'Failed to update game progress'
	String get failedToUpdateGameProgress => 'Failed to update game progress';

	/// en: 'Failed to fetch game reviews'
	String get failedToFetchGameReviews => 'Failed to fetch game reviews';

	/// en: 'Failed to fetch review comments'
	String get failedToFetchReviewComments => 'Failed to fetch review comments';

	/// en: 'Failed to create review'
	String get failedToCreateReview => 'Failed to create review';

	/// en: 'Failed to add comment'
	String get failedToAddComment => 'Failed to add comment';

	/// en: 'Failed to like review'
	String get failedToLikeReview => 'Failed to like review';

	/// en: 'Failed to unlike review'
	String get failedToUnlikeReview => 'Failed to unlike review';

	/// en: 'User not authenticated'
	String get userNotAuthenticated => 'User not authenticated';

	/// en: 'An account with this email already exists'
	String get registrationEmailExistsError => 'An account with this email already exists';

	/// en: 'Password must be at least 8 characters long'
	String get passwordLength => 'Password must be at least 8 characters long';

	/// en: 'Please confirm your password'
	String get confirmPassword => 'Please confirm your password';

	/// en: 'Passwords do not match'
	String get passwordMismatch => 'Passwords do not match';
}

// Path: common
class TranslationsCommonEn {
	TranslationsCommonEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Go Back'
	String get goBack => 'Go Back';
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
