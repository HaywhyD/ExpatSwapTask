### Submission

#### 1. Running the App Locally:

To run the Flutter mobile app locally, follow these steps:

1. Clone the GitHub repository:

   ```bash
   git clone https://github.com/HaywhyD/ExpatSwapTask.git
   ```

2. Navigate to the project directory:

   ```bash
   cd your-repository
   ```

3. Install dependencies:

   ```bash
   flutter pub get
   ```

4. Ensure you have a valid Firebase configuration file (google-services.json for Android, GoogleService-Info.plist for iOS) if you're using Firebase for authentication and Firestore for the database.

5. Connect a physical device or start an emulator.

6. Run the app:

   ```bash
   flutter run
   ```

#### 2. Authentication and Database Setup:

##### Authentication:

- If you're using Google authentication:

  - Follow the FlutterFire authentication documentation for setting up Google Sign-In: [FlutterFire Authentication](https://firebase.flutter.dev/docs/auth/social#google).

- If you're using Facebook authentication:

  - Follow the FlutterFire authentication documentation for setting up Facebook Sign-In: [FlutterFire Authentication](https://firebase.flutter.dev/docs/auth/social#facebook).

##### Database Integration:

- If you're using Firebase Firestore:

  - Follow the FlutterFire Firestore documentation for setting up Firestore: [FlutterFire Firestore](https://firebase.flutter.dev/docs/firestore/usage).

- If you're using SQLite:

  - SQLite is a local database, so no specific setup is required. Ensure the necessary dependencies are added to the `pubspec.yaml` file. e.g `sqflite: ^2.3.0`

#### 3. README.md File:

Include a brief README.md file in your GitHub repository:

```markdown
# ExpatSwap Task

This Flutter mobile app allows users to input and submit personal information through a form, with authentication using Google or Facebook. The submitted data is stored in a database.

## Setup

1. **Clone the repository:**

   ```bash
   git clone https://github.com/your-username/your-repository.git
   ```

2. **Navigate to the project directory:**

   ```bash
   cd your-repository
   ```

3. **Install dependencies:**

   ```bash
   flutter pub get
   ```

4. **Authentication and Database Setup:**

   - Follow the instructions in the [Authentication and Database Setup](#authentication-and-database-setup) section.

5. **Run the app:**

   ```bash
   flutter run
   ```

## Authentication and Database Setup

### Authentication:

- If using Google authentication, follow the [FlutterFire Google Sign-In documentation](https://firebase.flutter.dev/docs/auth/social#google).

- If using Facebook authentication, follow the [FlutterFire Facebook Sign-In documentation](https://firebase.flutter.dev/docs/auth/social#facebook).

### Database Integration:

- If using Firebase Firestore, follow the [FlutterFire Firestore documentation](https://firebase.flutter.dev/docs/firestore/usage).

- If using SQLite, ensure the necessary dependencies are added to the `pubspec.yaml` file. e.g `sqflite: ^2.3.0` 

## Additional Features (Optional)

- Users can edit or update their information.
- Implemented a feature to delete user data.

## Contributors

- List contributors or mention that the project is open for contributions.

## License

This project is licensed under the [MIT License](LICENSE).
```
