import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> songs = [
    "music/ganeshsong.mp3",
    "music/Ayyapasong.mp3",
    "music/Boomsong.mp3",
    "music/gopikammasong.mp3",
  ];
  int currentIndex = 0;
  final AudioPlayer _player = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  @override
  void initState() {
    super.initState();
    _player.onDurationChanged.listen((d) {
      setState(() => duration = d);
    });
    _player.onPositionChanged.listen((p) {
      setState(() => position = p);
    });
    _player.onPlayerComplete.listen((event) {
      playNext();
    });
  }

  Future<void> playMusic() async {
    await _player.play(AssetSource(songs[currentIndex]));
    setState(() => isPlaying = true);
  }

  Future<void> pauseMusic() async {
    await _player.pause();
    setState(() => isPlaying = false);
  }

  Future<void> stopMusic() async {
    await _player.stop();
    setState(() {
      isPlaying = false;
      position = Duration.zero;
    });
  }

  // NEXT SONG
  void playNext() {
    setState(() {
      currentIndex = (currentIndex + 1) % songs.length;
    });
    playMusic();
  }

  // PREVIOUS SONG
  void playPrevious() {
    setState(() {
      currentIndex = (currentIndex - 1 + songs.length) % songs.length;
    });
    playMusic();
  }

  String formatTime(Duration t) {
    return t.toString().split(".").first.padLeft(8, "0");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Music Player"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.music_note, color: Colors.white, size: 120),
            const SizedBox(height: 25),
            Text(
              isPlaying ? "Playing..." : "Paused",
              style: const TextStyle(color: Colors.white, fontSize: 22),
            ),
            Slider(
              value: position.inSeconds.toDouble(),
              max: duration.inSeconds.toDouble().clamp(1, double.infinity),
              activeColor: Colors.deepPurple,
              inactiveColor: Colors.white54,
              onChanged: (value) async {
                final newPos = Duration(seconds: value.toInt());
                await _player.seek(newPos);
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  formatTime(position),
                  style: const TextStyle(color: Colors.white),
                ),
                Text(
                  formatTime(duration),
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.skip_previous,
                      color: Colors.white, size: 50),
                  onPressed: playPrevious,
                ),
                const SizedBox(width: 20),
                IconButton(
                  icon: Icon(
                    isPlaying ? Icons.pause_circle : Icons.play_circle,
                    size: 60,
                    color: Colors.greenAccent,
                  ),
                  onPressed: () {
                    isPlaying ? pauseMusic() : playMusic();
                  },
                ),
                const SizedBox(width: 20),
                IconButton(
                  icon: const Icon(Icons.skip_next,
                      color: Colors.white, size: 50),
                  onPressed: playNext,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
