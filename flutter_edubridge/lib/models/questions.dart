class Questions {
  final int qId;
  final String question;
  final List<String> choices;
  final int answerIndex;

  Questions({
    required this.qId,
    required this.question,
    required this.choices,
    required this.answerIndex,
  });

  factory Questions.fromMap(Map<String, dynamic> data) {
    // make parsing robust for Firestore types
    final qIdRaw = data['qId'];
    final answerRaw = data['answerIndex'];

    final qId = (qIdRaw is int)
        ? qIdRaw
        : (qIdRaw is num ? qIdRaw.toInt() : int.parse(qIdRaw.toString()));
    final answerIndex = (answerRaw is int)
        ? answerRaw
        : (answerRaw is num
              ? answerRaw.toInt()
              : int.parse(answerRaw.toString()));

    final choices = <String>[];
    if (data['choices'] != null) {
      try {
        choices.addAll(List<String>.from(data['choices'] as List));
      } catch (_) {
        // fallback: convert each to string
        final rawList = data['choices'] as List<dynamic>;
        choices.addAll(rawList.map((e) => e.toString()));
      }
    }

    return Questions(
      qId: qId,
      question: data['question']?.toString() ?? '',
      choices: choices,
      answerIndex: answerIndex,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'qId': qId,
      'question': question,
      'choices': choices,
      'answerIndex': answerIndex,
    };
  }
}
