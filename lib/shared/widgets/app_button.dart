import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_basic_notes/shared/app_colors.dart';
import 'package:my_basic_notes/shared/app_text_styles.dart';

class AppButton extends StatelessWidget{
  final String text;
  final VoidCallback onPressed;
  final Color color;

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color = AppColors.blue900,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 44.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r)
          ),
          elevation: 0
        ), 
        child: Text(
          text,
          style: AppTextStyles.baseBold.copyWith(color: AppColors.white),
        )
        
      ),
    );
  }

}