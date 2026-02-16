import 'package:flutter/material.dart';

import '../../../../core/utils/txt_style.dart';

class ListViewExpanded extends StatelessWidget {
  const ListViewExpanded({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Expanded(
      child: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(bottom: h * 0.02),
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: h * 0.008,
                horizontal: w * 0.03,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(w * 0.04),
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(w * 0.03),
                    child: Image.asset(
                      "assets/images/doctor_randy.png",
                      width: w * 0.28,
                      height: w * 0.28,
                      fit: BoxFit.cover,
                    ),
                  ),

                  SizedBox(width: w * 0.03),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Dr. Randy Wigham",
                        style: TxtStyle.font600size18Black,
                      ),

                      SizedBox(height: h * 0.005),

                      Text(
                        "General  |  RSUD Gatot Subroto",
                        style: TxtStyle.font400size11Black,
                      ),

                      SizedBox(height: h * 0.008),

                      const Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: 16),
                          SizedBox(width: 4),
                          Text(
                            "4.8 (4,279 reviews)",
                            style: TxtStyle.font400size11Black,
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
