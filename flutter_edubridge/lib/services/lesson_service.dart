import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/lesson.dart';

class LessonService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<Lesson> getLesson(String subjectId, String lessonId) async {
    final doc = await _firestore
        .collection('subjects')
        .doc(subjectId)
        .collection('lessons')
        .doc(lessonId)
        .get();

    if (!doc.exists) {
      throw Exception("Lesson '$lessonId' not found under subject '$subjectId'.");
    }

    return Lesson.fromMap(doc.data() as Map<String, dynamic>, doc.id);
  }

  /// Upload the lesson to Firestore if it doesn't exist yet
  Future<void> uploadLessonOnce(String subjectId, String lessonId, Lesson lesson) async {
    final lessonRef = _firestore
        .collection('subjects')
        .doc(subjectId)
        .collection('lessons')
        .doc(lessonId);

    final doc = await lessonRef.get();
    if (doc.exists) return; // already uploaded

    await lessonRef.set({
      'title': lesson.title,
      'sections': lesson.sections
          .map((s) => {'header': s.header, 'content': s.content})
          .toList(),
      'nextLesson': lesson.nextLesson,
    });
  }
}
