import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_basic_notes/shared/app_colors.dart';
import 'package:my_basic_notes/shared/app_text_styles.dart';

class AppTextField extends StatefulWidget {

  final String label;
  final TextEditingController controller;
  final bool isPassword;
  final TextInputType keyboardType;

  const AppTextField({
    super.key,
    required this.label,
    required this.controller,
    this.isPassword = false,
    this.keyboardType = TextInputType.text
  });
  
  @override
  State<AppTextField> createState() => _AppTextFieldState();

}

class _AppTextFieldState extends State<AppTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text(
          widget.label, 
          style: AppTextStyles.baseRegular
        ),

        SizedBox(height: 12.h),

        SizedBox(
          height: 40.h,
          child: TextField(
            controller: widget.controller,
            keyboardType: widget.keyboardType,
            obscureText: widget.isPassword ? _obscureText : false,
            style: AppTextStyles.baseRegular.copyWith(color: AppColors.blue800),

            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10.w.h),
              hintText: "Masukkan ${widget.label.toLowerCase()}",
              hintStyle: AppTextStyles.baseRegular.copyWith(color: AppColors.blue700),
              fillColor: AppColors.blue50,
              filled: true,
          
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.dg),
                borderSide: BorderSide(
                  color: AppColors.blue900,
                  width: 1.w,
                )
              ),
          
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.dg),
                borderSide: BorderSide(
                  color: AppColors.orange500,
                  width: 1.5.w,
                )
              ),
              
              suffixIcon: widget.isPassword ? 
                IconButton(
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  }, 
                  icon: SvgPicture.asset(
                    _obscureText ? 'assets/icons/eye_off.svg' : 'assets/icons/eye_on.svg'
                  ))
                  : null,
            ),
          ),
        ),  
      ],
    );
  }
}