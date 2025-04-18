import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_basic_notes/shared/app_colors.dart';
import 'package:my_basic_notes/shared/app_text_styles.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingDialog {

  static void show(BuildContext  context) {
    showDialog(
      context: context, 
      barrierDismissible: false, //user tidak bisa klik di luar modal

      builder:  (_) => Dialog(
        backgroundColor: Colors.transparent,
        elevation: 1,
        child: Container(
          width: 150.w,
          height: 150.w,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              width: 1.w,
              color: AppColors.blue800
            )
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SpinKitCubeGrid(
                color: AppColors.orange100,
                size: 60,
              ),
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