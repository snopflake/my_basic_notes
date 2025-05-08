import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_basic_notes/features/main/presentation/bloc/main_bloc.dart';
import 'package:my_basic_notes/features/main/presentation/widgets/bottom_navbar.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  final List<Widget> _pages = const [
    // 0 = homepage
    // 1 = profile page
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
        onPressed: () => {} //addNotes
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