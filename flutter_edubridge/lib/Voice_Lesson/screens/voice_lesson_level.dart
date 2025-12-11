import 'package:flutter/material.dart';
import 'package:record/record.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:path_provider/path_provider.dart';

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

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Level ${widget.level}"),
        backgroundColor: Colors.green.shade700,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            /// TOP HEADER
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.green.shade700,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  const Icon(Icons.mic, color: Colors.white, size: 26),
                  const SizedBox(width: 10),
                  Text(
                    "Level ${widget.level}: Speak the Basics",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),

            /// LESSON TEXT CARD
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 10),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.1),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Text(
                sampleText,
                style: const TextStyle(fontSize: 16, height: 1.4),
              ),
            ),

            /// RECORDING CONTROLS
            Container(
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: const Color(0xFFF1F4F6),
                borderRadius: BorderRadius.circular(12),
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
                        icon: const Icon(Icons.replay, size: 28),
                      ),

                      const Icon(Icons.volume_up, size: 28),

                      GestureDetector(
                        onTap: () async {
                          if (!isRecording) {
                            await startRecording();
                          } else {
                            await stopRecording();
                          }
                        },
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: isRecording
                              ? Colors.red
                              : Colors.green,
                          child: Icon(
                            isRecording ? Icons.stop : Icons.mic,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),

                      const Icon(Icons.notes, size: 28),
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
          ],
        ),
      ),
    );
  }
}
