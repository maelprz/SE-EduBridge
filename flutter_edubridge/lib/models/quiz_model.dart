class Quiz {
  final String id; // Firestore quiz document ID
  final String title;
  bool completed; // whether the user has finished it

  Quiz({required this.id, required this.title, this.completed = false});

  factory Quiz.fromMap(Map<String, dynamic> data, String docId) {
    return Quiz(
      id: docId,
      title: data['title']?.toString() ?? 'Untitled Quiz',
      completed: false, // default false, update later per user
    );
  }

  Map<String, dynamic> toMap() {
    return {'title': title};
  }
}
