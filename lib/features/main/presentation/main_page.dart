import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_basic_notes/features/homepage/presentation/homepage.dart';
import 'package:my_basic_notes/features/main/presentation/bloc/main_bloc.dart';
import 'package:my_basic_notes/features/main/presentation/widgets/bottom_navbar.dart';
import 'package:my_basic_notes/features/profile/presentation/profile_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  List<Widget> get _pages => const [
    HomePage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  BlocBuilder<MainBloc, MainState>(
        builder: (context, state) {
          return IndexedStack(
            index: state.currentIndex,
            children: _pages,
          );
        },
      ),
      
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Navigator.pushNamed(context, '/addnotes')
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
     
     // Navbar
      bottomNavigationBar: BlocBuilder<MainBloc, MainState>(
        builder: (context, state) {
         return AppBottomNavbar(
            currentIndex: state.currentIndex,
            onTableSelected: (index) {
              context.read<MainBloc>().add(TabChanged(index));
            },
          );
        }
      )

    );
  }
}