import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Pref {
  Future<void> loadProgress(
      {required currentLesson,
      required currentQuestion,
      required correctAnswers,
      required wrongAnswers}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    currentLesson = prefs.getInt('currentLesson') ?? 0;
    currentQuestion = prefs.getInt('currentQuestion') ?? 0;
    correctAnswers = prefs.getInt('correctAnswers') ?? 0;
    wrongAnswers = prefs.getStringList('wrongAnswers') ?? [];
  }

  Future<void> clearProgress() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  Future<void> saveProgress(
      {required currentLesson,
      required currentQuestion,
      required correctAnswers,
      required wrongAnswers}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('currentLesson', currentLesson);
    prefs.setInt('currentQuestion', currentQuestion);
    prefs.setInt('correctAnswers', correctAnswers);
    prefs.setStringList('wrongAnswers', wrongAnswers);
  }
}

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final List<List<Map<String, dynamic>>> lessons = [
    [
      {
        'question': 'O‘zbekiston poytaxti qaysi shahar?',
        'options': ['Toshkent', 'Samarqand', 'Buxoro', 'Xiva'],
        'correct': 'Toshkent'
      },
      {
        'question': 'O‘zbekistonning eng katta daryosi?',
        'options': ['Amudaryo', 'Sirdaryo', 'Zarafshon', 'Qo‘qon'],
        'correct': 'Amudaryo'
      },
      {
        'question': 'O‘zbekistonning davlat tili?',
        'options': ['Rus', 'O‘zbek', 'Qozoq', 'Tojik'],
        'correct': 'O‘zbek'
      }
    ],
    [
      {
        'question': 'Flutter nima uchun ishlatiladi?',
        'options': ['Veb', 'Ilova', 'O‘yin', 'Barcha javoblar'],
        'correct': 'Barcha javoblar'
      },
      {
        'question': 'Dart qaysi kompaniya tomonidan yaratilgan?',
        'options': ['Google', 'Facebook', 'Microsoft', 'Apple'],
        'correct': 'Google'
      },
      {
        'question': 'Flutter-ning asosiy elementi?',
        'options': ['Widget', 'Component', 'Element', 'Class'],
        'correct': 'Widget'
      }
    ],
    [
      {
        'question': 'Mars qaysi sayyora?',
        'options': ['4', '5', '3', '7'],
        'correct': '4'
      },
      {
        'question': 'Yerning yo‘ldoshi nima?',
        'options': ['Oy', 'Quyosh', 'Mars', 'Venus'],
        'correct': 'Oy'
      },
      {
        'question': 'Quyosh qanday yulduz?',
        'options': [
          'Qizil gigant',
          'O‘rtacha yulduz',
          'Qora tuynuk',
          'Supernova'
        ],
        'correct': 'O‘rtacha yulduz'
      }
    ],
    [
      {
        'question': 'Eng uzun daryo?',
        'options': ['Nil', 'Amazonka', 'Yanszi', 'Missisipi'],
        'correct': 'Nil'
      },
      {
        'question': 'Eng katta okean?',
        'options': ['Atlantika', 'Hind', 'Tinch', 'Shimoliy muz'],
        'correct': 'Tinch'
      },
      {
        'question': 'Everest qayerda joylashgan?',
        'options': ['Hindiston', 'Xitoy', 'Nepal', 'Mongoliya'],
        'correct': 'Nepal'
      }
    ],
    [
      {
        'question': 'O‘zbekiston mustaqillik yili?',
        'options': ['1990', '1991', '1992', '1989'],
        'correct': '1991'
      },
      {
        'question': 'Alisher Navoiy qaysi davrda yashagan?',
        'options': ['14-asr', '15-asr', '16-asr', '13-asr'],
        'correct': '15-asr'
      },
      {
        'question': 'Amir Temur qaysi davlatni boshqargan?',
        'options': ['Xorazm', 'Buxoro', 'Samarqand', 'Movarounnahr'],
        'correct': 'Movarounnahr'
      }
    ]
  ];

  int currentLesson = 0;
  int currentQuestion = 0;
  int correctAnswers = 0;
  List<String> wrongAnswers = [];

  @override
  void initState() {
    super.initState();
    _loadProgress();
  }

  Future<void> _loadProgress() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      currentLesson = prefs.getInt('currentLesson') ?? 0;
      currentQuestion = prefs.getInt('currentQuestion') ?? 0;
      correctAnswers = prefs.getInt('correctAnswers') ?? 0;
      wrongAnswers = prefs.getStringList('wrongAnswers') ?? [];
    });
  }

  Future<void> clearProgress() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  Future<void> _saveProgress() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('currentLesson', currentLesson);
    prefs.setInt('currentQuestion', currentQuestion);
    prefs.setInt('correctAnswers', correctAnswers);
    prefs.setStringList('wrongAnswers', wrongAnswers);
  }

  void _checkAnswer(String selectedOption) {
    var currentQ = lessons[currentLesson][currentQuestion];
    if (selectedOption == currentQ['correct']) {
      correctAnswers++;
    } else {
      wrongAnswers.add(currentQ['question']);
    }

    if (currentQuestion < lessons[currentLesson].length - 1) {
      setState(() {
        currentQuestion++;
      });
    } else if (currentLesson < lessons.length - 1) {
      setState(() {
        currentLesson++;
        currentQuestion = 0;
      });
    } else {
      _showResult();
    }

    _saveProgress();
  }

  void _showResult() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Natijangiz!'),
        content: Text(
            'Siz $correctAnswers ta savolga to‘g‘ri javob berdingiz!\nXato javoblar: ${wrongAnswers.join(', ')}'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('OK'),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var currentQ = lessons[currentLesson][currentQuestion];

    return Scaffold(
      appBar: AppBar(title: Text('Quiz App')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              currentQ['question'],
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
            ...currentQ['options']
                .map((option) => ElevatedButton(
                      onPressed: () => _checkAnswer(option),
                      child: Text(option),
                    ))
                .toList(),
          ],
        ),
      ),
    );
  }
}
