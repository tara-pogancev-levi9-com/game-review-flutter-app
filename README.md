# Game Review Flutter App

A social app for game reviewing built with Flutter.

## Getting Started

### Prerequisites
- Flutter (latest stable version)
- iOS Simulator (for iOS development)
- Android Emulator (for Android development)
- Xcode (for iOS development)
- Android Studio (for Android development)

### Installation

1. Clone the repository:
```bash
git clone https://github.com/tara-pogancev-levi9-com/game-review-flutter-app.git
cd game-review-flutter-app
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the app:
```bash
flutter run
```

### Development Setup
- Make sure to run `flutter pub get` after pulling new changes
- Don't commit any build artifacts or IDE-specific files
- The `.gitignore` file is set up to handle most common files that shouldn't be committed

### Project Structure
- `lib/` - Contains the main Dart code for the application
- `test/` - Contains test files
- `android/` - Android-specific code
- `ios/` - iOS-specific code
- `assets/` - Contains images, fonts, and other static files

## Contributing
1. Create a new branch for your feature
2. Make your changes
3. Open a Pull Request to the main branch

## Important Notes
- Do not commit any sensitive information or secrets
- Keep the codebase clean and follow Flutter best practices
- Run tests before submitting PRs

# 🛠️ Developer Notes: Dependency Injection

This project uses the **`get_it`** package for Dependency Injection.

## **Setting and Getting Dependencies**

All dependencies must be **registered** inside the `setup()` method in `common/injection_container.dart`. You'll use the `get_it` instance, typically named **`locator`**, to perform the registration.

To **retrieve** a dependency from anywhere in your code, use `GetIt.instance<Example>()`.

---

### **1. Singleton**
A **Singleton** instance is created **once** when the application starts and is reused globally.

| Action | Code Example |
| :--- | :--- |
| **Register** (in `setup()`) | `locator.registerSingleton<Example>(Example());` |
| **Retrieve** (where needed) | `var myAppModel = GetIt.instance<Example>();` |

---

### **2. Factory**
A **Factory** creates a **new instance** every single time you request it.

| Action | Code Example |
| :--- | :--- |
| **Register** (in `setup()`) | `locator.registerFactory<Example>(() => Example());` |
| **Retrieve** (where needed) | `var myAppModel = GetIt.instance<Example>();` |

---

### **3. Lazy Singleton**
A **Lazy Singleton** instance is created **only on the first request** and is then reused globally.

| Action | Code Example |
| :--- | :--- |
| **Register** (in `setup()`) | `locator.registerLazySingleton<Example>(() => Example());` |
| **Retrieve** (where needed) | `var myAppModel = GetIt.instance<Example>();` |


# 🛠️ Developer Notes: State Management with Cubit

## What is a Cubit?
A **Cubit** is a simplified state management solution from the **BLoC** library.  
Think of it as a manager that:
* Holds the current state of a feature (like `Loading`, `Success`, `Error`)
* Provides methods to change that state
* Automatically notifies the UI when state changes

---

## The Cubit Flow
User Action → Cubit Method → Emit New State → UI Rebuilds
  ↓              ↓                ↓              ↓
tap button   fetchGames()   emit(Loading)   show spinner
               ↓              ↓
             emit(Success)   show list

## When to Create a New Cubit?

**Good Separation**
* `AuthCubit` - login, register, logout
* `GamesCubit` - fetch games, search, filter
* `ReviewsCubit` - fetch/submit reviews
* `FavoritesCubit` - manage favorite games
* `UserProfileCubit` - user profile management

**Don’t Do This**
* `AppCubit` - handles everything (too big!)
* `ButtonCubit` - too small, use `StatefulWidget` instead

**Rule**: If it manages data from an API or database, it probably needs a Cubit.  

## 1. Define All Possible States
abstract class MyState extends Equatable {
  @override
  List<Object?> get props => [];
}

class Loading extends MyState {}

class Success extends MyState {
  final String data;
  Success(this.data);

  @override
  List<Object?> get props => [data];
}

class Error extends MyState {
  final String message;
  Error(this.message);

  @override
  List<Object?> get props => [message];
}
## 2. Create Cubit with Methods
class MyCubit extends Cubit<MyState> {
  MyCubit() : super(Loading());

  Future<void> doSomething() async {
    emit(Loading());        // Start loading
    try {
      // Do work...
      emit(Success("Data loaded successfully!"));  // Success
    } catch (e) {
      emit(Error(e.toString()));                   // Handle error
    }
  }
}
## Example with repository:
class UsersCubit extends Cubit<CubitUserStates> {
  final UsersRepo usersRepo = UsersRepo();

  UsersCubit() : super(CubitUsersLoading()) {
    getData();
  }

  Future<void> getData() async {
    List<UsersModel> users = await usersRepo.getUsers();
    emit(CubitUsersLoaded(users: users));
  }
}
## 3. Listen in UI
BlocBuilder<MyCubit, MyState>(
  builder: (context, state) {
    if (state is Loading) {
      return CircularProgressIndicator();
    } else if (state is Success) {
      return Text(state.data);
    } else if (state is Error) {
      return Text("Error: ${state.message}");
    } else {
      return SizedBox.shrink();
    }
  },
)

## Using BlocBuilder vs BlocListener
* BlocBuilder: When you need to rebuild UI based on state
* BlocListener: When you need to perform actions (show snackbar, navigate)
* BlocConsumer: Both combined

## Pattern 1: Initial Load
BlocProvider<GamesCubit>(
    create: (context) => GamesCubit()..fetchGames(), // Load immediately
    child: MyScreen(),
)

## Pattern 2: Load on Button Press
ElevatedButton(
    onPressed: () {
        context.read<GamesCubit>().fetchGames(); // Load when needed
    },
    child: Text('Refresh'),
)

## Pattern 3: Multiple Actions
class GamesCubit extends Cubit<GamesState> {
    Future<void> fetchGames() async { /* ... */ }
    Future<void> searchGames(String query) async { /* ... */ }
    Future<void> filterByRating(double rating) async { /* ... */ }
    Future<void> sortGames(SortType type) async { /* ... */ }
}

## Pattern 4: Listen for Side Effects
BlocListener<AuthCubit, AuthState>(
    listener: (context, state) {
        if (state is AuthSuccess) {
            Navigator.pushReplacement(context, HomeScreen());
        }
        if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
            );
        }
    },
    child: LoginForm(),
)

## Summary
* Cubit = State manager with methods
* State = Current condition (Loading, Success, Error)
* Emit = Change to new state
* BlocBuilder = Rebuild UI when state changes
* BlocListener = Do actions when state changes (navigate, show snackbar)







