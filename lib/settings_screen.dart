import 'package:arab_tilini_urganaman/style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'font_size_provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final fontProvider = Provider.of<FontSizeProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Sozlamalar')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text("لنَّصِّ",
                style: TextStyles.kTSFW(size: fontProvider.arabFontSize)),
            Text("Arabcha matn uchun font o‘lchami:",
                style: TextStyle(fontSize: 18)),
            Slider(
              value: fontProvider.arabFontSize,
              min: 20,
              max: 130,
              divisions: 130,
              label: "${fontProvider.arabFontSize.toInt()}",
              onChanged: (newSize) => fontProvider.setArabFontSize(newSize),
            ),
            const SizedBox(height: 20),
            Text("Text",
                style: TextStyles.kTSFW(size: fontProvider.uzbFontSize)),
            Text("O'zbekcha matn uchun font o'lchami:",
                style: TextStyle(fontSize: 18)),
            Slider(
              value: fontProvider.uzbFontSize,
              min: 10,
              max: 100,
              divisions: 80,
              label: "${fontProvider.uzbFontSize.toInt()}",
              onChanged: (newSize) => fontProvider.setUzbFontSize(newSize),
            ),
          ],
        ),
      ),
    );
  }
}
