# Task Management App

<img width=30% height=14% src="https://github.com/user-attachments/assets/a2e684ae-1fb0-43df-bd16-190544408626">  <img width=30% height=14% src="https://github.com/user-attachments/assets/6bc19f98-5b38-4953-a6ff-55e8c3ce3e51">  <img width=30% height=14% src="https://github.com/user-attachments/assets/c0bf490e-9716-4062-83e5-0601e3349bb0"> 

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
<br />

2. Install dependencies:
- flutter pub get
- Set up Firebase:
<br />

3. Create a new Firebase project
-  Add Android/iOS apps in Firebase console
-  Download google-services.json (Android) and GoogleService-Info.plist (iOS)
-  Place them in the respective directories:
-  Android: android/app/google-services.json
-  iOS: ios/Runner/GoogleService-Info.plist
<br />

4. Run the app:
-  flutter run
<br />

## State Management Approach
lib/<br />
├── providers/<br />
│   ├── auth_provider.dart       `# Handles authentication state`<br />
│   ├── task_provider.dart       `# Manages task CRUD operations`<br />
│   └── theme_provider.dart      `# Controls app theme`<br />


## Bonus Task
-  Firebase Authentication

## Support
For questions or suggestions, contact me via jubayeral040@gmail.com.

Check out the documentation on pub.dev for more details.

### Happy coding! 🚀
