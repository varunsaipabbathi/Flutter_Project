## *MUSIC PLAYER APP*
## *Aim*
To develop a simple yet functional *Music Player Application* in Flutter that allows users to play, pause, stop, and seek audio tracks stored locally as assets.
## *Project Overview*
This Flutter project demonstrates how to build a *cross-platform music player* using the audioplayers package.
The app includes:
* A clean and responsive UI
* Audio playback controls
* Real-time seek bar
* Multiple audio file support
* Asset-based song management
This app works on *Android, **Windows, **Web, **iOS, and **macOS* (depending on Flutter support).
## *Features*
* Play, Pause, Stop controls
* Displays audio duration and current position
* Seek bar to navigate within a track
* Auto-update on track completion
* Supports adding unlimited songs through assets folder
* Modern UI with Material components
## *Technologies Used*
* *Flutter*
* *Dart*
* *Audioplayers plugin*
* *Material UI*
## *Folder Structure*
music_player_app/
│
├── assets/
│   └── music/
│       ├── ganeshsong.mp3
│       ├── Ayyapasong.mp3
│       └── Boomsong.mp3
│
├── lib/
│   ├── main.dart
│   └── screens/
│       └── home_screen.dart
│
│
├── pubspec.yaml
└── README.md
## *Pages Included*
* *main.dart* – App entry point
* *home_screen.dart* – Music player screen
* *widget_test.dart* – UI testing
## *How to Run*
### *1. Install Flutter*
Download Flutter SDK:
[https://flutter.dev/docs/get-started/install](https://flutter.dev/docs/get-started/install)
### *2. Clone the Repository*
git clone https://github.com/varunsaipabbathi/music_player_app.git
cd music_player_app
### *3. Install Dependencies*
flutter pub get
### *4. Run the Application*
*On Windows:*
flutter run -d windows
*On Android:*
flutter run -d android
*On Web:*
flutter run -d chrome
## *Adding New Songs*
To add more MP3 files:
1. Copy your .mp3 file into:
   assets/music/
2. Ensure this is present in *pubspec.yaml*:
   
   assets:
     - assets/music/
## *3. Run:*
   flutter pub get
No code changes are required.
## *Testing*
Basic widget test included to verify UI elements.
## *Run tests:*
flutter test
## *Author*
Name: Varun Sai Pabbathi
GitHub: (https://github.com/varunsaipabbathi)
## *License*
This project is open-source and free to use.
## *Output*
<img width="1366" height="728" alt="image" src="https://github.com/user-attachments/assets/283d8ece-e418-499a-b266-38afb0459882" />
<img width="1366" height="728" alt="image" src="https://github.com/user-attachments/assets/83a3e5f7-5e4c-4ead-a105-276c5c1bd27d" />
