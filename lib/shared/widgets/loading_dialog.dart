import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_basic_notes/shared/app_colors.dart';
import 'package:my_basic_notes/shared/app_text_styles.dart';

class LoadingDialog {

  static void show(BuildContext  context) {
    showDialog(
      context: context, 
      barrierDismissible: false, //user tidak bisa klik di luar modal
      builder:  (_) => Dialog(
        backgroundColor: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12)
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircularProgressIndicator(),
              SizedBox(height: 12.h),
              Text(
                "Tunggu sebentar yaa~",
                style: AppTextStyles.baseRegular,
              )
            ],
          
          ),
        ),
      )
    );
  }

  static void hide(BuildContext context) {
    Navigator.of(context, rootNavigator: true).pop();
  }

}