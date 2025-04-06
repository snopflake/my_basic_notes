import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_basic_notes/features/auth/presentation/login_page.dart';
import 'package:my_basic_notes/shared/app_text_styles.dart';

class SplashPage extends StatefulWidget {

  const SplashPage({super.key});
  
  @override
  State<SplashPage> createState() => _SplashPageState();
  
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => LoginPage()));
    });
  }

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Image.asset(
              "assets/images/logo_my_basicnotes.png",
              width: 150.w,
              height: 155.h,
            ),

            SizedBox(height: 25.h),

            Text(
              "My Basic Notes",
              style: AppTextStyles.h2Bold
            ),

            SizedBox(height: 18.h,),

            Text(
              "A simple notes for your daily",
              style: AppTextStyles.baseRegular,
            )
            
          ],
        ),
      ),
    );
  }

}