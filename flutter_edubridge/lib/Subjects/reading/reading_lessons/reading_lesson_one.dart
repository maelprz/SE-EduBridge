import 'package:flutter/material.dart';
import '../../../reusables/navigation/bottom_nav_wrapper.dart';
import '../../../reusables/app_bar_pill.dart';
import '../../../services/lesson_service.dart';
import '../../../models/lesson.dart';
import 'reading_lesson_two.dart';

class ReadingLessonOne extends StatefulWidget {
  final String subjectId;

  const ReadingLessonOne({super.key, required this.subjectId});

  @override
  State<ReadingLessonOne> createState() => _ReadingLessonOneState();
}

class _ReadingLessonOneState extends State<ReadingLessonOne> {
  final LessonService lessonService = LessonService();
  Lesson? lesson;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadLesson();
  }

  Future<void> _loadLesson() async {
    try {
      // Hardcoded lesson data
      final hardcodedLesson = Lesson(
        id: 'lesson1',
        title: 'Introduction to Reading',
        sections: [
          LessonSection(
            header: 'Introduction to Reading',
            content:
                'Reading is the process of understanding written text. It allows us to learn new things, enjoy stories, and communicate effectively. Strong reading skills are important for school, work, and everyday life.',
          ),
          LessonSection(
            header: 'Why Reading is Important',
            content:
                '• Expands knowledge: Reading introduces you to new ideas and information.\n• Improves vocabulary: Seeing new words helps you understand and use them.\n• Enhances imagination: Stories let you picture new worlds and characters.\n• Develops critical thinking: Understanding and analyzing what you read strengthens your mind.\n• Helps communication: Reading improves writing and speaking skills.',
          ),
          LessonSection(
            header: 'Types of Reading',
            content:
                '1. Skimming – Reading quickly to get the main idea.\n2. Scanning – Searching for specific information.\n3. Detailed Reading – Reading carefully to understand everything.',
          ),
          LessonSection(
            header: 'Tips for Better Reading',
            content:
                '• Choose a quiet place with good light.\n• Preview the text before reading fully.\n• Highlight or underline key points.\n• Take notes or summarize after reading.\n• Ask yourself questions about the text to check understanding.',
          ),
          LessonSection(
            header: 'Reading Exercise',
            content:
                'Read the passage below:\n"The sun was setting over the quiet village, painting the sky in shades of orange and pink. Children ran through the fields, laughing and playing, while farmers finished their work for the day. Birds flew back to their nests as the cool breeze swept through the trees. The smell of fresh bread from the bakery mixed with the scent of flowers in the gardens. People greeted each other warmly, and the village felt calm and peaceful."\n\nQuestions:\n1. What time of day is described in the passage?\n2. What are the children doing?\n3. How does the author make the village feel peaceful?\n4. Name two sensory details (sight, smell, sound) mentioned in the passage.\n5. What do you imagine is happening after the sun sets?',
          ),
          LessonSection(
            header: 'Mini Activity',
            content:
                'Find a short story, article, or passage. Try the following:\n• Skim it first to understand the main idea.\n• Scan for 3 important pieces of information.\n• Read it carefully and summarize in your own words.',
          ),
        ],
        nextLesson: 'lesson2',
      );

      // Upload to Firestore if missing
      await lessonService.uploadLessonOnce(widget.subjectId, 'lesson1', hardcodedLesson);

      // Fetch lesson from Firestore
      final fetchedLesson =
          await lessonService.getLesson(widget.subjectId, 'lesson1');

      setState(() {
        lesson = fetchedLesson;
        isLoading = false;
      });
    } catch (e) {
      print('Error loading lesson: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final Color green = const Color(0xFF0C4B36);

    if (isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (lesson == null) {
      return Scaffold(
        appBar: AppBarPill(
          title: "Lesson 1",
          onLeadingIconPressed: () => Navigator.pop(context),
        ),
        body: const Center(child: Text("Lesson not found")),
      );
    }

    return BottomNavWrapper(
      index: 1,
      child: Scaffold(
        appBar: AppBarPill(
          title: lesson!.title,
          onLeadingIconPressed: () => Navigator.pop(context),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(
            25,
            20,
            25,
            MediaQuery.of(context).padding.bottom + 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...lesson!.sections.map(
                (s) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      s.header,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: green,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      s.content,
                      style: const TextStyle(fontSize: 16, height: 1.6),
                    ),
                    const SizedBox(height: 25),
                  ],
                ),
              ),
              /*Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ReadingLessonTwo(subjectId: widget.subjectId),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: green,
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  ),
                  child: const Text(
                    "Next Lesson →",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),*/
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
