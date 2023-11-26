import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../core/assets/assets.dart';
import '../../../core/providers/auth_provider/auth_provider.dart';
import '../../common/text_field.dart';
import '../../common/widgets.dart';

class ForgotPassword extends StatefulWidget {
  static const String name = 'forgot-password';
  static const String path = '/forgot-password';
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 44.0,
            left: 20,
            right: 20.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 67.h,
                    width: 67.w,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(Assets.icon),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 32.h,
              ),
              Text(
                'Forgot Password?',
                style: GoogleFonts.poppins(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              Text(
                'Enter your emaill address',
                style: GoogleFonts.poppins(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Form(
                key: _formKey,
                child: ExpatTextField(
                  hint: 'example@email.com',
                  textEditingController: _emailController,
                  textInputAction: TextInputAction.go,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Required field';
                    }
                    return null;
                  },
                  onClickSuffixIcon: () {
                    _emailController.text = '';
                  },
                  suffixIcon: Icon(
                    Icons.close,
                    size: 16.sp,
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              ElevatedButton(
                onPressed: _resetPassword,
                style: const ButtonStyle(
                  splashFactory: NoSplash.splashFactory,
                ),
                child: const Text('Reset Password'),
              ),
              SizedBox(
                height: 24.h,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Check your email to get reset password',
                  style: GoogleFonts.poppins(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _resetPassword() async {
    final form = _formKey.currentState;
    if (form?.validate() == true) {
      try {
        await context
            .read<AuthProvider>()
            .resetPassword(email: _emailController.text);
        showSuccess(
            'A password Reset Email has been sent to your email address');
      } on Exception catch (e) {
        showError(e.toString());
      }
    }
  }

  showError(String e) {
    showExpatErrorDialog(context, e.toString().split(':')[1]);
  }

  showSuccess(String message) {
    showExpatSuccessDialog(context, message);
  }
}
