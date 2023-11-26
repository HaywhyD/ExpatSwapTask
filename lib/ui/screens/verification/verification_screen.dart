import 'dart:async';
import 'dart:ui';
import 'package:expatswap_task/core/providers/auth_provider/auth_provider.dart';
import 'package:expatswap_task/ui/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:open_mail_app/open_mail_app.dart';
import 'package:provider/provider.dart';
import '../../../core/assets/assets.dart';
import '../../common/colors.dart';
import '../../common/widgets.dart';
import '../../theme/theme.dart';

class VerificationScreen extends StatefulWidget {
  static const String name = 'verification-screen';
  static const String path = '/verification-screen';

  const VerificationScreen({
    super.key,
  });

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 1), () {
      verifyEmail();
    });
  }

  verifyEmail() async {
    final authProvider = context.watch<AuthProvider>();

    try {
      await authProvider.verifyEmail(email: authProvider.email);
      if (authProvider.isEmailVerified) {
        navigateToHome();
      }
    } on Exception catch (e) {
      showError(e.toString());
    }
  }

  showError(String e) {
    showExpatErrorDialog(context, e.toString().split(':')[1]);
  }

  showSuccess(String message) {
    showExpatSuccessDialog(context, message);
  }

  navigateToHome() {
    context.go(HomeScreen.path);
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        child: Builder(builder: (context) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColor.lightShade1.withOpacity(.9),
                ),
                alignment: Alignment.center,
                height: MediaQuery.sizeOf(context).height * 0.65,
                width: double.infinity,
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 20.0,
                    sigmaY: 4.0,
                  ),
                  child: SvgPicture.asset(
                    Assets.sentEmail,
                    height: 250.h,
                    width: 250.w,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                color: Colors.white,
                height: MediaQuery.sizeOf(context).height * 0.35,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      'Check your email',
                      style: LightTheme.textTheme.displayLarge!.copyWith(
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      'We\'ve sent a magic link to:',
                      style: LightTheme.textTheme.bodyMedium!.copyWith(
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      authProvider.email,
                      style: LightTheme.textTheme.bodyMedium!.copyWith(
                        color: AppColor.darkShade1,
                      ),
                    ),
                    const Spacer(),
                    ButtonWidget(
                      onPressed: _openEmailApp,
                      child: const Text('Open email app'),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  _openEmailApp() async {
    await OpenMailApp.openMailApp();
  }
}
