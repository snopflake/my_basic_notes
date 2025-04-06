import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_basic_notes/shared/app_text_styles.dart';

class LoginPage extends StatefulWidget{
  
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            SizedBox(height: 130.h,),

            Text(
              "Daftar",
              style: AppTextStyles.h2Bold,
            ),

            SizedBox(height: 4.h,),

            Text(
              "Buat akun baru kamu!",
              style: AppTextStyles.baseRegular,
            ),

            SizedBox(height: 60.h,),

            


          ],
        ),
      ),
    );
  }

}