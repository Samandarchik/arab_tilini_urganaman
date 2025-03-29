import 'package:arab_tilini_urganaman/dart_data.dart';
import 'package:arab_tilini_urganaman/font_size_provider.dart';
import 'package:arab_tilini_urganaman/pref.dart';
import 'package:arab_tilini_urganaman/style.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatefulWidget {
  final Harf harf;
  const DetailPage({super.key, required this.harf});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late final PageController _pageController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
  }

  final player = AudioPlayer();
  @override
  Widget build(BuildContext context) {
    final double arabFontSize =
        Provider.of<FontSizeProvider>(context).arabFontSize;
    final double uzbFontSize =
        Provider.of<FontSizeProvider>(context).uzbFontSize;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.harf.harf),
        actions: [
          IconButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HarflarDetail())),
              icon: Icon(Icons.info))
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: widget.harf.misollar.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 7.w, horizontal: 7.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          index == 0 || index == 1 || index == 2
                              ? "harf${widget.harf.id}:${index + 1}".tr()
                              : " ",
                          style: TextStyles.kTSFW(size: 20),
                        ),
                        const Spacer(flex: 4),
                        RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: [
                                if (index == 0) ...[
                                  TextSpan(
                                    text: widget.harf.misollar[index],
                                    style: TextStyle(
                                      fontSize: arabFontSize,
                                      color: Colors.black,
                                      fontFamily: "Arabic",
                                    ),
                                  ),
                                  TextSpan(
                                    text: "ش",
                                    style: TextStyle(
                                        fontSize: arabFontSize,
                                        color: Colors.white,
                                        fontFamily: "Arabic",
                                        overflow: TextOverflow.clip),
                                  ),
                                ],
                                if (index == 1) ...[
                                  TextSpan(
                                    text: "ش",
                                    style: TextStyle(
                                        fontSize: arabFontSize,
                                        color: Colors.white,
                                        fontFamily: "Arabic",
                                        overflow: TextOverflow.clip),
                                  ),
                                  TextSpan(
                                    text: widget.harf.misollar[index],
                                    style: TextStyle(
                                      fontSize: arabFontSize,
                                      color: Colors.black,
                                      fontFamily: "Arabic",
                                    ),
                                  ),
                                  TextSpan(
                                    text: "ش",
                                    style: TextStyle(
                                        fontSize: arabFontSize,
                                        color: Colors.white,
                                        fontFamily: "Arabic",
                                        overflow: TextOverflow.clip),
                                  ),
                                ],
                                if (index == 2) ...[
                                  TextSpan(
                                    text: "ش",
                                    style: TextStyle(
                                        fontSize: arabFontSize,
                                        color: Colors.white,
                                        fontFamily: "Arabic",
                                        overflow: TextOverflow.clip),
                                  ),
                                  TextSpan(
                                    text: widget.harf.misollar[index],
                                    style: TextStyle(
                                      fontSize: arabFontSize,
                                      color: Colors.black,
                                      fontFamily: "Arabic",
                                    ),
                                  ),
                                ]
                              ],
                              style: TextStyles.kTSFW(size: arabFontSize),
                            )),
                        if (index != 0 && index != 1 && index != 2)
                          Text(
                            widget.harf.misollar[index],
                            style: TextStyles.kTSFW(size: arabFontSize),
                          ),
                        Text(
                          widget.harf.uzbekchaUqilishi[index],
                          style: TextStyle(
                            fontSize: uzbFontSize,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    if (_pageController.page! > 0) {
                      _pageController.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  icon: const Icon(Icons.chevron_left),
                ),
                IconButton(
                  onPressed: () async {
                    int currentIndex = _pageController.page?.toInt() ?? 0;
                    String audioPath =
                        "raw/lesson${widget.harf.id}_${currentIndex + 1}.mp3";
                    try {
                      await player.play(AssetSource(audioPath));
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Audio topilmadi: $e'),
                        ),
                      );
                    }
                  },
                  icon: const Icon(Icons.play_arrow),
                ),
                IconButton(
                  onPressed: () {
                    if (_pageController.page! <
                        widget.harf.misollar.length - 1) {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  icon: const Icon(Icons.chevron_right),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class HarflarDetail extends StatelessWidget {
  const HarflarDetail({super.key});

  @override
  Widget build(BuildContext context) {
    Pref pref = Pref();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text("Harflar haqida")),
          ElevatedButton(
              onPressed: () {
                // pref.loadProgress(currentLesson: , currentQuestion: currentQuestion, correctAnswers: correctAnswers, wrongAnswers: wrongAnswers)
                Navigator.pop(context);
              },
              child: Text("Boshlash"))
        ],
      ),
    );
  }
}
