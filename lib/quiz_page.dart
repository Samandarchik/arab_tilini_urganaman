import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final List<Map<String, dynamic>> quizzes = [
    {
      'savol': "Birdan keyin nechi keladi?",
      'a': '2',
      'b': '3',
      'correct': '2',
      'selected': '',
    },
    {
      'savol': "Ikkidan keyin nechi keladi?",
      'a': '3',
      'b': '4',
      'correct': '3',
      'selected': '',
    },
    {
      'savol': "Uchdan keyin nechi keladi?",
      'a': '4',
      'b': '5',
      'correct': '4',
      'selected': '',
    },
  ];
  int currentQuestion = 0;
  PageController controller = PageController();

  void nextQuestion() {
    if (currentQuestion != quizzes.length - 1) {
      currentQuestion++;
      setState(() {});
      controller.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.bounceInOut);
    }
  }

  void previousQuestion() {
    if (currentQuestion != 0) {
      setState(() {});
      currentQuestion--;
      controller.previousPage(
          duration: Duration(milliseconds: 300), curve: Curves.bounceInOut);
    }
  }

  void onSelected(String option) async {
    quizzes[currentQuestion]['selected'] = option;
    setState(() {});
    await Future.delayed(const Duration(seconds: 1));
    nextQuestion();
  }

  bool isCorrectAnswerSelected(String option) {
    if (quizzes[currentQuestion]['correct'] ==
        quizzes[currentQuestion][option]) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${currentQuestion + 1} - savol'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: PageView.builder(
            onPageChanged: (value) {
              currentQuestion = value;
              setState(() {});
            },
            controller: controller,
            itemCount: quizzes.length,
            itemBuilder: (context, index) => Column(
              children: [
                Text(quizzes[currentQuestion]['savol']),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        onSelected(quizzes[currentQuestion]['a']);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 100,
                        width: 100,
                        color: quizzes[currentQuestion]['selected'].isEmpty
                            ? Colors.grey
                            : isCorrectAnswerSelected('a')
                                ? Colors.green
                                : Colors.red,
                        child: Text("A: ${quizzes[currentQuestion]['a']}"),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        onSelected(quizzes[currentQuestion]['b']);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 100,
                        width: 100,
                        color: quizzes[currentQuestion]['selected'].isEmpty
                            ? Colors.grey
                            : isCorrectAnswerSelected('b')
                                ? Colors.green
                                : Colors.red,
                        child: Text("B: ${quizzes[currentQuestion]['b']}"),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: previousQuestion,
              child: Container(
                alignment: Alignment.center,
                height: 50,
                width: 50,
                color: Colors.blue,
                child: Text("Orqaga"),
              ),
            ),
            GestureDetector(
              onTap: previousQuestion,
              child: Container(
                alignment: Alignment.center,
                height: 50,
                width: 50,
                color: Colors.blue,
                child: Text("Oldinga"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
