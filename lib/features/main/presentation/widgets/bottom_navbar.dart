import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_basic_notes/shared/app_colors.dart';

class AppBottomNavbar extends StatelessWidget{
  final int currentIndex;
  final Function(int) onTableSelected;

  const AppBottomNavbar ({
    super.key,
    required this.currentIndex,
    required this.onTableSelected
  });
  
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape:  const CircularNotchedRectangle(),
      notchMargin: 8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          IconButton(
            icon: SvgPicture.asset('assets/icons/ic_homepage.svg'),
            color: currentIndex == 0 ? AppColors.white : AppColors.white20,
            onPressed: () => onTableSelected(0),
          ),

          SizedBox(width: 224.w),

          IconButton(
            icon: SvgPicture.asset('assets/icons/ic_profile.svg'),
            color: currentIndex == 1 ? AppColors.white : AppColors.white20,
            onPressed: () => onTableSelected(1),
          ),
        ],
      ),
    );
  }

  
}