import 'package:evently_app/core/resources/assets_manager.dart';
import 'package:evently_app/core/resources/validators.dart';
import 'package:evently_app/core/routes/app_routes.dart';
import 'package:evently_app/core/widgets/custom_buttom_text.dart';
import 'package:evently_app/core/widgets/custom_elevated_button.dart';
import 'package:evently_app/core/widgets/custom_text_form_field.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    return Scaffold(
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
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  ImagesAssets.eventlyLogo,
                  width: 136.w,
                  height: 186.h,
                ),
                SizedBox(height: 24.h),
                CustomTextFormField(
                  controller: _nameController,
                  validator:  (value) => Validator.validateName(value, context),
                  labelText: appLocalizations.name,
                  prefixIcon: Icons.person,
                ),
                SizedBox(height: 16.h),
                CustomTextFormField(
                  controller: _emailController,
                  validator: (value) => Validator.validateEmail(value, context),
                  labelText: appLocalizations.email,
                  prefixIcon: Icons.email,
                ),
                SizedBox(height: 16.h),
                CustomTextFormField(
                  controller: _passwordController,
                  validator: (value) => Validator.validatePassword(value, context),
                  obscureText: securePassword,
                  labelText: appLocalizations.password,
                  prefixIcon: Icons.lock,
                  suffixIcon: IconButton(
                    onPressed: _onClickedPasswordSecure,
                    icon: Icon(
                      securePassword ? Icons.visibility_off : Icons.visibility,
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                CustomTextFormField(
                  controller: _rePasswordController,
                  validator: (input) {
                    if (input == null || input.trim().isEmpty) {
                      return AppLocalizations.of(context)!.password_is_required;
                    }
                    if (input != _passwordController.text) {
                      return AppLocalizations.of(context)!.password_doesnt_match;
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
                CustomElevatedButton(
                  onPressed: _createAccount,
                  title:appLocalizations.create_account,
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _createAccount() {
    if (_formKey.currentState?.validate() == false) return;
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
