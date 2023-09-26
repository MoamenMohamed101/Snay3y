import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snay3y/constants.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    required this.controller,
    this.focusNode,
    this.keyBoardType,
    this.onEditingComplete,
    this.onSave,
    required this.hintText,
    this.validator,
    this.textInputAction,
    this.secure = false,
    this.suffixIcon,
    this.prefixIcon,
    this.fontOfHint = 12, this.onFieldSubmitted,
  });

  final TextEditingController controller;
  final FocusNode? focusNode;
  final TextInputType? keyBoardType;
  final VoidCallback? onEditingComplete;
  final void Function(String?)? onSave;
  final String? Function(String?)? validator;
  final String? Function(String?)? onFieldSubmitted;
  final String hintText;
  final TextInputAction? textInputAction;
  final bool secure;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final double? fontOfHint;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        onFieldSubmitted: onFieldSubmitted,
        controller: controller,
        cursorColor: kPrimaryColor,
        focusNode: focusNode,
        keyboardType: keyBoardType,
        onEditingComplete: onEditingComplete,
        onSaved: onSave,
        validator: validator,
        obscureText: secure,
        textInputAction: textInputAction,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          suffixIconColor: kMainColor,
          hintText: hintText,
          hintStyle:  TextStyle(
            fontSize: 12.sp,
            color: kGreyColor,
            fontWeight: FontWeight.w400,
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: kPrimaryColor),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: kPrimaryColor),
          ),
          disabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: kPrimaryColor),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: kPrimaryColor),
          ),
        ),
      ),
    );
  }
}
