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
}
