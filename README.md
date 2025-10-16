# :video_game: Game Review - A Social App for Gamers

A modern, high-performance social media platform for game reviewing, built with Flutter and a clean, scalable architecture.

## :sparkles: Features

* **User Authentication**: Secure user registration and login flow.
* **Home Feed**: A dynamic feed to discover new games and read recent community reviews.
* **Game Library & Wishlist**: Users can manage their personal game collection and a wishlist of titles they want to play.
* **In-Depth Reviews**: A comprehensive form for users to write detailed reviews, including multiple rating categories, pros/cons, playtime, and completion status.
* **User Profiles**: A social hub to view user information and (in the future) their activity and friends.
* **Comments & Discussions**: Users can comment on reviews to foster community engagement.

## :hammer_and_wrench: Technical Stack & Architecture

This project is built with a modern tech stack and adheres to **Clean Architecture** principles to ensure separation of concerns, testability, and maintainability.

* **Framework**: Flutter
* **State Management**: `flutter_bloc` (using Cubits)
* **Backend**: Supabase (via custom REST API calls)
* **Networking**: `dio` (with interceptors for auth)
* **Code Generation**: `freezed` for immutable states and models, `json_serializable` for JSON parsing, and `slang` for localization.
* **Dependency Injection**: `get_it` (Service Locator pattern)
* **Storage**: `encrypt_shared_preferences` for secure local storage of JWT tokens.

### Architecture Overview

The application is divided into three main layers:

1.  **UI / Presentation Layer** (`features/.../pages`): Contains the Flutter widgets. It listens to state changes from the BLoC layer and sends user events to it.
2.  **Business Logic Layer (BLoC)** (`features/.../bloc`): Contains the `Cubits` that manage the application's state. It receives events from the UI, processes them by interacting with the Data Layer, and emits new states.
3.  **Data Layer** (`common/services` & `core/api`): Contains the `Services` which act as a single source of truth for data operations, and the `ApiClient` which handles all network communication.

---

## Getting Started

### Prerequisites
* Flutter (latest stable version recommended)
* An IDE like VS Code or Android Studio
* An iOS Simulator or Android Emulator

### Installation

1.  **Clone the repository**:
    ```bash
    git clone [https://github.com/tara-pogancev-levi9-com/game-review-flutter-app.git](https://github.com/tara-pogancev-levi9-com/game-review-flutter-app.git)
    cd game-review-flutter-app
    ```

2.  **Create an Environment File**:
    This project uses a `.env` file for environment variables. Create a file named `.env` in the project root and populate it with the necessary keys. Use `.env.example` as a template:

    ```ini
    # .env
    API_URL=YOUR_SUPABASE_API_URL
    API_KEY=YOUR_SUPABASE_ANON_KEY
    ENCRYPTION_KEY=YOUR_16_CHARACTER_RANDOM_ENCRYPTION_KEY
    ```
    > **Note**: The `ENCRYPTION_KEY` must be a strong, randomly generated string of 16 characters.

3.  **Install dependencies**:
    ```bash
    flutter pub get
    ```

4.  **Run Code Generation**:
    This project uses code generation for models, states, and localization. You **must** run this command whenever you change a file annotated with `@freezed`, `@JsonSerializable`, or update the translation files.
    ```bash
    flutter pub run build_runner build --delete-conflicting-outputs
    ```

5.  **Run the app**:
    ```bash
    flutter run
    ```

---

## :building_construction: Project Structure

The `lib/` directory is organized following Clean Architecture principles:

* **`lib/core/`**: Contains application-wide, low-level components like the `ApiClient` and `SecureStorage`. These have no external dependencies from other layers.
* **`lib/common/`**: Contains code that is shared across multiple features. This includes reusable widgets, common BLoCs (`GamesCubit`), shared models (`GameModel`), and core services (`GameService`).
* **`lib/features/`**: Contains the self-contained feature modules of the app. Each feature folder (e.g., `auth`, `home_screen`, `library_screen`) contains its own UI (pages/widgets) and state management (bloc).
* **`lib/i18n/`**: Contains localization files managed by the `slang` package.
* **`lib/main.dart`**: The entry point of the application, responsible for initialization of dependencies, localization, and the theme.

---

### Development Setup
- Make sure to run `flutter pub get` after pulling new changes
- Don't commit any build artifacts or IDE-specific files
- The `.gitignore` file is set up to handle most common files that shouldn't be committed

## :handshake: Contributing

1.  Create a new branch for your feature: `git checkout -b feature/your-feature-name`
2.  Make your changes.
3.  Ensure you run the code generator if you've modified models or states.
4.  Commit your changes and open a Pull Request to the `main` branch.

### Important Notes

* **Never commit secrets**: The `.env` file is listed in `.gitignore` and should never be committed.
* **Code Generation is Mandatory**: If your build fails or you see errors related to `.freezed.dart` or `.g.dart` files, you almost certainly need to run the build_runner command.
* **Follow Existing Patterns**: When adding new features, follow the established architectural patterns (Page -> Cubit -> Service).

# :hammer_and_wrench: Developer Notes: Dependency Injection

This project uses the **`get_it`** package for Dependency Injection.

## **Setting and Getting Dependencies**

All dependencies must be **registered** inside the `setupDependencies()` method in `common/injection_container.dart`. You'll use the `get_it` instance, named **`locator`**, to perform the registration.

To **retrieve** a dependency from anywhere in your code, use `locator<Example>()`.

---

### **1. Singleton**
A **Singleton** instance is created **once** when the application starts and is reused globally.

| Action | Code Example |
| :--- | :--- |
| **Register** (in `setup()`) | `locator.registerSingleton<Example>(Example());` |
| **Retrieve** (where needed) | `var myAppModel = locator<Example>();` |

---

### **2. Factory**
A **Factory** creates a **new instance** every single time you request it.

| Action | Code Example |
| :--- | :--- |
| **Register** (in `setup()`) | `locator.registerFactory<Example>(() => Example());` |
| **Retrieve** (where needed) | `var myAppModel = locator<Example>();` |

---

### **3. Lazy Singleton**
A **Lazy Singleton** instance is created **only on the first request** and is then reused globally.

| Action | Code Example |
| :--- | :--- |
| **Register** (in `setup()`) | `locator.registerLazySingleton<Example>(() => Example());` |
| **Retrieve** (where needed) | `var myAppModel = locator<Example>();` |