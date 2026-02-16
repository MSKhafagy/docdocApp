import 'package:doctorapp/core/utils/txt_style.dart';
import 'package:doctorapp/core/widgets/app_button.dart';
import 'package:doctorapp/features/auth/register/presentation/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../home/presentation/screens/home_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32),
        child: Column(
          mainAxisAlignment:MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width:60, child: Image.asset("assets/images/splash.png",)),
                Text("  Docdoc  ", style: TxtStyle.font200Size35Black),
              ],
            ),

            SizedBox(
              height: 32,
            ),

            SizedBox(
                //height: 443,
                width: 443,

                child: Image.asset("assets/images/doctor.png",fit:BoxFit.fill,)),
            SizedBox(
              height: 16,
            ),
            Text("Best Doctor Appointment App", style: TxtStyle.font700Size32blue,textAlign: TextAlign.center,),
            SizedBox(
              height: 16,
            ),
            Text("Manage and schedule all of your medical appointments easily with Docdoc to get a new experience.", style: TxtStyle.font400Size10grey,textAlign: TextAlign.center,),
            SizedBox(
              height: 16,
            ),


            AppButton(
              buttonTxt: "Get Started",
              function:() {Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> RegisterScreen())); },
            ),


          ],
        ),
     ),
   );
  }
}
