import 'package:evently_app/core/resources/assets_manager.dart';
import 'package:evently_app/core/resources/colors_manager.dart';
import 'package:evently_app/core/widgets/custom_buttom_text.dart';
import 'package:evently_app/core/widgets/custom_elevated_button.dart';
import 'package:evently_app/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool securePassword = true;
  bool secureRePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register')),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 16,vertical: MediaQuery.of(context).viewInsets.top.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                ImagesAssets.eventlyLogo,
                width: 136.w,
                height: 186.h,
              ),
              SizedBox(height: 24.h),
              CustomTextFormField(text: 'Name', prefixIcon: Icons.person),
              SizedBox(height: 16.h),
              CustomTextFormField(text: 'Email', prefixIcon: Icons.email),
              SizedBox(height: 16.h),
              CustomTextFormField(
                obscureText: securePassword,
                text: 'Password',
                prefixIcon: Icons.lock,
                suffixIcon: IconButton(
                  onPressed: _onClickedPasswordSecure,
                  icon: Icon(
                    securePassword ? Icons.visibility_off : Icons.visibility,
                    color: ColorsManager.grey,
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              CustomTextFormField(
                obscureText: secureRePassword,
                text: 'Re Password',
                prefixIcon: Icons.lock,
                suffixIcon: IconButton(
                  onPressed: _onClickedRePasswordSecure,
                  icon: Icon(
                    secureRePassword ? Icons.visibility_off : Icons.visibility,
                    color: ColorsManager.grey,
                  ),
                ),
              ),
              SizedBox(height: 16.h),

              CustomElevatedButton(title: 'Create Account'),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already Have Account ? ',
                    style: GoogleFonts.inter(
                      color: ColorsManager.black1c,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  CustomButtomText(text: 'Login'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onClickedPasswordSecure() {
    setState(() {
      securePassword = !securePassword;
    });
  }

  void _onClickedRePasswordSecure() {
    setState(() {
      securePassword = !securePassword;
    });
  }
}
