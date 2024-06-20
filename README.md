# Event Management App

## Overview

This Flutter application manages events using MobX for state management and follows the MVVM architecture. It includes a splash screen that leads to a calendar view of events. Users can select dates to view associated events and click on specific events to see detailed information.

## Setup Instructions

### Prerequisites

- Ensure you have Flutter installed. If not, follow the [Flutter installation guide](https://flutter.dev/docs/get-started/install).
- Git installed on your local machine.

### Clone Repository

Clone the repository using the following command:

```bash
git clone <repository_url>
```
Replace <repository_url> with the actual URL of your Git repository.

## Install Dependencies
Navigate to the project directory and install dependencies:

```bash
cd <project_directory>
flutter pub get
```
### Run the App
Run the app on a connected device (physical or emulator) using:

```bash
flutter run
```
## App Features
### Splash Screen:

- Initializes necessary data on app launch.
- Provides a seamless transition to the Events Screen.
  
### Events Screen:

- Displays a calendar interface with selectable dates.
- Lists events corresponding to the selected date.
- Supports navigation to detailed event information.

### Event Details:

- Detailed view of event information.
- Includes event title, time, and additional details.

## Technologies Used
- Flutter: Cross-platform framework for building mobile applications.
- MobX: State management library for reactive programming in Flutter.
- MVVM Architecture: Organizes code into models, views, and view models for maintainability and scalability.
- Custom Widgets and Animations: Enhance user experience and visual appeal.


