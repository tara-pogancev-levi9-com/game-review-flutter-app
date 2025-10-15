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

	/// en: 'Display Name'
	String get displayName => 'Display Name';

	/// en: 'No Image'
	String get noImage => 'No Image';

	/// en: 'Save Image'
	String get saveImage => 'Save Image';

	/// en: 'Add Images'
	String get addImages => 'Add Images';

	/// en: 'No images selected.'
	String get noImagesSelected => 'No images selected.';

	/// en: 'Choose Images.'
	String get chooseImages => 'Choose Images.';

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

	/// en: 'Avatar removed.'
	String get avatarRemoved => 'Avatar removed.';

	/// en: 'Missing API_URL environment variable'
	String get missingApiUrl => 'Missing API_URL environment variable';

	/// en: 'Error occurred. Try again later'
	String get registrationError => 'Error occurred. Try again later';

	/// en: 'Passwords do not match!'
	String get passwordMismatch => 'Passwords do not match!';

	/// en: 'Password must be at least 8 characters long!'
	String get passwordLength => 'Password must be at least 8 characters long!';

	/// en: 'Change Password'
	String get changePassword => 'Change Password';

	/// en: 'Add Friend'
	String get addFriend => 'Add Friend';

	/// en: 'Friends'
	String get friends => 'Friends';

	/// en: 'User data not loaded!'
	String get userDataNotLoaded => 'User data not loaded!';

	/// en: 'Password changed successfully.'
	String get passwordChanged => 'Password changed successfully.';

	/// en: 'Error when changing password.'
	String get errorChangingPassword => 'Error when changing password.';

	/// en: 'Save Profile'
	String get saveProfile => 'Save Profile';

	/// en: 'Enter bio'
	String get enterBio => 'Enter bio';

	/// en: 'Profile Info'
	String get profileInfo => 'Profile Info';

	/// en: 'Email address is not valid!'
	String get emailInvalid => 'Email address is not valid!';

	/// en: 'Registration successful!'
	String get registrationSuccessful => 'Registration successful!';

	/// en: 'The provided email is already registered.!'
	String get registrationEmailExistsError => 'The provided email is already registered.!';

	late final TranslationsGameDetailsEn gameDetails = TranslationsGameDetailsEn._(_root);
	late final TranslationsReviewsEn reviews = TranslationsReviewsEn._(_root);
	late final TranslationsActionsEn actions = TranslationsActionsEn._(_root);
	late final TranslationsNavigationEn navigation = TranslationsNavigationEn._(_root);

	/// en: 'No games found'
	String get NoGamesFound => 'No games found';

	/// en: 'Failed to load games'
	String get errorLoadingGames => 'Failed to load games';

	/// en: 'Failed to load more games'
	String get errorLoadingMoreGames => 'Failed to load more games';

	late final TranslationsErrorsEn errors = TranslationsErrorsEn._(_root);

	/// en: 'App failed to start:\n\n@{error}'
	String get appFailedToStart => 'App failed to start:\n\n@{error}';

	late final TranslationsLibraryEn library = TranslationsLibraryEn._(_root);
	late final TranslationsCommonEn common = TranslationsCommonEn._(_root);
	late final TranslationsBrandingEn branding = TranslationsBrandingEn._(_root);

	/// en: 'Avatar updated.'
	String get avatarUpdated => 'Avatar updated.';

	/// en: 'Profile updated.'
	String get profileUpdated => 'Profile updated.';

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
	String get failedToSaveReview => 'Failed to save review';

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

	late final TranslationsGameServiceEn gameService = TranslationsGameServiceEn._(_root);

	/// en: 'Review'
	String get gameReview => 'Review';

	/// en: 'Add Comment'
	String get addComment => 'Add Comment';

	/// en: 'Reviews not found'
	String get reviewsNotFound => 'Reviews not found';

	/// en: 'Would recommend'
	String get wouldRecommend => 'Would recommend';

	/// en: 'Would not recommend'
	String get wouldNotRecommend => 'Would not recommend';

	/// en: 'Likes'
	String get likes => 'Likes';

	/// en: 'h on record'
	String get playingRecord => 'h on record';

	late final TranslationsTimeEn time = TranslationsTimeEn._(_root);
	late final TranslationsDateTimeEn dateTime = TranslationsDateTimeEn._(_root);

	/// en: 'Games'
	String get gamesSection => 'Games';

	/// en: 'Reviews'
	String get reviewsSection => 'Reviews';

	/// en: 'Recommended'
	String get recommended => 'Recommended';

	/// en: 'Swipe to see more'
	String get swipeToSeeMore => 'Swipe to see more';

	/// en: 'No results found for "{{query}}"'
	String get noResultsFound => 'No results found for "{{query}}"';

	/// en: 'Retry'
	String get retry => 'Retry';
}

// Path: gameDetails
class TranslationsGameDetailsEn {
	TranslationsGameDetailsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Game already in Wishlist'
	String get gameAlreadyInWishlist => 'Game already in Wishlist';

	/// en: 'Failed to add to Wishlist'
	String get failedToAddToWishlist => 'Failed to add to Wishlist';

	/// en: 'Game already in Library'
	String get gameAlreadyInLibrary => 'Game already in Library';

	/// en: 'Failed to add to Library'
	String get failedToAddToLibrary => 'Failed to add to Library';

	/// en: 'Failed to remove from Wishlist'
	String get failedToRemoveFromWishlist => 'Failed to remove from Wishlist';

	/// en: 'Failed to remove from Library'
	String get failedToRemoveFromLibrary => 'Failed to remove from Library';

	/// en: 'Add review feature coming soon!'
	String get addReviewComingSoon => 'Add review feature coming soon!';

	/// en: 'Add to My Library'
	String get addToMyLibrary => 'Add to My Library';

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
	TranslationsReviewsEn._(this._root);

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
	TranslationsActionsEn._(this._root);

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

// Path: errors
class TranslationsErrorsEn {
	TranslationsErrorsEn._(this._root);

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

	/// en: 'Failed to fetch recent reviews'
	String get failedToFetchRecentReviews => 'Failed to fetch recent reviews';

	/// en: 'Failed to load home data'
	String get failedToLoadHome => 'Failed to load home data';

	/// en: 'Failed to load comments'
	String get failedToLoadComments => 'Failed to load comments';

	/// en: 'Authentication check failed'
	String get authenticationFail => 'Authentication check failed';

	/// en: 'Failed to process review'
	String get failedToProcessReview => 'Failed to process review';

	/// en: 'Unexpected response format from server'
	String get unexpectedResponseFormat => 'Unexpected response format from server';

	/// en: 'An error occurred. Please try again.'
	String get genericError => 'An error occurred. Please try again.';

	/// en: 'Failed to add review'
	String get failedToAddReview => 'Failed to add review';

	/// en: 'Failed to update review'
	String get failedToUpdateReview => 'Failed to update review';

	/// en: 'Failed to delete review'
	String get failedToDeleteReview => 'Failed to delete review';
}

// Path: library
class TranslationsLibraryEn {
	TranslationsLibraryEn._(this._root);

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

	/// en: 'Game already in library'
	String get gameAlreadyInLibrary => 'Game already in library';

	/// en: 'Game added to library'
	String get gameAddedToLibrary => 'Game added to library';

	/// en: 'Game not found in wishlist'
	String get gameNotFoundInWishlist => 'Game not found in wishlist';

	/// en: 'Game not found in library'
	String get gameNotFoundInLibrary => 'Game not found in library';

	/// en: 'Wishlist addition failed'
	String get wishlistAdditionFailed => 'Wishlist addition failed';

	/// en: 'Library addition failed'
	String get libraryAdditionFailed => 'Library addition failed';

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
	TranslationsCommonEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Go Back'
	String get goBack => 'Go Back';
}

// Path: branding
class TranslationsBrandingEn {
	TranslationsBrandingEn._(this._root);

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
	TranslationsGameServiceEn._(this._root);

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

// Path: time
class TranslationsTimeEn {
	TranslationsTimeEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'second/s ago'
	String get secondsAgo => 'second/s ago';

	/// en: 'minute/s ago'
	String get minutesAgo => 'minute/s ago';

	/// en: 'hour/s ago'
	String get hoursAgo => 'hour/s ago';

	/// en: 'day/s ago'
	String get daysAgo => 'day/s ago';

	/// en: 'week/s ago'
	String get weeksAgo => 'week/s ago';

	/// en: 'month/s ago'
	String get monthsAgo => 'month/s ago';

	/// en: 'year/s ago'
	String get yearsAgo => 'year/s ago';
}

// Path: dateTime
class TranslationsDateTimeEn {
	TranslationsDateTimeEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: '{days}d ago'
	String get daysAgo => '{days}d ago';

	/// en: '{hours}h ago'
	String get hoursAgo => '{hours}h ago';

	/// en: '{minutes}m ago'
	String get minutesAgo => '{minutes}m ago';

	/// en: 'just now'
	String get justNow => 'just now';
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
			case 'displayName': return 'Display Name';
			case 'noImage': return 'No Image';
			case 'saveImage': return 'Save Image';
			case 'addImages': return 'Add Images';
			case 'noImagesSelected': return 'No images selected.';
			case 'chooseImages': return 'Choose Images.';
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
			case 'avatarRemoved': return 'Avatar removed.';
			case 'missingApiUrl': return 'Missing API_URL environment variable';
			case 'registrationError': return 'Error occurred. Try again later';
			case 'passwordMismatch': return 'Passwords do not match!';
			case 'passwordLength': return 'Password must be at least 8 characters long!';
			case 'changePassword': return 'Change Password';
			case 'addFriend': return 'Add Friend';
			case 'friends': return 'Friends';
			case 'userDataNotLoaded': return 'User data not loaded!';
			case 'passwordChanged': return 'Password changed successfully.';
			case 'errorChangingPassword': return 'Error when changing password.';
			case 'saveProfile': return 'Save Profile';
			case 'enterBio': return 'Enter bio';
			case 'profileInfo': return 'Profile Info';
			case 'emailInvalid': return 'Email address is not valid!';
			case 'registrationSuccessful': return 'Registration successful!';
			case 'registrationEmailExistsError': return 'The provided email is already registered.!';
			case 'gameDetails.gameAlreadyInWishlist': return 'Game already in Wishlist';
			case 'gameDetails.failedToAddToWishlist': return 'Failed to add to Wishlist';
			case 'gameDetails.gameAlreadyInLibrary': return 'Game already in Library';
			case 'gameDetails.failedToAddToLibrary': return 'Failed to add to Library';
			case 'gameDetails.failedToRemoveFromWishlist': return 'Failed to remove from Wishlist';
			case 'gameDetails.failedToRemoveFromLibrary': return 'Failed to remove from Library';
			case 'gameDetails.addReviewComingSoon': return 'Add review feature coming soon!';
			case 'gameDetails.addToMyLibrary': return 'Add to My Library';
			case 'gameDetails.removeFromMyLibrary': return 'Remove from My Library';
			case 'gameDetails.addReview': return 'Add Review';
			case 'gameDetails.recommendText': return 'x of players recommend this game';
			case 'gameDetails.overall': return 'Overall';
			case 'gameDetails.details': return 'Details';
			case 'gameDetails.title': return 'Game Details';
			case 'gameDetails.developer': return 'Developer';
			case 'gameDetails.publisher': return 'Publisher';
			case 'gameDetails.released': return 'Released';
			case 'gameDetails.availableOn': return 'Available on';
			case 'gameDetails.overallRecommendation': return '{percentage}% of players recommend this game';
			case 'gameDetails.addToWishlist': return 'Add to Wishlist';
			case 'gameDetails.removeFromWishlist': return 'Remove from Wishlist';
			case 'gameDetails.addToLibrary': return 'Add to Library';
			case 'gameDetails.trackHours': return 'Track Hours';
			case 'gameDetails.hoursPlayed': return 'Hours Played';
			case 'gameDetails.completionPercentage': return 'Completion %';
			case 'gameDetails.lastPlayed': return 'Last Played';
			case 'gameDetails.isFavorite': return 'Favorite';
			case 'gameDetails.reviewsCount': return '{count} reviews';
			case 'gameDetails.wishlistCount': return '{count} in wishlist';
			case 'gameDetails.libraryCount': return '{count} in library';
			case 'gameDetails.noReviews': return 'No reviews yet';
			case 'gameDetails.noGenres': return 'No genres specified';
			case 'gameDetails.noPlatforms': return 'No platforms specified';
			case 'gameDetails.noDescription': return 'No description available';
			case 'gameDetails.noDeveloper': return 'Developer not specified';
			case 'gameDetails.noPublisher': return 'Publisher not specified';
			case 'gameDetails.noReleaseDate': return 'Release date not specified';
			case 'gameDetails.statistics': return 'Statistics';
			case 'gameDetails.recentReviews': return 'Recent reviews';
			case 'gameDetails.unknownUser': return 'Unknown User';
			case 'gameDetails.retry': return 'Retry';
			case 'gameDetails.reviewComingSoon': return 'Review functionality coming soon!';
			case 'gameDetails.shareComingSoon': return 'Share functionality coming soon!';
			case 'gameDetails.addedToWishlist': return 'Added to wishlist!';
			case 'gameDetails.removedFromWishlist': return 'Removed from wishlist!';
			case 'gameDetails.addedToLibrary': return 'Added to library!';
			case 'gameDetails.removedFromLibrary': return 'Removed from library!';
			case 'gameDetails.alreadyInLibrary': return 'Already in library!';
			case 'gameDetails.alreadyInWishlist': return 'Already in wishlist!';
			case 'gameDetails.loginRequiredWishlist': return 'Please log in to add games to your wishlist';
			case 'gameDetails.loginRequiredLibrary': return 'Please log in to add games to your library';
			case 'gameDetails.loginRequiredToView': return 'Please log in to view game details';
			case 'reviews.title': return 'Reviews';
			case 'reviews.addComment': return 'Add Comment';
			case 'reviews.like': return 'Like';
			case 'reviews.unlike': return 'Unlike';
			case 'reviews.reply': return 'Reply';
			case 'reviews.showMore': return 'Show More';
			case 'reviews.showLess': return 'Show Less';
			case 'reviews.hoursAgo': return '{hours}h ago';
			case 'reviews.daysAgo': return '{days}d ago';
			case 'reviews.weeksAgo': return '{weeks}w ago';
			case 'reviews.monthsAgo': return '{months}mo ago';
			case 'reviews.yearsAgo': return '{years}y ago';
			case 'reviews.justNow': return 'Just now';
			case 'reviews.playtimeHours': return 'Playtime: {hours} hours';
			case 'reviews.completionStatus': return 'Status: {status}';
			case 'reviews.recommended': return 'Recommended';
			case 'reviews.notRecommended': return 'Not Recommended';
			case 'actions.addToWishlist': return 'Add to Wishlist';
			case 'actions.removeFromWishlist': return 'Remove from Wishlist';
			case 'actions.addToLibrary': return 'Add to Library';
			case 'actions.removeFromLibrary': return 'Remove from Library';
			case 'actions.markAsFavorite': return 'Mark as Favorite';
			case 'actions.removeFromFavorites': return 'Remove from Favorites';
			case 'actions.trackProgress': return 'Track Progress';
			case 'actions.writeReview': return 'Write Review';
			case 'actions.shareGame': return 'Share Game';
			case 'navigation.home': return 'Home';
			case 'navigation.search': return 'Search';
			case 'navigation.library': return 'Library';
			case 'navigation.profile': return 'Profile';
			case 'NoGamesFound': return 'No games found';
			case 'errorLoadingGames': return 'Failed to load games';
			case 'errorLoadingMoreGames': return 'Failed to load more games';
			case 'errors.invalidCredentials': return 'Invalid credentials';
			case 'errors.loginFailed': return 'Login failed. Please try again.';
			case 'errors.requiredField': return '{field} required';
			case 'errors.invalidEmail': return 'Invalid email';
			case 'errors.minLength': return 'Min {n} char';
			case 'errors.appFailedToStart': return 'The app failed to start. Please restart and try again.';
			case 'errors.gameNotFound': return 'Game not found';
			case 'errors.reviewsNotFound': return 'Reviews not found';
			case 'errors.failedToFetchRecentReviews': return 'Failed to fetch recent reviews';
			case 'errors.failedToLoadHome': return 'Failed to load home data';
			case 'errors.failedToLoadComments': return 'Failed to load comments';
			case 'errors.authenticationFail': return 'Authentication check failed';
			case 'errors.failedToProcessReview': return 'Failed to process review';
			case 'errors.unexpectedResponseFormat': return 'Unexpected response format from server';
			case 'errors.genericError': return 'An error occurred. Please try again.';
			case 'errors.failedToAddReview': return 'Failed to add review';
			case 'errors.failedToUpdateReview': return 'Failed to update review';
			case 'errors.failedToDeleteReview': return 'Failed to delete review';
			case 'appFailedToStart': return 'App failed to start:\n\n@{error}';
			case 'library.latest': return 'Latest';
			case 'library.popular': return 'Popular';
			case 'library.ownedGames': return 'Owned Games';
			case 'library.wishlist': return 'Wishlist';
			case 'library.myLibrary': return 'My Library';
			case 'library.gameAlreadyInWishlist': return 'Game already in wishlist';
			case 'library.gameAddedToWishlist': return 'Game added to wishlist';
			case 'library.gameAlreadyInLibrary': return 'Game already in library';
			case 'library.gameAddedToLibrary': return 'Game added to library';
			case 'library.gameNotFoundInWishlist': return 'Game not found in wishlist';
			case 'library.gameNotFoundInLibrary': return 'Game not found in library';
			case 'library.wishlistAdditionFailed': return 'Wishlist addition failed';
			case 'library.libraryAdditionFailed': return 'Library addition failed';
			case 'library.reviewsNotFound': return 'Reviews not found';
			case 'library.failedToFetchGame': return 'Failed to fetch game';
			case 'library.failedToFetchGames': return 'Failed to fetch games';
			case 'library.failedToFetchGameStatistics': return 'Failed to fetch game statistics';
			case 'library.failedToFetchRecentReviews': return 'Failed to fetch recent reviews';
			case 'library.failedToAddToWishlist': return 'Failed to add to wishlist';
			case 'library.failedToRemoveFromWishlist': return 'Failed to remove from wishlist';
			case 'library.failedToAddToLibrary': return 'Failed to add to library';
			case 'library.failedToRemoveFromLibrary': return 'Failed to remove from library';
			case 'library.failedToUpdateGameProgress': return 'Failed to update game progress';
			case 'library.failedToFetchGameReviews': return 'Failed to fetch game reviews';
			case 'library.failedToFetchReviewComments': return 'Failed to fetch review comments';
			case 'library.failedToCreateReview': return 'Failed to create review';
			case 'library.failedToAddComment': return 'Failed to add comment';
			case 'library.failedToLikeReview': return 'Failed to like review';
			case 'library.failedToUnlikeReview': return 'Failed to unlike review';
			case 'library.userNotAuthenticated': return 'User not authenticated';
			case 'library.registrationEmailExistsError': return 'An account with this email already exists';
			case 'library.passwordLength': return 'Password must be at least 8 characters long';
			case 'library.confirmPassword': return 'Please confirm your password';
			case 'library.passwordMismatch': return 'Passwords do not match';
			case 'common.goBack': return 'Go Back';
			case 'branding.title': return 'PAW GAMES';
			case 'branding.tagline': return 'Discover. Rate. Share.';
			case 'branding.logoLabel': return 'App logo';
			case 'avatarUpdated': return 'Avatar updated.';
			case 'profileUpdated': return 'Profile updated.';
			case 'youHaveAlreadyReviewedThisGame': return 'You have already reviewed this game';
			case 'completed': return 'Completed';
			case 'notStarted': return 'Not started';
			case 'inProgress': return 'In progress';
			case 'abandoned': return 'Abandoned';
			case 'failedToSaveReview': return 'Failed to save review';
			case 'reviewAddedSuccessfully': return 'Review added successfully!';
			case 'reviewTitle': return 'Review title *';
			case 'reviewTitleIsRequired': return 'Review title is required';
			case 'reviewDescription': return 'Review description *';
			case 'reviewDescriptionIsRequired': return 'Review description is required';
			case 'prosCons': return 'Pros & Cons';
			case 'gamePros': return 'Game pros (comma-separated)';
			case 'gameCons': return 'Game cons (comma-separated)';
			case 'overallRating': return 'Overall Rating *';
			case 'individualRatings': return 'Individual Ratings';
			case 'miscellaneous': return 'Miscellaneous';
			case 'gameCompletion': return 'Game completion (%)';
			case 'completionStatus': return 'Completion status';
			case 'inGameHours': return 'In-game hours';
			case 'pleaseEnterAValidNumber': return 'Please enter a valid number';
			case 'iRecommendThisGame': return 'I recommend this game *';
			case 'selectAGameFromYourLibrary': return 'Select a game from your library...';
			case 'completed100': return 'Completed (100%)';
			case 'notStarted0': return 'Not Started (0%)';
			case 'gameService.noTokenWishlist': return 'Cannot add to wishlist - no token found';
			case 'gameService.noTokenLibrary': return 'Cannot add to library - no token found';
			case 'gameService.noTokenFetchWishlist': return 'Cannot fetch wishlist - no token found';
			case 'gameService.noTokenFetchLibrary': return 'Cannot fetch library - no token found';
			case 'gameService.noTokenRemoveWishlist': return 'Cannot remove from wishlist - no token found';
			case 'gameService.noTokenRemoveLibrary': return 'Cannot remove from library - no token found';
			case 'gameService.gameAddedToWishlistSuccess': return 'Game added to wishlist successfully';
			case 'gameService.gameAddedToLibrarySuccess': return 'Game added to library successfully';
			case 'gameService.failedToAddToWishlistStatus': return 'Failed to add to wishlist, status';
			case 'gameService.failedToAddToLibraryStatus': return 'Failed to add to library, status';
			case 'gameService.failedToFetchLatestGames': return 'Failed to fetch latest games';
			case 'gameService.failedToFetchPopularGames': return 'Failed to fetch popular games';
			case 'gameService.failedToAddGameToWishlist': return 'Failed to add game to wishlist';
			case 'gameService.failedToAddGameToLibrary': return 'Failed to add game to library';
			case 'gameService.failedToFetchWishlistGames': return 'Failed to fetch wishlist games';
			case 'gameService.failedToFetchLibraryGames': return 'Failed to fetch library games';
			case 'gameService.removedFromWishlist': return 'Removed from wishlist on server';
			case 'gameService.removedFromLibrary': return 'Removed from library on server';
			case 'gameService.failedToRemoveFromWishlist': return 'Failed to remove from wishlist';
			case 'gameService.failedToRemoveFromLibrary': return 'Failed to remove from library';
			case 'gameReview': return 'Review';
			case 'addComment': return 'Add Comment';
			case 'reviewsNotFound': return 'Reviews not found';
			case 'wouldRecommend': return 'Would recommend';
			case 'wouldNotRecommend': return 'Would not recommend';
			case 'likes': return 'Likes';
			case 'playingRecord': return 'h on record';
			case 'time.secondsAgo': return 'second/s ago';
			case 'time.minutesAgo': return 'minute/s ago';
			case 'time.hoursAgo': return 'hour/s ago';
			case 'time.daysAgo': return 'day/s ago';
			case 'time.weeksAgo': return 'week/s ago';
			case 'time.monthsAgo': return 'month/s ago';
			case 'time.yearsAgo': return 'year/s ago';
			case 'dateTime.daysAgo': return '{days}d ago';
			case 'dateTime.hoursAgo': return '{hours}h ago';
			case 'dateTime.minutesAgo': return '{minutes}m ago';
			case 'dateTime.justNow': return 'just now';
			case 'gamesSection': return 'Games';
			case 'reviewsSection': return 'Reviews';
			case 'recommended': return 'Recommended';
			case 'swipeToSeeMore': return 'Swipe to see more';
			case 'noResultsFound': return 'No results found for "{{query}}"';
			case 'retry': return 'Retry';
			default: return null;
		}
	}
}

