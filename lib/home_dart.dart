import 'package:audioplayers/audioplayers.dart';
import 'package:arab_tilini_urganaman/dart_data.dart';
import 'package:arab_tilini_urganaman/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HarflarScreen extends StatelessWidget {
  const HarflarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Arab Harflari'),
      ),
      body: ListView.builder(
        itemCount: harflar.length,
        itemBuilder: (context, index) {
          final Harf harf = harflar[index];
          return InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(harf: harf),
                )),
            child: Card(
              margin: const EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "${index + 1}-dars ${harf.harf}",
                  style: kTSFB,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final Harf harf;
  const DetailPage({super.key, required this.harf});

  @override
  Widget build(BuildContext context) {
    final player = AudioPlayer(); // Audio player yaratamiz

    return Scaffold(
        appBar: AppBar(
          title: Text(harf.harf),
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.all(5.0.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    harf.tavsif,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Misollar:\n',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  MasonryGridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: harf.misollar.length,
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3),
                    itemBuilder: (context, index) => Card(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 7.w),
                        child: Column(
                          children: [
                            Text(
                              harf.misollar[index],
                              style: kTSFB30,
                            ),
                            Text(
                              harf.uzbekchaUqilishi[index],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14.sp,
                              ),
                            ),
                            IconButton(
                              onPressed: () async {
                                String audioPath =
                                    "raw/lesson${harf.id}_${index + 2}.mp3";
                                print(audioPath);
                                try {
                                  // Audio faylni o‘ynatish
                                  await player.play(AssetSource(audioPath));
                                } catch (e) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Audio topilmadi: $e'),
                                    ),
                                  );
                                  print(e);
                                }

                                print("O‘ynatilmoqda: $audioPath");
                              },
                              icon: const Icon(Icons.play_arrow),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              )),
        ));
  }
}
