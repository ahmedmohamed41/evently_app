import 'package:evently_app/core/resources/assets_manager.dart';
import 'package:evently_app/core/resources/colors_manager.dart';
import 'package:evently_app/core/widgets/custom_buttom_text.dart';
import 'package:evently_app/core/widgets/custom_elevated_button.dart';
import 'package:evently_app/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool securePassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: MediaQuery.of(context).viewInsets.top.h,
          ),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  ImagesAssets.eventlyLogo,
                  width: 136.w,
                  height: 186.h,
                ),
                SizedBox(height: 24.h),
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
                CustomButtomText(text: 'Forget Password?'),
                SizedBox(height: 16.h),
                CustomElevatedButton(title: 'Login'),
                SizedBox(height: 24.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don’t Have Account ? ',
                      style: GoogleFonts.inter(
                        color: ColorsManager.black1c,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    CustomButtomText(text: 'Create Account'),
                  ],
                ),

                SizedBox(height: 34.h),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        indent: 26,
                        endIndent: 16,
                        color: ColorsManager.blue,
                      ),
                    ),
                    Text(
                      'or',
                      style: GoogleFonts.inter(
                        color: ColorsManager.blue,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        indent: 16,
                        endIndent: 26,
                        color: ColorsManager.blue,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24.h),
                MaterialButton(
                  padding: EdgeInsets.symmetric(vertical: 17.h),
                  shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(16.r),
                    side: BorderSide(color: ColorsManager.blue),
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(ImagesAssets.googleIcon),
                      SizedBox(width: 10),
                      Text(
                        'Login With Google',
                        style: GoogleFonts.inter(
                          color: ColorsManager.blue,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
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
}
