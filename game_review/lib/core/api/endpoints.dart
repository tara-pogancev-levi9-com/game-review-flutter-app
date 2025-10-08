class Endpoints {
  static const String authSignup = 'auth/v1/signup';
  static const String authToken = 'auth/v1/token'; // append ?grant_type=password where needed
  static const String authUser = 'auth/v1/user';
  static const String authLogout = 'auth/v1/logout';

  static const String games = 'rest/v1/games';
  static const String userWishlist = 'rest/v1/user_wishlist';
  static const String userLibrary = 'rest/v1/user_library';
  static const String gameReviews = 'rest/v1/game_reviews';
  static const String users = 'rest/v1/users';

  static const int limitLatestGames = 15;
  static const int limitPopularGames = 15;
  static const int limitRecentReviews = 10;
  static const int limitDiscoverGames = 8;

  // TODO: Maybe
  // Common query fragments (optional helpers)
  // Use queryParameters in ApiClient.get to set select/order/limit where needed.
  // Example: { 'select': '*,games(*)', 'order': 'created_at.desc', 'limit': 10 }
}
