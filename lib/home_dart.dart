import 'package:arab_tilini_urganaman/info_detail.dart';
import 'package:arab_tilini_urganaman/dart_data.dart';
import 'package:arab_tilini_urganaman/style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HarflarScreen extends StatelessWidget {
  const HarflarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Arab Harflari'),
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        itemCount: harflar.length,
        itemBuilder: (context, index) {
          final Harf harf = harflar[index];
          return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailPage(harf: harf),
              ),
            ),
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
                          " ${index + 1}-${"lesson".tr()}  ",
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
        },
      ),
    );
  }
}
