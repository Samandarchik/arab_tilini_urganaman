import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'dart:async';

class TestCar extends StatefulWidget {
  @override
  _TestCarState createState() => _TestCarState();
}

class _TestCarState extends State<TestCar> {
  List<dynamic> questions = [];
  int currentQuestionIndex = 0;
  int correctAnswers = 0;
  List<String> incorrectAnswers = [];
  List<String> incorrectQuestions = [];
  bool showAnswerResult = false;
  bool isAnswerCorrect = false;
  String selectedAnswer = '';
  String correctAnswer = '';
  PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    loadQuestions();
  }

  Future<void> loadQuestions() async {
    final String response =
        await rootBundle.loadString('assets/questions.json');
    final data = await json.decode(response);
    setState(() {
      questions = data['questions'];
    });
  }

  void checkAnswer(String selectedOption) {
    correctAnswer = questions[currentQuestionIndex]['answer'];

    setState(() {
      selectedAnswer = selectedOption;
      if (selectedOption == correctAnswer) {
        correctAnswers++;
        isAnswerCorrect = true;
      } else {
        incorrectAnswers.add(selectedOption);
        incorrectQuestions.add(questions[currentQuestionIndex]['question']);
        isAnswerCorrect = false;
      }
      showAnswerResult = true;

      // 3 soniyadan keyin keyingi savolga o'tish
      Future.delayed(Duration(milliseconds: 500), () {
        nextQuestion();
      });
    });
  }

  void nextQuestion() {
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        showAnswerResult = false;
        selectedAnswer = '';
        _pageController.nextPage(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
      });
    } else {
      showResults();
    }
  }

  void previousQuestion() {
    if (currentQuestionIndex > 0) {
      setState(() {
        currentQuestionIndex--;
        showAnswerResult = false;
        selectedAnswer = '';
        _pageController.previousPage(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
      });
    }
  }

  void showResults() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ResultPage(
              correctAnswers: correctAnswers,
              totalQuestions: questions.length)),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (questions.isEmpty) {
      return Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
        title: Text(
          "TEST",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: previousQuestion,
          ),
        ],
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: questions.length,
        itemBuilder: (context, index) {
          final question = questions[index];
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .15,
              ),
              Text(
                question['question'],
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * .15),
              ),
              Spacer(),
              SizedBox(
                height: 350,
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Divider(thickness: 1, color: Colors.black),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: double.infinity,
                                    width: double.infinity,
                                    color: showAnswerResult &&
                                            selectedAnswer ==
                                                question['variants']['A']
                                        ? (isAnswerCorrect
                                            ? Colors.green
                                            : Colors.red)
                                        : (showAnswerResult &&
                                                correctAnswer ==
                                                    question['variants']['A']
                                            ? Colors.green
                                            : null),
                                    child: GestureDetector(
                                      onTap: showAnswerResult
                                          ? null
                                          : () => checkAnswer(
                                              question['variants']['A']),
                                      child: Center(
                                        child: AutoSizeText(
                                          question['variants']['A'],
                                          style: TextStyle(fontSize: 40),
                                          minFontSize: 5,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                VerticalDivider(
                                    thickness: 1, color: Colors.black),
                                Expanded(
                                  child: Container(
                                    height: double.infinity,
                                    width: double.infinity,
                                    color: showAnswerResult &&
                                            selectedAnswer ==
                                                question['variants']['B']
                                        ? (isAnswerCorrect
                                            ? Colors.green
                                            : Colors.red)
                                        : (showAnswerResult &&
                                                correctAnswer ==
                                                    question['variants']['B']
                                            ? Colors.green
                                            : null),
                                    child: GestureDetector(
                                      onTap: showAnswerResult
                                          ? null
                                          : () => checkAnswer(
                                              question['variants']['B']),
                                      child: Center(
                                        child: AutoSizeText(
                                          question['variants']['B'],
                                          style: TextStyle(fontSize: 40),
                                          minFontSize: 5,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(thickness: 1, color: Colors.black),
                          Expanded(
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: double.infinity,
                                    width: double.infinity,
                                    color: showAnswerResult &&
                                            selectedAnswer ==
                                                question['variants']['C']
                                        ? (isAnswerCorrect
                                            ? Colors.green
                                            : Colors.red)
                                        : (showAnswerResult &&
                                                correctAnswer ==
                                                    question['variants']['C']
                                            ? Colors.green
                                            : null),
                                    child: GestureDetector(
                                      onTap: showAnswerResult
                                          ? null
                                          : () => checkAnswer(
                                              question['variants']['C']),
                                      child: Center(
                                        child: AutoSizeText(
                                          question['variants']['C'],
                                          style: TextStyle(fontSize: 40),
                                          minFontSize: 5,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                VerticalDivider(
                                    thickness: 1, color: Colors.black),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: showAnswerResult
                                        ? null
                                        : () => checkAnswer(
                                            question['variants']['D']),
                                    child: Container(
                                      height: double.infinity,
                                      width: double.infinity,
                                      color: showAnswerResult &&
                                              selectedAnswer ==
                                                  question['variants']['D']
                                          ? (isAnswerCorrect
                                              ? Colors.green
                                              : Colors.red)
                                          : (showAnswerResult &&
                                                  correctAnswer ==
                                                      question['variants']['D']
                                              ? Colors.green
                                              : null),
                                      child: Center(
                                        child: AutoSizeText(
                                          question['variants']['D'],
                                          style: TextStyle(fontSize: 40),
                                          minFontSize: 5,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class ResultPage extends StatelessWidget {
  final int correctAnswers;
  final int totalQuestions;

  ResultPage({required this.correctAnswers, required this.totalQuestions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test Natijalari"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "To'g'ri javoblar soni: $correctAnswers",
              style: TextStyle(fontSize: 24),
            ),
            Text(
              "Jami savollar: $totalQuestions",
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Testni qayta boshlash"),
            ),
          ],
        ),
      ),
    );
  }
}
