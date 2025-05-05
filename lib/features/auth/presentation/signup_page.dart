import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_basic_notes/config/injection.dart';
import 'package:my_basic_notes/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:my_basic_notes/features/auth/presentation/bloc/auth_event.dart';
import 'package:my_basic_notes/features/auth/presentation/bloc/auth_state.dart';
import 'package:my_basic_notes/features/auth/presentation/login_page.dart';
import 'package:my_basic_notes/features/homepage/presentation/homepage.dart';
import 'package:my_basic_notes/shared/app_colors.dart';
import 'package:my_basic_notes/shared/app_text_styles.dart';
import 'package:my_basic_notes/shared/widgets/app_button.dart';
import 'package:my_basic_notes/shared/widgets/app_text_field.dart';
import 'package:my_basic_notes/shared/widgets/loading_dialog.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  //Controller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController kataSandiController = TextEditingController();
  final TextEditingController konfirmasiKataSandiController =
      TextEditingController();

  //Dispose
  @override
  void dispose() {
    emailController.dispose();
    usernameController.dispose();
    kataSandiController.dispose();
    konfirmasiKataSandiController.dispose();
    super.dispose();
  }

  //Build
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {

        //Bloc Listener
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

                Text("Daftar", style: AppTextStyles.h2Bold),

                SizedBox(height: 4.h),

                Text("Buat akun baru kamu!", style: AppTextStyles.baseRegular),

                SizedBox(height: 60.h),

                AppTextField(label: "E-Mail", controller: emailController),

                SizedBox(height: 24.h),

                AppTextField(label: "Username", controller: usernameController),

                SizedBox(height: 24.h),

                AppTextField(
                  label: "Kata Sandi",
                  controller: kataSandiController,
                  isPassword: true,
                ),

                SizedBox(height: 24.h),

                AppTextField(
                  label: "Konfirmasi Kata Sandi",
                  controller: konfirmasiKataSandiController,
                  isPassword: true,
                ),

                SizedBox(height: 80.h),

                // Button
                AppButton(
                  text: "Daftar",
                  onPressed: () {
                    final email = emailController.text.trim();
                    final username = usernameController.text.trim();
                    final password = kataSandiController.text.trim();
                    final confirmPassword =
                        konfirmasiKataSandiController.text.trim();

                    if (password != confirmPassword) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("kata sandi tidak cocok")),
                      );
                      return;
                    }

                    context.read<AuthBloc>().add(
                      AuthSignUpRequested(
                        email: email,
                        username: username,
                        password: password,
                      ),
                    );
                  },
                ),

                SizedBox(height: 16.h),

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
                          color: AppColors.blue900,
                        ),
                        recognizer:
                            TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LoginPage(),
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
