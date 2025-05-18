# IoT Reminder App

### 1. [Starting Stage](https://github.com/MaxJakaria/iot_app/tree/0d80d92f67f6200a9bec351e44c83e554272cba2)

## Overview

This Flutter app helps you manage medicine reminders. It follows Clean Architecture and SOLID principles for maintainability and scalability. The app uses the BLoC pattern (`flutter_bloc`) for state management and `get_it` for dependency injection.

When you add a reminder, the app:

- Sends the reminder to an ESP32 IoT device over WiFi via HTTP POST.
- Stores the reminder in Firebase Cloud Firestore for cloud backup and sync.

## Project Structure

```
iot_app/
├── lib/
│   ├── core/
│   │   └── API/
│   │        └── iot_api.dart
│   ├── feature/
│   │   └── reminder/
│   │       ├── data/
│   │       │   └── repositories/
│   │       │       └── medicine_repository_impl.dart
│   │       ├── domain/
│   │       │   ├── entities/
│   │       │   │   └── medicine.dart
│   │       │   └── repositories/
│   │       │       └── medicine_repository.dart
│   │       └── presentation/
│   │           ├── bloc/
│   │           │   ├── reminder_bloc.dart
│   │           │   ├── reminder_event.dart
│   │           │   └── reminder_state.dart
│   │           ├── pages/
│   │           │   ├── iot_home_page.dart
│   │           │   └── medicine_reminder_page.dart
│   │           └── widgets/
│   │               ├── add_medicine_dialog.dart
│   │               └── medicine_card.dart
│   ├── init_dependencies.dart
│   └── main.dart
├── pubspec.yaml
└── README.md
```

## Features

- Add, remove, and view medicine reminders.
- Sends reminders to an ESP32 IoT device over WiFi.
- Stores reminders in Firebase Cloud Firestore.
- Uses the BLoC pattern for state management.
- Responsive UI built with Flutter.

## Setup Instructions

1. **Clone the repository:**
   ```
   git clone <repository-url>
   ```
2. **Navigate to the project directory:**
   ```
   cd iot_app
   ```
3. **Install dependencies:**
   ```
   flutter pub get
   ```
4. **Run the application:**
   ```
   flutter run
   ```

## IoT Integration

- The app sends reminders to your ESP32 device at `http://192.168.161.176/add_reminder` using an HTTP POST request.
- Ensure your phone/PC and ESP32 are on the same WiFi network.
- The ESP32 must be running compatible firmware to receive and process reminders.

## Firebase Integration

- The app uses Firebase Cloud Firestore to store and sync reminders.
- Make sure you have set up Firebase for your project and added the `firebase_options.dart` file.
- Add your Firebase configuration using the FlutterFire CLI.
- **Important:**  
  For development, ensure your Firestore security rules allow read/write access.  
  Example (for testing only):
  ```js
  service cloud.firestore {
    match /databases/{database}/documents {
      match /{document=**} {
        allow read, write: if true;
      }
    }
  }
  ```
  For production, secure your rules appropriately.

## Usage

- Open the app to see the home page.
- Use the UI to add or remove medicine reminders.
- When you add a reminder, it is sent to your ESP32 device and stored in Firebase.
- The app displays your current reminders, synced from the cloud.

## Dependencies

- Flutter SDK
- flutter_bloc: State management using the BLoC pattern.
- get_it: Dependency injection.
- http: Sending reminders to the IoT device.
- firebase_core: Firebase initialization.
- cloud_firestore: Storing reminders in Firebase.

## Contributing

Feel free to submit issues or pull requests for improvements or bug fixes.
