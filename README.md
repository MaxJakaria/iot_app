# IoT Reminder App

### 1. [Starting Stage](https://github.com/MaxJakaria/iot_app/tree/0d80d92f67f6200a9bec351e44c83e554272cba2)

## Overview

This is a simple Flutter app for managing reminders. The code is organized using Clean Architecture and SOLID principles, making it easy to understand and maintain. The app uses the BLoC pattern to handle app logic, `flutter_bloc` to connect logic to the UI, and `get_it` for easy dependency management. This setup helps keep the app scalable and easy to update.

## Project Structure

```
iot_app/
├── lib/
│   ├── core/
│   │   └── utils.dart
│   ├── feature/
│   │   └── reminder/
│   │       ├── data/
│   │       │   └── repositories/
│   │       │       └── medicine_repository_impl.dart
│   │       ├── domain/
│   │       │   ├── medicine.dart
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

## Usage

- Open the app to see the home page.
- Use the UI to add or remove reminders.
- The app will show your current reminders.

## Dependencies

- Flutter SDK
- flutter_bloc: For state management using the BLoC pattern.
- get_it: For dependency injection.

## Contributing

Feel free to submit issues or pull requests for improvements or bug fixes.
