import 'package:doctorapp/core/txt_style.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_screen.dart';

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
            InkWell(
              onTap: () async{

                final SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.setBool('isLogin', true);
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginScreen()));

              },
              child: Container(
                width: 312,
                height: 54,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(36, 124, 255, 1),
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Text('Get Started',
                      style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontWeight: FontWeight.w500,
                          fontSize: 20
                      ),
                    )

                  ],
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}
