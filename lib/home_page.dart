import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:arab_tilini_urganaman/detailes_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> harflar = [];

  @override
  void initState() {
    super.initState();
    _loadJsonData();
  }

  Future<void> _loadJsonData() async {
    String data =
        await DefaultAssetBundle.of(context).loadString('assets/harflar.json');
    setState(() {
      harflar = jsonDecode(data)['harflar'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Mualiminiy soniy",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.builder(
          itemCount: harflar.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailesScreen(
                                  index: index,
                                )));
                  },
                  child: ListTile(
                    leading: Stack(
                      children: [
                        Image.asset("assets/images/icon.png"),
                        Positioned.fill(
                            child: Align(
                                child: Text(harflar[index]['id'].toString(),
                                    style: TextStyle(fontSize: 16)))),
                      ],
                    ),
                    title: Text(
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * .069),
                        " ${harflar[index]['id']}-dars ${harflar[index]['harf']} harfi"),
                  ),
                ),
                Divider()
              ],
            );
          }),
    );
  }
}
