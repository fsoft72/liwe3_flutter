# Firebase

This module streamlines the integration of Firebase Cloud Messaging (FCM) into your LiWE3 Flutter app.

## Setup

1. Create your Firebase project at [Firebase Console](https://console.firebase.google.com/).

   a. Click on "Add Project".
   b. Enter your project name.

2. Navigate to the Project Settings.

   a. Click on the gear icon in the top left corner.
   b. Click on "Project Settings".

3. Add your Android and iOS apps to the project.

   a. Click on the Android or iOS icon.
   b. Follow the instructions to add your app.
   c. Download the `google-services.json` or `GoogleService-Info.plist` file and place it in the `android/app` or `ios/Runner` directoryflutter create --platforms android ..

4. Generate firebase_options.dart file.

   a. First of all, be sure to have [Flutter CLI](https://firebase.google.com/docs/cli) installed.
   For linux do:

   ```bash
   curl -sL https://firebase.tools | bash
   ```

   b. Then login using your Google account:

   ```bash
   firebase login
   ```

   c. (optional) Test if you can see your projects:

   ```bash
   firebase projects:list
   ```

   d. Add the flutterfire binary to your project:

   ```bash
   dart pub global activate flutterfire_cli
   ```

   e. Generate the file:

   ```bash
   flutterfire configure
   ```

5. Enable Firestore and Firebase Cloud Messaging in your Firebase project.

   a. Click on "Firestore Database" in the left menu.

   b. Click on "Create Database".

   c. Click on "Start in test mode".

   d. Click on "Enable".
