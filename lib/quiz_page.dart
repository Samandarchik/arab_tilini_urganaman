import 'package:arab_tilini_urganaman/quiz_model.dart';
import 'package:flutter/material.dart';

class QuizPage extends StatelessWidget {
  final QuizModel quiz;
  const QuizPage({super.key, required this.quiz});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Quiz")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              quiz.question,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ...quiz.variants.entries.map((entry) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    textStyle: const TextStyle(fontSize: 18),
                  ),
                  child: Text(entry.value),
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
