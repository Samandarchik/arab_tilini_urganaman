import 'dart:convert';
import 'package:flutter/material.dart';

class DetailesScreen extends StatefulWidget {
  final int index;
  const DetailesScreen({super.key, required this.index});

  @override
  State<DetailesScreen> createState() => _DetailesScreenState();
}

class _DetailesScreenState extends State<DetailesScreen> {
  late List<dynamic> harflar;
  List<dynamic> misollar = []; // Initialize with an empty list
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _loadJsonData();
    _pageController = PageController();
  }

  Future<void> _loadJsonData() async {
    String data =
        await DefaultAssetBundle.of(context).loadString('assets/harflar.json');
    var jsonResult = jsonDecode(data);
    setState(() {
      harflar = jsonResult['harflar'];
      misollar = harflar[widget.index]['misollar'];
    });
  }

  @override
  Widget build(BuildContext context) {
    if (misollar.isEmpty) {
      // Show a loading indicator while misollar is empty
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    var harf = harflar[widget.index]['harf'];
    var tavsif = harflar[widget.index]['tavsif'];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("${widget.index + 1}-dars  "),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              harf,
              style: TextStyle(fontSize: 33, color: Colors.white),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: PageView.builder(
          controller: _pageController,
          itemCount: misollar.length,
          itemBuilder: (context, pageIndex) {
            var misol = misollar[pageIndex];

            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  RichText(
                      text: TextSpan(
                          style: TextStyle(
                            fontSize: 50,
                          ),
                          children: [
                        TextSpan(text: "ب"),
                        TextSpan(text: "ك"),
                        TextSpan(
                            text: "ت",
                            style: TextStyle(
                                color: Colors.black, fontFamily: "Arabic")),
                      ])),
                  const SizedBox(height: 10),
                  Text(
                    tavsif,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 19),
                  ),
                  const Spacer(),
                  Text(
                    textDirection: TextDirection.rtl,

                    misol, // Directly using misol as a string
                    style: const TextStyle(fontSize: 90, fontFamily: "Arabic"),
                  ),
                  const SizedBox(height: 60),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back_ios, size: 35),
                        onPressed: pageIndex == 0
                            ? null
                            : () {
                                _pageController.previousPage(
                                  duration: const Duration(milliseconds: 1),
                                  curve: Curves.easeInOut,
                                );
                              },
                      ),
                      Text(
                        "${pageIndex + 1}/${misollar.length}",
                        style: const TextStyle(fontSize: 30),
                      ),
                      IconButton(
                        icon: const Icon(Icons.arrow_forward_ios, size: 35),
                        onPressed: pageIndex == misollar.length - 1
                            ? null
                            : () {
                                _pageController.nextPage(
                                  duration: const Duration(milliseconds: 1),
                                  curve: Curves.easeInOut,
                                );
                              },
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.play_arrow, size: 35),
                      )
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
