import 'package:flutter/material.dart';

import '../../../../core/utils/colors_manager.dart';
import '../../../../core/utils/txt_style.dart';

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery
        .of(context)
        .size
        .width;
    double h = MediaQuery
        .of(context)
        .size
        .height;

    return SizedBox(
      height: h * 0.13,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context, index) {
          List<Map<String, String>> items = [
            {"title": "General", "image": "assets/icons/general.png"},
            {"title": "Neurologic", "image": "assets/icons/brain.png"},
            {"title": "Pediatric", "image": "assets/icons/child.png"},
            {"title": "Radiology", "image": "assets/icons/radio.png"},

          ];

          return Padding(
            padding: EdgeInsets.only(right: w * 0.05),
            child: Column(
              children: [
                Container(
                  width: w * 0.18,
                  height: w * 0.18,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: ColorsManager.listViewHome,
                  ),
                  child: Center(
                    child: Image.asset(
                      items[index]["image"]!,
                      width: w * 0.08,
                    ),
                  ),
                ),

                SizedBox(height: h * 0.015),

                Text(
                  items[index]["title"]!,
                  style: TxtStyle.font400size11Black,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
