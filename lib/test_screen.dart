import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Mualiminiy soniy",
        ),
      ),
      body: ListView.builder(
          itemCount: 28,
          itemBuilder: (context, index) {
            return Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => TestCard()));
                  },
                  child: ListTile(
                    leading: Stack(
                      children: [
                        Image.asset("assets/images/icon.png"),
                        Positioned.fill(
                            child: Align(child: Text(" ${index + 1} "))),
                      ],
                    ),
                    title: Text(" ${index + 1} dars"),
                    trailing: Icon(Icons.lock),
                  ),
                ),
                Divider()
              ],
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
