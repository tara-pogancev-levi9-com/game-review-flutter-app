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


