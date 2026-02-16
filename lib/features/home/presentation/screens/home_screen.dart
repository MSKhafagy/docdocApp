
import 'package:doctorapp/core/utils/txt_style.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/colors_manager.dart';
import '../widget/list_view_expanded.dart';
import '../widget/list_view_widget.dart';

class HomeScreen extends StatelessWidget {
  String userName;

  HomeScreen({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {

    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: w * 0.04,
          vertical: h * 0.04,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Hi, $userName!",
                  style: TxtStyle.font700size18Black,
                ),
                Container(
                  width: w * 0.12,
                  height: w * 0.12,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: ColorsManager.notificationWhite,
                  ),
                  child:  Icon(Icons.notifications_none),
                ),
              ],
            ),

            SizedBox(height: h * 0.005),

            Text(
              "How Are you Today?",
              style: TxtStyle.font400size11Black,
            ),

            Image.asset("assets/images/home_banner.png"),

            SizedBox(height: h * 0.03),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Doctor Speciality",
                  style: TxtStyle.font600size18Black,
                ),
                Text(
                  "See All",
                  style: TxtStyle.font400size12Blue,
                )
              ],
            ),

            SizedBox(height: h * 0.02),

            ListViewWidget(),

            SizedBox(height: h * 0.03),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Recommendation Doctor",
                  style: TxtStyle.font600size18Black,
                ),
                Text(
                  "See All",
                  style: TxtStyle.font400size12Blue,
                )
              ],
            ),

            ListViewExpanded(),
          ],
        ),
      ),
    );
  }
}