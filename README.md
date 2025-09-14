# Streaky

A Flutter app to track and visualize your daily streaks using a calendar interface.

## Features
- Interactive calendar to select streak dates
- Streak dates are saved locally on your device using `shared_preferences`
- Persistent streak tracking across app launches
- Colorful UI with custom streak and current date highlights

## Getting Started

### Prerequisites
- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- Dart

### Installation
1. Clone the repository:
	```sh
	git clone <your-repo-url>
	cd nofa_streak
	```
2. Install dependencies:
	```sh
	flutter pub get
	```
3. Run the app:
	```sh
	flutter run
	```

## Usage
- Tap on dates in the calendar to add or remove streaks.
- Streaks are saved automatically and loaded when you reopen the app.

## Project Structure
- `lib/homepage.dart`: Main UI and logic for streak calendar and local storage
- `pubspec.yaml`: Project dependencies
- `android/`, `ios/`, `web/`, `macos/`, `linux/`, `windows/`: Platform-specific files

## Dependencies
- [flutter](https://pub.dev/packages/flutter)
- [streak_calendar](https://pub.dev/packages/streak_calendar)
- [shared_preferences](https://pub.dev/packages/shared_preferences)

## License
MIT
