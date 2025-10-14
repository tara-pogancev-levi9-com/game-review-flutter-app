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

	/// en: 'Share'
	String get share => 'Share';

	/// en: 'Check out this game!'
	String get shareSubject => 'Check out this game!';

	/// en: 'Hey! Check out this cool game I found on PawGames! It's called '%s'. :)'
	String get shareMessage => 'Hey! Check out this cool game I found on PawGames! It\'s called \'%s\'. :)';

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

	late final TranslationsGameDetailsEn gameDetails = TranslationsGameDetailsEn.internal(_root);
	late final TranslationsReviewsEn reviews = TranslationsReviewsEn.internal(_root);
	late final TranslationsActionsEn actions = TranslationsActionsEn.internal(_root);
	late final TranslationsNavigationEn navigation = TranslationsNavigationEn.internal(_root);

	/// en: 'No games found'
	String get NoGamesFound => 'No games found';

	/// en: 'Failed to load games'
	String get errorLoadingGames => 'Failed to load games';

	/// en: 'Failed to load more games'
	String get errorLoadingMoreGames => 'Failed to load more games';

	late final TranslationsErrorsEn errors = TranslationsErrorsEn.internal(_root);

	/// en: 'App failed to start:\n\n@{error}'
	String get appFailedToStart => 'App failed to start:\n\n@{error}';

	late final TranslationsLibraryEn library = TranslationsLibraryEn.internal(_root);
	late final TranslationsCommonEn common = TranslationsCommonEn.internal(_root);
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

	late final TranslationsGameServiceEn gameService = TranslationsGameServiceEn.internal(_root);

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

	late final TranslationsTimeEn time = TranslationsTimeEn.internal(_root);
	late final TranslationsDateTimeEn dateTime = TranslationsDateTimeEn.internal(_root);
}

// Path: gameDetails
class TranslationsGameDetailsEn {
	TranslationsGameDetailsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Game already in Wishlist'
	String get gameAlreadyInWishlist => 'Game already in Wishlist';

	/// en: 'Failed to add to Wishlist'
	String get failedToAddToWishlist => 'Failed to add to Wishlist';

	/// en: 'Failed to add to Share game'
	String get failedToShare => 'Failed to add to Share game';

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

	/// en: '%d%% of players recommend this game'
	String get overallRecommendation => '%d%% of players recommend this game';

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

	/// en: 'Failed to share game: %s'
	String get failedToShareGame => 'Failed to share game: %s';
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

	/// en: 'Invalid credentials'
	String get invalidCredentials => 'Invalid credentials';

	/// en: 'Login failed. Please try again.'
	String get loginFailed => 'Login failed. Please try again.';

	/// en: '%s required'
	String get requiredField => '%s required';

	/// en: 'Invalid email'
	String get invalidEmail => 'Invalid email';

	/// en: 'Min %d char'
	String get minLength => 'Min %d char';

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

// Path: time
class TranslationsTimeEn {
	TranslationsTimeEn.internal(this._root);

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
	TranslationsDateTimeEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: '%d days ago'
	String get daysAgo => '%d days ago';

	/// en: '%d hours ago'
	String get hoursAgo => '%d hours ago';

	/// en: '%d minutes ago'
	String get minutesAgo => '%d minutes ago';

	/// en: 'just now'
	String get justNow => 'just now';
}
