import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.maxLines = 1,
    this.labelText,
    this.prefixIcon,
    this.hintText,
    this.suffixIcon,
    this.obscureText = false,
    this.validator,
    this.controller,
  });
  final String? labelText;
  final int? maxLines;
  final String? hintText;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      controller: controller,
      validator: validator,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.bodySmall,
        labelText: labelText,
       
        prefixIcon: prefixIcon == null
            ? null
            : Icon(prefixIcon,),
        suffixIcon: suffixIcon,
      ),
    );
  }
}
