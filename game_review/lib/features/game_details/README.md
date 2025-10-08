# Game Details Feature

This feature provides a comprehensive game details page with the following components:

## Components

### 1. GameDetailsPage
Main page that orchestrates all components and manages state using BLoC pattern.

**Features:**
- Authentication check with fallback UI for non-authenticated users
- Gradient background (purple to black)
- Custom scrollable layout with SliverAppBar
- Game cover image in expandable header (220px height)
- Retry functionality on error

### 2. GameDetailsCubit
State management for game details, including:
- Loading game information from API
- Managing wishlist/library status (toggle add/remove)
- Handling user interactions
- Optimized local state updates (no page refresh on toggle actions)
- Success/error message management

**Methods:**
- `loadGameDetails(String gameId)` - Loads game data and user's wishlist/library status
- `toggleWishlist(String gameId)` - Adds or removes game from wishlist
- `toggleLibrary(String gameId)` - Adds or removes game from library

### 3. Widgets

#### GameContentWidget
- Displays game cover image in SliverAppBar
- Shows game title, developer, publisher
- Displays release date, platforms, and genres
- Contains PopupMenu (3-dot menu) with:
  - Add/Remove from Wishlist (toggle with dynamic text)
  - Add/Remove from Library (toggle with dynamic text)
  - Write Review (shows "coming soon" message)
  - Share Game (shows "coming soon" message)

#### GameStatsWidget
- Shows game statistics (reviews count, wishlist count, library count)
- Displays recommendation percentage (currently hardcoded to 85%)
- Compact horizontal layout with dividers
- **Status:** Widget is fully implemented but commented out in GameDetailsPage (lines 212-217)
- **Note:** Not part of the original Figma design, but implemented for potential future use

#### ReviewsSectionWidget
- Displays recent reviews (limit: 5)
- Shows user avatars (placeholder 'U' when user data unavailable)
- Displays star ratings (converts 10-point scale to 5-star display)
- Shows review title, content (max 3 lines), and timestamp
- Includes like/comment buttons (not yet functional)
- Loading, error, and empty states

## Usage

```dart
import 'package:game_review/features/game_details/game_details.dart';

Navigator.of(context).push(
  MaterialPageRoute(
    builder: (context) => GameDetailsPage(
      gameId: 'your-game-id',
    ),
  ),
);
```

## Dependencies

- `flutter_bloc` - State management
- `equatable` - State comparison
- `get_it` - Dependency injection
- `GameService` - API calls for game data and wishlist/library operations
- `ReviewService` - API calls for game reviews
- `SecureStorage` - Token management

## Features Implemented

✅ Game information display  
✅ Wishlist toggle (add/remove)  
✅ Library toggle (add/remove)  
✅ Optimized state management (no full page reload on toggle actions)  
✅ Success/error snackbar notifications  
✅ Auto-clear previous snackbars  
✅ Reviews section with loading/error/empty states  
✅ Responsive design  
✅ Error handling with retry functionality  
✅ Loading states  
✅ Authentication check with non-authenticated user UI  
⚠️ Statistics display (widget exists but is commented out)  
⚠️ Overall recommendation percentage (hardcoded to 99% in GameContentWidget)

## Technical Highlights

- **Optimized Performance**: Local state updates instead of API reload on wishlist/library actions
- **Platform Selection**: When adding to library, uses first available platform from game data
- **Smart Snackbars**: Auto-dismiss previous notifications when new actions occur
- **Error Handling**: Specific error messages for different failure scenarios
- **Responsive Date Formatting**: Reviews show relative time (e.g., "2h ago", "5d ago")

## Known Limitations

- **Platform Selection**: Currently uses first available platform when adding to library (no user selection)
- **Overall Rating**: Hardcoded to 99% in GameContentWidget (line 182)
- **Stats Widget**: Recommendation percentage in GameStatsWidget hardcoded to 85%
- **User Data**: Reviews show placeholder avatar 'U' and "Unknown User" label
- **Like Counts**: Review like counts hardcoded to 0

## TODO

- [ ] Implement dynamic overall recommendation percentage (remove hardcoded 99%)
- [ ] Enable GameStatsWidget in the main page (if added to Figma design)
- [ ] Implement like/review functionality
- [ ] Add navigation to review writing page
- [ ] Add platform selection dialog for library (currently uses first available)
- [ ] Implement progress tracking
- [ ] Add hours tracking functionality
- [ ] Add game search/filter functionality
- [ ] Fetch and display actual user data in reviews
- [ ] Implement review detail page navigation
- [ ] Add "Show More" button for reviews to see all reviews
