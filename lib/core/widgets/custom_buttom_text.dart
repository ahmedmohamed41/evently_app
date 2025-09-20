import 'package:evently_app/core/resources/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButtomText extends StatelessWidget {
  const CustomButtomText({super.key, required this.text, this.onTap});
  final String text;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        textAlign: TextAlign.end,
        text,
        style: GoogleFonts.inter(
          fontStyle: FontStyle.italic,
          color: ColorsManager.blue,
          fontSize: 16,
          fontWeight: FontWeight.w500,
          decoration: TextDecoration.underline,
          decorationColor: ColorsManager.blue,
        ),
      ),
    );
  }
}
