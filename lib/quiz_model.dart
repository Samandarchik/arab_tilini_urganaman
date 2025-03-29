class QuizModel {
  final String question;
  final Map<String, String> variants;
  final String answer;

  QuizModel(
      {required this.question, required this.variants, required this.answer});

  factory QuizModel.fromJson(Map<String, dynamic> json) {
    return QuizModel(
      question: json['question'],
      variants: Map<String, String>.from(json['variants']),
      answer: json['answer'],
    );
  }
}
