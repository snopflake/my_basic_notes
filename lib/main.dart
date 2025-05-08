import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_basic_notes/config/injection.dart';
import 'package:my_basic_notes/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:my_basic_notes/features/main/presentation/bloc/main_bloc.dart';
import 'package:my_basic_notes/features/splash/presentation/splash_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  // Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Dependencies Injection
  await setupLocator();

  // Run
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<AuthBloc>()),
        BlocProvider(create: (_) => sl<MainBloc>()),
        // Add more
      ],
      child: const MainApp(),
    ),
  );
}

// Insight:
// (_) artinya kamu menerima context/parameter, tapi kamu tidak memakainya 
// (context) artinya kamu menerima context/parameter, lalu kamu gunakan

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(412, 917),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(debugShowCheckedModeBanner: false, home: child);
      },
      child: const SplashPage(),
    );
  }
}
