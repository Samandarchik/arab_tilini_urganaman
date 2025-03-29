import 'dart:convert';

import 'package:arab_tilini_urganaman/dart_data.dart';
import 'package:arab_tilini_urganaman/quiz_model.dart';
import 'package:arab_tilini_urganaman/quiz_page.dart';
import 'package:arab_tilini_urganaman/style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  List<QuizModel> questions = [];

  Future<void> getQuestions() async {
    String data = await DefaultAssetBundle.of(context)
        .loadString('assets/questions.json');
    setState(() {
      questions =
          List<Map<String, dynamic>>.from(json.decode(data)['questions'])
              .map((question) => QuizModel.fromJson(question))
              .toList();
    });
  }

  @override
  void initState() {
    super.initState();
    getQuestions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Mualiminiy soniy",
        ),
      ),
      body: ListView.builder(
          itemCount: harflar.length,
          itemBuilder: (context, index) {
            final Harf harf = harflar[index];
            return GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => QuizPage(quiz: questions[index]))),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 45.h,
                        width: 45.w,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                          image: AssetImage("assets/images/icon.png"),
                        )),
                        child: Center(
                          child: Text(
                            "${index + 1}",
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            " ${index + 1}-${"quiz".tr()}  ",
                            style: kTSFW20,
                          ),
                          Text(
                            harf.harf,
                            style: TextStyles.kTSFW(size: 30),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.all(6.h),
                    height: 1.h,
                    decoration: BoxDecoration(color: Color(0xffe4e4e4)),
                  )
                ],
              ),
            );
          }),
    );
  }
}

class TestCard extends StatelessWidget {
  const TestCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
