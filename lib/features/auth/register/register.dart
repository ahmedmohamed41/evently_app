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
import 'package:provider/provider.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool securePassword = true;
  bool secureRePassword = true;
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _rePasswordController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _rePasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _rePasswordController.dispose();
    super.dispose();
  }

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
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(
                    ImagesAssets.eventlyLogo,
                    width: 136.w,
                    height: 186.h,
                  ),
                  SizedBox(height: 24.h),
                  CustomTextFormField(
                    controller: _nameController,
                    validator: (value) =>
                        Validator.validateName(value, context),
                    labelText: appLocalizations.name,
                    prefixIcon: Icons.person,
                  ),
                  SizedBox(height: 16.h),
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
                  CustomTextFormField(
                    controller: _rePasswordController,
                    validator: (input) {
                      if (input == null || input.trim().isEmpty) {
                        return AppLocalizations.of(
                          context,
                        )!.password_is_required;
                      }
                      if (input != _passwordController.text) {
                        return AppLocalizations.of(
                          context,
                        )!.password_doesnt_match;
                      }
                      return null;
                    },
                    obscureText: secureRePassword,
                    labelText: appLocalizations.re_password,
                    prefixIcon: Icons.lock,
                    suffixIcon: IconButton(
                      onPressed: _onClickedRePasswordSecure,
                      icon: Icon(
                        secureRePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  SizedBox(
                    width: 361.w,
                    height: 60.h,
                    child: CustomElevatedButton(
                      onPressed: _createAccount,
                      title: appLocalizations.create_account,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${appLocalizations.already_have_account} ',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      CustomButtomText(
                        onTap: () {
                          Navigator.pushReplacementNamed(
                            context,
                            AppRoutes.login,
                          );
                        },
                        text: appLocalizations.login,
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  AnimatedToggleSwitch<String>.dual(
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
                  SizedBox(height: 30.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _createAccount() async {
    if (_formKey.currentState?.validate() == false) return;
    try {
      UiUtils.showLoading(context);
      UserCredential userCredential = await FirebaseService.register(
        _emailController.text,
        _passwordController.text,
      );

      await FirebaseService.addUserToFireStore(
        UserModel(
          id: userCredential.user!.uid,
          name: _nameController.text,
          email: _emailController.text,
          favouritesIds: [],
        ),
      );
      UiUtils.hideLoading(context);
      UiUtils.showFluttertoast('User Registered Successfully', Colors.green);
      Navigator.pushReplacementNamed(context, AppRoutes.login);
    } on FirebaseAuthException catch (e) {
      UiUtils.hideLoading(context);
      if (e.code == 'weak-password') {
        log('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        UiUtils.showFluttertoast('The account already exists', Colors.red);
      }
    } catch (e) {
      log(e.toString());
    }
  }

  void _onClickedPasswordSecure() {
    setState(() {
      securePassword = !securePassword;
    });
  }

  void _onClickedRePasswordSecure() {
    setState(() {
      secureRePassword = !secureRePassword;
    });
  }
}
