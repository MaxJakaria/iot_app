# IoT Reminder App

## Overview

This project is a Flutter application designed to manage reminders. It utilizes the BLoC (Business Logic Component) pattern to separate business logic from the UI, making the application more scalable and maintainable.

## Project Structure

```
iot_app
├── lib
│   ├── main.dart
│   ├── feature
│   │   └── reminder
│   │       ├── bloc
│   │       │   ├── reminder_bloc.dart
│   │       │   ├── reminder_event.dart
│   │       │   └── reminder_state.dart
│   │       ├── data
│   │       │   ├── models
│   │       │   │   └── reminder_model.dart
│   │       │   └── repositories
│   │       │       └── reminder_repository.dart
│   │       ├── presentation
│   │       │   └── pages
│   │       │       └── iot_home_page.dart
│   │       └── widgets
│   │           └── reminder_widget.dart
│   └── core
│       └── utils
│           └── constants.dart
├── pubspec.yaml
└── README.md
```

## Features

- Add, remove, and view reminders.
- Utilizes the BLoC pattern for state management.
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

- Launch the app to view the home page.
- Use the provided UI to add or remove reminders.
- The app will display the current list of reminders.

## Dependencies

- Flutter SDK
- flutter_bloc: For state management using the BLoC pattern.

## Contributing

Feel free to submit issues or pull requests for improvements or bug fixes.
