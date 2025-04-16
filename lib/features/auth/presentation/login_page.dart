import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_basic_notes/config/injection.dart';
import 'package:my_basic_notes/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:my_basic_notes/features/auth/presentation/bloc/auth_event.dart';
import 'package:my_basic_notes/shared/app_colors.dart';
import 'package:my_basic_notes/shared/app_text_styles.dart';
import 'package:my_basic_notes/shared/widgets/app_button.dart';
import 'package:my_basic_notes/shared/widgets/app_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

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
    return BlocProvider(
      create: (context) => sl<AuthBloc>(),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 40.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 100.h),

                Text("Masuk", style: AppTextStyles.h2Bold),

                SizedBox(height: 4.h),

                Text(
                  "Selamat Datang Kembali!",
                  style: AppTextStyles.baseRegular,
                ),

                SizedBox(height: 40.h),

                Image.asset(
                  "assets/images/logo_my_basicnotes.png",
                  width: 70.w,
                  height: 72.h,
                ),

                SizedBox(height: 38.h),

                AppTextField(label: "Username", controller: usernameController),

                SizedBox(height: 24.h),

                AppTextField(
                  label: "Kata Sandi",
                  controller: kataSandiController,
                  isPassword: true,
                ),

                SizedBox(height: 10.h),

                // Button
                AppButton(
                  text: "Masuk", 
                  onPressed: () {
                    final email = usernameController.text;
                    final password = kataSandiController.text;

                    context.read<AuthBloc>().add(
                      AuthLoginRequested(
                        email: email,
                        password: password
                      ),
                    );
                  }
                ),

                SizedBox(height: 16.h),

                RichText(
                  text: TextSpan(
                    text: "Belum punya akun? ",
                    style: AppTextStyles.smallRegular.copyWith(
                      color: AppColors.black,
                    ),
                    children: [
                      TextSpan(
                        text: "Dafrar",
                        style: AppTextStyles.smallRegular.copyWith(
                          color: AppColors.blue900,
                        ),
                        recognizer:
                            TapGestureRecognizer()
                              ..onTap = () {
                                print("user masuk nih");
                              },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
