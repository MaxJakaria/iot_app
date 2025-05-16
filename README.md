# IoT Reminder App

### 1. [Starting Stage](https://github.com/MaxJakaria/iot_app/tree/0d80d92f67f6200a9bec351e44c83e554272cba2)

## Overview

This is a simple Flutter app for managing reminders. The code is organized using Clean Architecture and SOLID principles, making it easy to understand and maintain. The app uses the BLoC pattern to handle app logic, `flutter_bloc` to connect logic to the UI, and `get_it` for easy dependency management. This setup helps keep the app scalable and easy to update.

The app can connect to an ESP32 IoT device over WiFi. When you add a reminder, it sends the reminder to the ESP32 using an HTTP POST request.

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

- Add, remove, and view reminders.
- Sends reminders to an ESP32 IoT device over WiFi.
- Uses the BLoC pattern for state management.
- Responsive UI built with Flutter.

## Setup Instructions

1. Clone the repository:
   ```
   git clone <repository-url>
   ```
2. Navigate to the project directory:
   ```
   cd iot_app
   ```
3. Install dependencies:
   ```
   flutter pub get
   ```
4. Run the application:
   ```
   flutter run
   ```

## IoT Integration

- The app sends reminders to your ESP32 device at `http://192.168.161.176/add_reminder` using an HTTP POST request.
- Make sure your phone/PC and ESP32 are on the same WiFi network.
- The ESP32 must be running the compatible firmware to receive and process reminders.

## Usage

- Open the app to see the home page.
- Use the UI to add or remove reminders.
- When you add a reminder, it is also sent to your ESP32 device.
- The app will show your current reminders.

## Dependencies

- Flutter SDK
- flutter_bloc: For state management using the BLoC pattern.
- get_it: For dependency injection.
- http: For sending reminders to the IoT device.

## Contributing

Feel free to submit issues or pull requests for improvements or bug fixes.
