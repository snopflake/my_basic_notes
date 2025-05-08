import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:my_basic_notes/features/addnotes/presentation/add_notes_page.dart';
import 'package:my_basic_notes/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:my_basic_notes/features/auth/presentation/bloc/auth_state.dart';
import 'package:my_basic_notes/features/auth/presentation/login_page.dart';
import 'package:my_basic_notes/core/routing/app_routes.dart';
import 'package:my_basic_notes/features/auth/presentation/signup_page.dart';
import 'package:my_basic_notes/features/homepage/presentation/homepage.dart';
import 'package:my_basic_notes/features/main/presentation/main_page.dart';
import 'package:my_basic_notes/features/profile/presentation/profile_page.dart';
import 'package:my_basic_notes/features/splash/presentation/splash_page.dart';

class RouteGenerator {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final isLoggedIn = GetIt.I<AuthBloc>().state is AuthSuccess;

    // Middleware: blokir akses /main kalau user belum login
    if (settings.name == AppRoutes.main && !isLoggedIn) {
      return MaterialPageRoute(builder: (_) => const LoginPage());
    }

    switch (settings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case AppRoutes.login:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case AppRoutes.signup:
        return MaterialPageRoute(builder: (_) => const SignUpPage());
      case AppRoutes.main:
        return MaterialPageRoute(builder: (_) => const MainPage());
      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case AppRoutes.addnotes:
        return MaterialPageRoute(builder: (_) => const AddNotesPage());
      case AppRoutes.profile:
        return MaterialPageRoute(builder: (_) => const ProfilePage());
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('404 Not Found')),
          ),
        );
    }

  }
}