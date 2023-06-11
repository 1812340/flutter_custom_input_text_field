
//Custom TextField helper widget for our app
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFieldWidget extends ConsumerWidget {
  final TextEditingController? controller;
  final String hintText;
  final int maxLines;
  final bool obscureText;
  final bool readOnly;
  final TextInputType textInputType;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? labelText;
  final VoidCallback? onTap;
  final void Function(String)? onChange;
  final EdgeInsetsGeometry? contentPadding;
  final Color? fillColor;
  final bool filled;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final FocusNode? focusNode;
  const TextFieldWidget({
    Key? key,
    this.controller,
    required this.hintText,
    this.obscureText = false,
    this.readOnly = false,
    this.maxLines = 1,
    this.textInputType = TextInputType.number,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.labelText,
    this.onTap,
    this.onChange,
    this.contentPadding,
    this.fillColor,
    this.filled = false,
    this.enabledBorder,
    this.focusedBorder,
    this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextFormField(
      //if textField is readonly
      readOnly: readOnly,
      onChanged: onChange ?? (value) {},
      keyboardType: textInputType,
      onTap: onTap,
      controller: controller,
      obscureText: obscureText,
      focusNode: focusNode,
      style: TextStyle(
        // fontFamily: currentTheme.textTheme.bodyText2?.fontFamily,
        color: Colors.black,
      ),
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        filled: filled,
        fillColor: fillColor,
        labelText: labelText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        suffixIconConstraints: BoxConstraints(maxWidth: 140.w, maxHeight: 40.h),
        contentPadding: contentPadding ?? EdgeInsets.only(left: 20.w),
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0.r),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
        enabledBorder: enabledBorder,
        focusedBorder: focusedBorder,
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0.r),
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
      ),
      maxLines: maxLines,
      //If validator is not given , it will use this validation by default
      validator: validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return "Enter your $hintText";
            }
            return null;
          },
    );
  }
}
