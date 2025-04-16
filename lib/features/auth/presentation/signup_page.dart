import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_basic_notes/shared/app_colors.dart';
import 'package:my_basic_notes/shared/app_text_styles.dart';
import 'package:my_basic_notes/shared/widgets/app_button.dart';
import 'package:my_basic_notes/shared/widgets/app_text_field.dart';

class SignUpPage extends StatefulWidget{
  const SignUpPage({super.key});

  
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

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
              
              SizedBox(height: 100.h,),
          
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

              SizedBox(height: 80.h,),

              AppButton(
                text: "Daftar", 
                onPressed: () {},
              ),

              SizedBox(height: 16.h,),

              RichText(
                text: TextSpan(
                  text: "Sudah punya akun? ",
                  style: AppTextStyles.smallRegular.copyWith(
                    color: AppColors.black,
                  ),
                  children: [
                    TextSpan(
                      text: "Masuk",
                      style: AppTextStyles.smallRegular.copyWith(
                        color: AppColors.blue900
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          print("user masuk nih");
                        }
                    )
                  ]
                ),
                

              ),
                         
          
            ],
          ),
        ),
      ),
    );
  }

}
