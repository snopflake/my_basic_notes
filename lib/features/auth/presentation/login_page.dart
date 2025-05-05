import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_basic_notes/config/injection.dart';
import 'package:my_basic_notes/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:my_basic_notes/features/auth/presentation/bloc/auth_event.dart';
import 'package:my_basic_notes/features/auth/presentation/bloc/auth_state.dart';
import 'package:my_basic_notes/features/auth/presentation/signup_page.dart';
import 'package:my_basic_notes/features/homepage/presentation/homepage.dart';
import 'package:my_basic_notes/shared/app_colors.dart';
import 'package:my_basic_notes/shared/app_text_styles.dart';
import 'package:my_basic_notes/shared/widgets/app_button.dart';
import 'package:my_basic_notes/shared/widgets/app_text_field.dart';
import 'package:my_basic_notes/shared/widgets/loading_dialog.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //Controller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController kataSandiController = TextEditingController();

  //Dispose
  @override
  void dispose() {
    emailController.dispose();
    kataSandiController.dispose();
    super.dispose();
  }

  //Build
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {

        // Bloc Listener
        if (state is AuthLoading) {
          LoadingDialog.show(context);
        } else {
          LoadingDialog.hide(context);
        }

        if (state is AuthSuccess) {
          Navigator.pushReplacement(context, 
            MaterialPageRoute(builder: (_) => const HomePage()));
        }

        else if (state is AuthFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }

      },

      // UI
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

                AppTextField(label: "E-Mail", controller: emailController),

                SizedBox(height: 24.h),

                AppTextField(
                  label: "Kata Sandi",
                  controller: kataSandiController,
                  isPassword: true,
                ),

                SizedBox(height: 10.h),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                       onPressed: () {}, 
                        child: Text(
                          "Lupa password?",
                          style: AppTextStyles.smallRegular.copyWith(
                            color: AppColors.blue900)
                        )
                      ),
                    ],
                  ),

                SizedBox(height: 145.h,),

                // Button
                AppButton(
                  text: "Masuk",
                  onPressed: () {
                    final email = emailController.text.trim();
                    final password = kataSandiController.text.trim();

                    context.read<AuthBloc>().add(
                      AuthLoginRequested(email: email, password: password),
                    );
                  },
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
                        text: "Daftar",
                        style: AppTextStyles.smallRegular.copyWith(
                          color: AppColors.blue900,
                        ),
                        recognizer:
                            TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SignUpPage(),
                                  ),
                                );
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
