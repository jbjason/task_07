# Task Management App

![App Screenshot](https://via.placeholder.com/300x600?text=Task+App+Preview) <!-- Replace with actual screenshot -->

A Flutter task management application with Firebase integration for authentication and data storage.

## Features

- User authentication (email/password)
- Create, read, update, and delete tasks
- Task categorization
- Responsive UI for mobile devices
- Dark/light theme support

## Setup Instructions

### Prerequisites

- Flutter SDK (version 3.19.0 or higher)
- Dart SDK (version 3.3.0 or higher)
- Firebase project configured

### Installation

1. Clone the repository:
-  git clone https://github.com/jbjason/task_07.git
-  cd task_07
2. Install dependencies:
- flutter pub get
- Set up Firebase:

3. Create a new Firebase project

-  Add Android/iOS apps in Firebase console
-  Download google-services.json (Android) and GoogleService-Info.plist (iOS)
-  Place them in the respective directories:
  
  Android: android/app/google-services.json
  iOS: ios/Runner/GoogleService-Info.plist

4. Run the app:
-  flutter run

## State Management Approach
lib/

├── providers/

│   ├── auth_provider.dart # Handles authentication state

│   ├── task_provider.dart      # Manages task CRUD operations

│   └── theme_provider.dart     # Controls app theme


