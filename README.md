Opinion Chart App

Welcome to Opinion Chart App! This README file will guide you through the steps required to set up and run the application on your local machine.

Link for apk: https://github.com/nishantrai727/OpinionChart/blob/bbccbad49d2c4d993c503b90bd716d5a02257d35/apk/OpinionChartV1.0.1.apk

Prerequisites
Before you begin, ensure you have met the following requirements:

Flutter SDK version 3.16.4
Dart SDK version compatible with Flutter 3.16.4
Android Studio or Visual Studio Code (optional, but recommended)
A device or emulator to run the app


Installation
1. Install Flutter
If you haven't already installed Flutter, follow the official Flutter installation guide:

Flutter Installation Guide
Make sure to install version 3.16.4 specifically. You can switch versions using flutter version 3.16.4.

2. Clone the Repository
Clone this repository to your local machine using the following command:

bash: git clone https://github.com/nishantrai727/OpinionChart.git

3. Navigate to the Project Directory
Navigate to the root directory of the cloned repository:

bash: cd your-repo-name

4. Install Dependencies
Run the following command to get all the necessary dependencies:

bash: flutter pub get

5. Set Up an Emulator or Connect a Device
Ensure you have an emulator set up, or connect an Android or iOS device to your machine.

For Android: You can use Android Studio to create and manage Android Virtual Devices (AVDs).
For iOS: Use Xcode to set up an iOS simulator (macOS only).

Running the App
1. Run on an Emulator or Device
Ensure your emulator is running or your device is connected, then run the app using the following command:

bash: flutter run
This command builds the app and launches it on the connected device or emulator.

2. Run on a Specific Device
If you have multiple devices connected or emulators running, you can specify the device to run the app on using:

bash: flutter devices
This command lists all available devices. To run on a specific device, use:

bash: flutter run -d <device_id>
Replace <device_id> with the ID of the device you want to run the app on.

Additional Commands

Building the App
Android: To build an APK, use:

bash: flutter build apk

iOS: To build an iOS app, use:

bash: flutter build ios

Running Tests
To run the tests for your app, use:

bash: flutter test

