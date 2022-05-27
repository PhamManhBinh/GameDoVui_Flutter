  class Question {
  final int id;
  final String question;
  final List<dynamic> options;
  final int true_answer;

  const Question({required this.id,required this.question,required this.options,required this.true_answer});

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: int.parse(json['id']),
      question: json['question'] as String,
      options: json['options'] as List<dynamic>,
      true_answer: int.parse(json['true_answer'])
    );
  }
}
