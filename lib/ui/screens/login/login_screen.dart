import 'package:email_validator/email_validator.dart';
import 'package:expatswap_task/ui/screens/home/home_screen.dart';
import 'package:expatswap_task/ui/screens/verification/verification_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../core/assets/assets.dart';
import '../../../core/providers/auth_provider/auth_provider.dart';
import '../../common/colors.dart';
import '../../common/text_field.dart';
import '../../common/widgets.dart';
import '../../theme/theme.dart';
import '../register/register_screen.dart';
import 'forgot_password.dart';

class LoginScreen extends StatefulWidget {
  static const String name = 'login-screen';
  static const String path = '/login-screen';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isShowPasswordChecked = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 44.0,
              left: 20,
              right: 20.0,
            ),
            child: Builder(builder: (context) {
              return Form(
                key: _formKey,
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
                      height: 10.h,
                    ),
                    Text(
                      'Welcome Back',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: 32.h,
                    ),
                    Text(
                      'Login',
                      style: GoogleFonts.poppins(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    const Text('Email Address'),
                    SizedBox(
                      height: 6.h,
                    ),
                    ExpatTextField(
                      hint: 'example@email.com',
                      textEditingController: _emailController,
                      textInputAction: TextInputAction.next,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter a valid email';
                        } else if (!EmailValidator.validate(value)) {
                          return 'Enter a valid email';
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
                    SizedBox(
                      height: 24.h,
                    ),
                    const Text('Password'),
                    SizedBox(
                      height: 6.h,
                    ),
                    ExpatTextField(
                      hint: 'Enter your password',
                      textEditingController: _passwordController,
                      textInputAction: TextInputAction.done,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter a valid password';
                        }
                        return null;
                      },
                      onClickSuffixIcon: () {
                        _passwordController.text = '';
                      },
                      maxLines: 1,
                      obscureText: isShowPasswordChecked,
                      suffixIcon: Icon(
                        Icons.close,
                        size: 16.sp,
                      ),
                      keyboardType: TextInputType.visiblePassword,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              value: !isShowPasswordChecked,
                              onChanged: (value) {
                                setState(() {
                                  isShowPasswordChecked =
                                      !isShowPasswordChecked;
                                });
                              },
                            ),
                            const Text('Show Password'),
                          ],
                        ),
                        InkWell(
                          onTap: () => context.push(ForgotPassword.path),
                          child: Text(
                            'Forgot Password?',
                            style: LightTheme.textTheme.bodyMedium!.copyWith(
                              color: AppColor.darkShade1,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 24.sp,
                    ),
                    ButtonWidget(
                      onPressed: authProvider.isLoading ? null : _login,
                      child: authProvider.isLoading
                          ? const SizedBox(
                              width: 24.0,
                              height: 24.0,
                              child: CircularProgressIndicator(
                                strokeWidth: 3.0,
                                color: Colors.white,
                              ))
                          : const Text('Login'),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('or'),
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    OutlinedButton(
                      onPressed:
                          authProvider.isLoading ? null : _loginWithGoogle,
                      child: authProvider.isLoading
                          ? const SizedBox(
                              width: 24.0,
                              height: 24.0,
                              child: CircularProgressIndicator(
                                strokeWidth: 3.0,
                                color: Colors.white,
                              ))
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                    height: 25.h,
                                    width: 25.h,
                                    child: SvgPicture.asset(Assets.google)),
                                SizedBox(
                                  width: 10.w,
                                ),
                                const Text('Sign in with Google'),
                              ],
                            ),
                    ),
                    SizedBox(
                      height: 40.sp,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: InkWell(
                        onTap: () =>
                            context.pushReplacement(RegisterScreen.path),
                        child: RichText(
                          text: TextSpan(
                            text: 'Don\'t have an account? ',
                            style: Theme.of(context).textTheme.bodyMedium,
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Register Here',
                                style:
                                    LightTheme.textTheme.bodyMedium!.copyWith(
                                  color: AppColor.darkShade1,
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }

  _login() async {
    final form = _formKey.currentState;
    if (form!.validate()) {
      try {
        final isVerified = await context.read<AuthProvider>().login(
            email: _emailController.text, password: _passwordController.text);

        if (isVerified) {
          navigateToHome();
        } else {
          navigateToVerification();
        }
      } on Exception catch (e) {
        showError(e.toString());
      }
    }
  }

  _loginWithGoogle() async {
    try {
      final isVerified = await context.read<AuthProvider>().loginWithGoogle();

      if (isVerified) {
        navigateToHome();
      } else {
        navigateToVerification();
      }
    } on Exception catch (e) {
      showError(e.toString());
    }
  }

  showError(String e) {
    showExpatErrorDialog(context, e.toString().split(':')[1]);
  }

  navigateToVerification() {
    context.push(VerificationScreen.path);
  }

  navigateToHome() {
    context.go(HomeScreen.path);
  }
}
