import 'dart:developer';

import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:evently_app/core/UI_Utils/ui_utils.dart';
import 'package:evently_app/core/resources/assets_manager.dart';
import 'package:evently_app/core/resources/colors_manager.dart';
import 'package:evently_app/core/resources/validators.dart';
import 'package:evently_app/core/routes/app_routes.dart';
import 'package:evently_app/core/widgets/custom_buttom_text.dart';
import 'package:evently_app/core/widgets/custom_elevated_button.dart';
import 'package:evently_app/core/widgets/custom_text_form_field.dart';
import 'package:evently_app/firebase_service/firebase_service.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/models/user_model.dart';
import 'package:evently_app/providers/config_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  bool securePassword = true;
  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    final configProvider = Provider.of<ConfigProvider>(context);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(
            left: 8,
            right: 8,
            top: 47,
            bottom: MediaQuery.of(context).viewInsets.top.h,
          ),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Image.asset(
                    ImagesAssets.eventlyLogo,
                    width: 136.w,
                    height: 186.h,
                  ),
                  SizedBox(height: 24.h),
                  CustomTextFormField(
                    controller: _emailController,
                    validator: (value) =>
                        Validator.validateEmail(value, context),
                    labelText: appLocalizations.email,
                    prefixIcon: Icons.email,
                  ),
                  SizedBox(height: 16.h),
                  CustomTextFormField(
                    controller: _passwordController,
                    validator: (value) =>
                        Validator.validatePassword(value, context),
                    obscureText: securePassword,
                    labelText: appLocalizations.password,
                    prefixIcon: Icons.lock,
                    suffixIcon: IconButton(
                      onPressed: _onClickedPasswordSecure,
                      icon: Icon(
                        securePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  CustomButtomText(text: appLocalizations.forget_password),
                  SizedBox(height: 16.h),
                  SizedBox(
                    width: 361.w,
                    height: 60.h,
                    child: CustomElevatedButton(
                      onPressed: _loginAccount,
                      title: appLocalizations.login,
                    ),
                  ),
                  SizedBox(height: 24.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${appLocalizations.dont_have_account} ",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      CustomButtomText(
                        onTap: () {
                          Navigator.pushReplacementNamed(
                            context,
                            AppRoutes.register,
                          );
                        },
                        text: appLocalizations.create_account,
                      ),
                    ],
                  ),
                  SizedBox(height: 34.h),
                  Row(
                    children: [
                      const Expanded(
                        child: Divider(
                          indent: 26,
                          endIndent: 16,
                          color: ColorsManager.blue,
                        ),
                      ),
                      Text(
                        appLocalizations.or,
                        style: GoogleFonts.inter(
                          color: ColorsManager.blue,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Expanded(
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
                      side: const BorderSide(color: ColorsManager.blue),
                    ),
                    onPressed: () async {
                      await signInWithGoogle();
                      UiUtils.showFluttertoast(
                        'User Login Successfully',
                        Colors.green,
                      );
                      Navigator.pushReplacementNamed(
                        context,
                        AppRoutes.mainLayout,
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(ImagesAssets.googleIconSvg),
                        const SizedBox(width: 10),
                        Text(
                          appLocalizations.login_with_google,
                          style: GoogleFonts.inter(
                            color: ColorsManager.blue,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24.h),
                  Center(
                    child: AnimatedToggleSwitch<String>.dual(
                      current: configProvider.currentlanguage,
                      first: 'en',
                      second: 'ar',
                      height: 45.h,
                      spacing: 2.w,
                      borderWidth: 2,
                      style: const ToggleStyle(
                        backgroundColor: Colors.transparent,
                        borderColor: ColorsManager.blue,
                        indicatorColor: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      animationDuration: const Duration(milliseconds: 300),
                      onChanged: (value) =>
                          configProvider.changeAppLanguage(value),
                      iconBuilder: (value) {
                        return SvgPicture.asset(
                          value == 'en'
                              ? ImagesAssets.enLogo
                              : ImagesAssets.egLogo,
                          height: 35.h,
                          width: 35.h,
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 30.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn.instance;
      await googleSignIn.initialize(
        serverClientId:
            "810878485681-r2g22pvpooc8crs6ceek06eidskgdi4d.apps.googleusercontent.com",
      );
      final GoogleSignInAccount? googleUser = await googleSignIn.authenticate();
      if (googleUser == null) return;
      final GoogleSignInAuthentication googleAuth = googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      UserCredential firebaseUser = await FirebaseAuth.instance
          .signInWithCredential(credential);

      UserModel finalUser = UserModel(
        name: firebaseUser.user?.displayName ?? 'No name provider',
        email: firebaseUser.user?.email ?? 'No email provider',
        id: firebaseUser.user?.uid ?? '',
        favouritesIds: [],
      );
      final existingUser = await FirebaseService.getUserFromFireStore(
        firebaseUser.user!.uid,
      );
      if (existingUser != null) {
        UserModel.currentUser = existingUser;
      } else {
        await FirebaseService.addUserToFireStore(finalUser);
        UserModel.currentUser = finalUser;
      }
    } catch (exception) {
      log(exception.toString());
    }
  }

  void _onClickedPasswordSecure() {
    setState(() {
      securePassword = !securePassword;
    });
  }

  void _loginAccount() async {
    if (_formKey.currentState?.validate() == false) return;
    try {
      UiUtils.showLoading(context);
      UserCredential userCredential = await FirebaseService.login(
        _emailController.text,
        _passwordController.text,
      );
      UserModel.currentUser = await FirebaseService.getUserFromFireStore(
        userCredential.user!.uid,
      );

      UiUtils.hideLoading(context);
      UiUtils.showFluttertoast('User Login Successfully', Colors.green);
      Navigator.pushReplacementNamed(context, AppRoutes.mainLayout);
    } on FirebaseAuthException catch (e) {
      UiUtils.hideLoading(context);
      UiUtils.showFluttertoast('Wrong Email or password', Colors.red);
    } catch (e) {
      log(e.toString());
      UiUtils.hideLoading(context);
      UiUtils.showFluttertoast('something Error', Colors.red);
    }
  }
}
