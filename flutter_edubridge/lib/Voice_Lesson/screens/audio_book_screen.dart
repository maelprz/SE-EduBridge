import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import '../../reusables/app_bar_pill.dart';
import '../../reusables/navigation/bottom_nav_wrapper.dart';

class AudioBookScreen extends StatefulWidget {
  const AudioBookScreen({super.key});

  @override
  State<AudioBookScreen> createState() => _AudioBookScreenState();
}

class _AudioBookScreenState extends State<AudioBookScreen> {
  late AudioPlayer _audioPlayer;

  bool isPlaying = false;
  Duration currentPosition = Duration.zero;
  Duration totalDuration = Duration.zero;

  @override
  void initState() {
    super.initState();

    _audioPlayer = AudioPlayer();

    // Load your audio file
    _audioPlayer.setSource(AssetSource("audio_book/sample.mp3"));

    _audioPlayer.onDurationChanged.listen((duration) {
      setState(() => totalDuration = duration);
    });

    _audioPlayer.onPositionChanged.listen((position) {
      setState(() => currentPosition = position);
    });

    _audioPlayer.onPlayerComplete.listen((_) {
      setState(() {
        isPlaying = false;
        currentPosition = Duration.zero;
      });
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  String formatTime(Duration d) {
    return d.toString().split('.').first.padLeft(8, "0");
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavWrapper(
      index: 1,
      child: Scaffold(
        appBar: AppBarPill(
          title: "Audio Book",
          onLeadingIconPressed: () => Navigator.pop(context),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(height: 50),

              // --- AUDIO BOOK CARD ---
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black, width: 3),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    const BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    )
                  ],
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                      child: Image.asset(
                        "assets/audio_book/book.png",
                        height: 180,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),

                    const SizedBox(height: 12),

                    // TITLE
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        "The Sophie's World: A Novel about the History of the Philosophy",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF004F3C),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),

                    const SizedBox(height: 12),

                    // --- WORKING AUDIO PLAYER ---
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          Slider(
                            value: currentPosition.inSeconds.toDouble(),
                            min: 0,
                            max: totalDuration.inSeconds == 0
                                ? 1
                                : totalDuration.inSeconds.toDouble(),
                            activeColor: const Color(0xFF004F3C),
                            onChanged: (value) {
                              _audioPlayer.seek(Duration(seconds: value.toInt()));
                            },
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(formatTime(currentPosition)),
                              Text(formatTime(totalDuration)),
                            ],
                          ),

                          const SizedBox(height: 10),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.skip_previous,
                                  size: 32, color: Color(0xFF004F3C)),
                              const SizedBox(width: 20),

                              // PLAY / PAUSE BUTTON
                              GestureDetector(
                                onTap: () async {
                                  if (isPlaying) {
                                    await _audioPlayer.pause();
                                  } else {
                                    await _audioPlayer.resume();
                                  }
                                  setState(() => isPlaying = !isPlaying);
                                },
                                child: Icon(
                                  isPlaying
                                      ? Icons.pause_circle_filled
                                      : Icons.play_circle_fill,
                                  size: 50,
                                  color: const Color(0xFF004F3C),
                                ),
                              ),

                              const SizedBox(width: 20),
                              const Icon(Icons.skip_next,
                                  size: 32, color: Color(0xFF004F3C)),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    // VIEW TRANSCRIPT BUTTON
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF004F3C),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                          ),
                          onPressed: () {},
                          child: const Text("View Transcript"),
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

                    // DOWNLOAD BUTTON
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Color(0xFF004F3C)),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                          ),
                          onPressed: () {},
                          child: const Text(
                            "Download MP3",
                            style: TextStyle(color: Color(0xFF004F3C)),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
