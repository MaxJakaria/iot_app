# IoT Reminder App

### 1. [Starting Stage](https://github.com/MaxJakaria/iot_app/tree/0d80d92f67f6200a9bec351e44c83e554272cba2)

### 2. [Connect hardware using http server](https://github.com/MaxJakaria/iot_app/tree/14d29609c9fb0915be6984ffcc1faa2c0c4b2752)

### 3. [With firebase](https://github.com/MaxJakaria/iot_app/tree/33b8b36396f6e7c899becdff12e6025f9a630289)

### 4. Data Exchange (store, retrive)

## Overview

This Flutter app helps you manage medicine reminders. It follows Clean Architecture and SOLID principles for maintainability and scalability. The app uses the BLoC pattern (`flutter_bloc`) for state management and `get_it` for dependency injection.

**Medicine reminders are uploaded to Firebase Cloud Firestore using Clean Architecture.**  
All Firestore logic is abstracted away from the UI and handled through the data source and repository layers for better maintainability and testability.

When you add a reminder, the app:

- Sends the reminder to an ESP32 IoT device over WiFi via HTTP POST.
- Stores the reminder in Firebase Cloud Firestore for cloud backup and sync.
- Retrieves reminders directly from Firestore and displays them in the app (no local list is used).

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
│   │       │   ├── datasource/
│   │       │   │   └── medicine_remote_data_source.dart
│   │       │   ├── Model/
│   │       │   │   └── medicine_model.dart
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

- Add and view medicine reminders.
- Sends reminders to an ESP32 IoT device over WiFi.
- Stores and retrieves reminders in Firebase Cloud Firestore using Clean Architecture.
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
- All Firestore operations are handled in the data source and repository layers.
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
- Use the UI to add medicine reminders.
- When you add a reminder, it is sent to your ESP32 device and stored in Firebase.
- The app displays your current reminders, synced from the cloud in real time.

## Dependencies

- Flutter SDK
- flutter_bloc: State management using the BLoC pattern.
- get_it: Dependency injection.
- http: Sending reminders to the IoT device.
- firebase_core: Firebase initialization.
- cloud_firestore: Storing reminders in Firebase.

## Contributing

Feel free to submit issues or pull requests for improvements or bug fixes.
