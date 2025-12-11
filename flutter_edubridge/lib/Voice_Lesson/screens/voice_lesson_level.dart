import 'package:flutter/material.dart';
import 'package:record/record.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:path_provider/path_provider.dart';

import '../../../reusables/app_bar_pill.dart';
import '../../reusables/navigation/bottom_nav_wrapper.dart';

class VoiceLessonLevel extends StatefulWidget {
  final int level;

  const VoiceLessonLevel({super.key, required this.level});

  @override
  State<VoiceLessonLevel> createState() => _VoiceLessonLevelState();
}

class _VoiceLessonLevelState extends State<VoiceLessonLevel> {
  final AudioRecorder record = AudioRecorder();
  final AudioPlayer player = AudioPlayer();

  bool isRecording = false;
  bool isPlaying = false;
  String? recordedFilePath;
  double sliderValue = 0;

  Future<String> _getFilePath() async {
    final dir = await getApplicationDocumentsDirectory();
    return '${dir.path}/voice_recording_level_${widget.level}.m4a';
  }

  /// START RECORDING
  Future<void> startRecording() async {
    try {
      if (!await record.hasPermission()) return;

      final path = await _getFilePath();

      await record.start(
        const RecordConfig(
          encoder: AudioEncoder.aacLc,
          bitRate: 128000,
          sampleRate: 44100,
        ),
        path: path,
      );

      setState(() {
        isRecording = true;
        recordedFilePath = path;
      });
    } catch (e) {
      debugPrint('startRecording error: $e');
    }
  }

  /// STOP RECORDING
  Future<void> stopRecording() async {
    try {
      final path = await record.stop();
      setState(() {
        isRecording = false;
        recordedFilePath = path;
      });
    } catch (e) {
      debugPrint('stopRecording error: $e');
    }
  }

  /// PLAY RECORDING
  Future<void> playRecording() async {
    try {
      if (recordedFilePath == null) return;

      await player.play(DeviceFileSource(recordedFilePath!));

      setState(() => isPlaying = true);

      player.onPlayerComplete.listen((_) {
        setState(() => isPlaying = false);
      });
    } catch (e) {
      debugPrint('playRecording error: $e');
    }
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  /// SAMPLE TEXT PER LEVEL
  String sampleTextForLevel(int level) {
    switch (level) {
      case 1:
        return """
Hello, my name is Mel.
I am learning how to speak clearly.
Speaking helps me share my thoughts.
I can read short sentences out loud.
I feel proud when I say the words right.
""";
      case 2:
        return """
Today, I will practice longer sentences.
I speak slowly to make each word clear.
Reading out loud helps improve confidence.
I try my best to pronounce each sound.
Practice makes my voice stronger.
""";
      default:
        return """
This is a speaking exercise.
Read the text aloud with confidence.
Focus on your pronunciation and pacing.
Speak clearly and naturally.
Good luck with this level!
""";
    }
  }

  @override
  Widget build(BuildContext context) {
    final sampleText = sampleTextForLevel(widget.level);

    return BottomNavWrapper(
      index: 1, // highlight Voice Lesson in bottom nav
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBarPill(
          title: "Vocal Practice",
          onLeadingIconPressed: () => Navigator.pop(context),
          height: 90,
          backgroundColor: const Color.fromARGB(255, 229, 230, 230),
        ),

        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// HEADER PILL
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFF085F41),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.mic, color: Colors.white, size: 26),
                    const SizedBox(width: 12),
                    Text(
                      "Speak the Basics",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 15),

              /// TEXT BLOCK
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.1),
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Text(
                  sampleText,
                  style: const TextStyle(fontSize: 17, height: 1.5),
                ),
              ),

              const SizedBox(height: 20),

              /// AUDIO CONTROLS CARD
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 18,
                  horizontal: 16,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFF1F4F6),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                          onPressed: recordedFilePath != null
                              ? playRecording
                              : null,
                          icon: const Icon(Icons.replay, size: 30),
                        ),

                        const Icon(Icons.volume_up, size: 30),

                        GestureDetector(
                          onTap: () async {
                            if (!isRecording) {
                              await startRecording();
                            } else {
                              await stopRecording();
                            }
                          },
                          child: CircleAvatar(
                            radius: 24,
                            backgroundColor: isRecording
                                ? Colors.red
                                : Colors.green,
                            child: Icon(
                              isRecording ? Icons.stop : Icons.mic,
                              color: Colors.white,
                              size: 22,
                            ),
                          ),
                        ),

                        const Icon(Icons.notes, size: 30),
                      ],
                    ),

                    const SizedBox(height: 10),

                    Slider(
                      value: sliderValue,
                      min: 0,
                      max: 100,
                      onChanged: (v) => setState(() => sliderValue = v),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
