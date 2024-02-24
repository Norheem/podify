import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Play extends StatefulWidget {
  final Map<String, dynamic> podcast;
  const Play({
    super.key,
    required this.podcast,
  });

  @override
  State<Play> createState() => _PlayState();
}

class _PlayState extends State<Play> {
  bool isFavorite = false;
  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });

    final snackBar = SnackBar(
      content:
          Text(isFavorite ? 'Added to favorites' : 'Removed from favorites'),
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    super.initState();

    setAudio();

    //listen to events: playing, paused, stopped
    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });

    //listen to audio duration
    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    audioPlayer.onPlayerComplete.listen((event) {
      setState(() {
        isPlaying = false;
        position = Duration.zero;
      });
      audioPlayer.stop();
    });

    //initialize position to Duration.zero
    position = Duration.zero;

    //listen to audio position
    audioPlayer.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }

  Future setAudio() async {
    audioPlayer.setReleaseMode(ReleaseMode.loop);
    final player = AudioCache(prefix: 'assets/');
    final url = await player.load('089.mp3');
    audioPlayer.setSourceUrl(url.path);
    audioPlayer.setVolume(1.0);
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  String formatTime(Duration position) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(position.inHours);
    final minutes = twoDigits(position.inMinutes.remainder(60));
    final seconds = twoDigits(position.inSeconds.remainder(60));

    return [if (position.inHours > 0) hours, minutes, seconds].join(':');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(color: Colors.black),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 50,
                        height: 55,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color.fromARGB(130, 100, 99, 99),
                        ),
                        child: Center(
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.west,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 50,
                        height: 55,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color.fromARGB(255, 243, 219, 7),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.share_outlined,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    width: 400,
                    height: 350,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      image: DecorationImage(
                        image: AssetImage(widget.podcast['img']),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          children: [
                            Text(
                              widget.podcast['title'],
                              style: GoogleFonts.spaceGrotesk(
                                textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                ),
                              ),
                            ),
                            Text(
                              widget.podcast['subtitle'],
                              style: GoogleFonts.spaceGrotesk(
                                textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: toggleFavorite,
                        child: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: isFavorite ? Colors.white : Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Slider(
                    min: 0,
                    max: duration.inSeconds.toDouble(),
                    value: position.inSeconds.toDouble(),
                    onChanged: (value) async {
                      final newPosition = Duration(seconds: value.toInt());
                      await audioPlayer.seek(newPosition);

                      await audioPlayer.resume();
                      setState(() {
                        position = newPosition;
                      });
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          formatTime(position),
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          formatTime(duration - position),
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          // Logic for previous button
                        },
                        icon: const Icon(Icons.skip_previous_outlined),
                        iconSize: 30,
                        color: Colors.white,
                      ),
                      IconButton(
                        onPressed: () async {
                          final newPosition =
                              position - const Duration(seconds: 10);
                          if (newPosition > Duration.zero) {
                            await audioPlayer.seek(newPosition);
                          }
                        },
                        icon: const Icon(Icons.replay_10_outlined),
                        iconSize: 30,
                        color: Colors.white,
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.yellow,
                        radius: 25,
                        child: IconButton(
                          onPressed: () async {
                            if (isPlaying) {
                              await audioPlayer.pause();
                            } else {
                              await audioPlayer.resume();
                            }
                            setState(() {
                              isPlaying = !isPlaying;
                            });
                          },
                          icon: Icon(
                            isPlaying ? Icons.pause : Icons.play_arrow,
                          ),
                          iconSize: 30,
                          color: isPlaying ? Colors.black : Colors.white,
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          final newPosition =
                              position + const Duration(seconds: 10);
                          if (newPosition < duration) {
                            await audioPlayer.seek(newPosition);
                          }
                        },
                        icon: const Icon(Icons.forward_10_outlined),
                        iconSize: 30,
                        color: Colors.white,
                      ),
                      IconButton(
                        onPressed: () {
                          // Logic for next button
                        },
                        icon: const Icon(Icons.skip_next_outlined),
                        iconSize: 30,
                        color: Colors.white,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
