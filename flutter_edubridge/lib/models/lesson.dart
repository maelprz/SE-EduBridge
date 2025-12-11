class Lesson {
  final String id;
  final String title;
  final List<LessonSection> sections;
  final String? nextLesson;

  Lesson({
    required this.id,
    required this.title,
    required this.sections,
    required this.nextLesson,
  });

  factory Lesson.fromMap(Map<String, dynamic> map, String documentId) {
    return Lesson(
      id: documentId,
      title: map['title'] ?? '',
      sections: (map['sections'] as List<dynamic>)
          .map((e) => LessonSection.fromMap(e))
          .toList(),
      nextLesson: map['nextLesson'],
    );
  }
}

class LessonSection {
  final String header;
  final String content;

  LessonSection({required this.header, required this.content});

  factory LessonSection.fromMap(Map<String, dynamic> map) {
    return LessonSection(
      header: map['header'] ?? '',
      content: map['content'] ?? '',
    );
  }
}
