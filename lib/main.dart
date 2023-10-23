import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final player = AudioPlayer();

  @override
  void initState() {
    super.initState();
    playSong();
    player.positionStream.listen((event) {
      setState(() {});
    });
  }

  void playSong() async {
    final duration = await player.setUrl(
        "https://irsv.upmusics.com/AliBZ/Bezar%20Oon%20Bere%20(320).mp3");

    await player.play();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ProgressBar(
              progress: player.position,
              total: player.duration == null
                  ? const Duration(seconds: 0)
                  : player.duration!,
              buffered: player.bufferedPosition,
              onSeek: (value) {
                player.seek(value);
              },
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(CupertinoIcons.back),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(CupertinoIcons.play),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(CupertinoIcons.forward),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
