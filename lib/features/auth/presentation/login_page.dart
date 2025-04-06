import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_basic_notes/shared/app_text_styles.dart';
import 'package:my_basic_notes/shared/widgets/app_text_field.dart';

class LoginPage extends StatefulWidget{
  
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  //Controller
  final TextEditingController namaLengkapController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController kataSandiController = TextEditingController();
  final TextEditingController konfirmasiKataSandiController = TextEditingController();

  //Dispose
  @override
  void dispose() {
    namaLengkapController.dispose();
    usernameController.dispose();
    kataSandiController.dispose();
    konfirmasiKataSandiController.dispose();
    super.dispose();
  }
  
  //Build
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 40.w),
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
          
              AppTextField(
                label: "Nama Lengkap", 
                controller: namaLengkapController
              ),
          
              SizedBox(height: 24.h,),
          
              AppTextField(
                label: "Username", 
                controller: usernameController,
              ),

              SizedBox(height: 24.h,),

              AppTextField(
                label: "Kata Sandi", 
                controller: kataSandiController,
                isPassword: true,
              ),

              SizedBox(height: 24.h,),

              AppTextField(
                label: "Konfirmasi Kata Sandi", 
                controller: konfirmasiKataSandiController,
                isPassword: true,
              ),


                         
          
          
          
            ],
          ),
        ),
      ),
    );
  }

}