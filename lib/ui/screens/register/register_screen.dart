import 'package:expatswap_task/core/providers/auth_provider/auth_provider.dart';
import 'package:expatswap_task/ui/screens/login/login_screen.dart';
import 'package:expatswap_task/ui/screens/verification/verification_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../core/utils/functions/functions.dart';
import '../../common/colors.dart';
import '../../common/text_field.dart';
import '../../common/widgets.dart';
import '../../theme/theme.dart';
import 'package:email_validator/email_validator.dart';

class RegisterScreen extends StatefulWidget {
  static const String name = 'register-screen';
  static const String path = '/register-screen';
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _dateOfBirthController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneNoController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isShowPasswordChecked = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _addressController.dispose();
    _dateOfBirthController.dispose();
    _fullNameController.dispose();
    _phoneNoController.dispose();
    _confirmPasswordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 20.0,
              left: 20,
              right: 20.0,
            ),
            child: Builder(builder: (context) {
              return Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Register',
                      style: GoogleFonts.poppins(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    const Text('Full Name'),
                    SizedBox(
                      height: 6.h,
                    ),
                    ExpatTextField(
                      hint: 'John Doe',
                      textEditingController: _fullNameController,
                      textInputAction: TextInputAction.next,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Required field';
                        }
                        return null;
                      },
                      onClickSuffixIcon: () {
                        _fullNameController.text = '';
                      },
                      suffixIcon: Icon(
                        Icons.close,
                        size: 16.sp,
                      ),
                      keyboardType: TextInputType.name,
                    ),
                    SizedBox(
                      height: 15.h,
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
                          return 'Required field';
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
                      height: 15.h,
                    ),
                    const Text('Phone Number'),
                    SizedBox(
                      height: 6.h,
                    ),
                    ExpatTextField(
                      hint: '09012345678',
                      textEditingController: _phoneNoController,
                      textInputAction: TextInputAction.next,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Required field';
                        } else if (value.length < 11 || value.length > 11) {
                          return 'Enter a valid phone number';
                        }
                        return null;
                      },
                      onClickSuffixIcon: () {
                        _phoneNoController.text = '';
                      },
                      suffixIcon: Icon(
                        Icons.close,
                        size: 16.sp,
                      ),
                      keyboardType: TextInputType.phone,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    const Text('Date Of Birth'),
                    SizedBox(
                      height: 6.h,
                    ),
                    ExpatTextField(
                      textEditingController: _dateOfBirthController,
                      hint: '01-01-2020',
                      readOnly: true,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.toString().isEmpty) {
                          return 'Date of Birth cannot be empty';
                        }
                        return null;
                      },
                      onTap: () async {
                        final dateTime = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime.now());

                        if (dateTime == null) return;
                        setState(() {
                          _dateOfBirthController.text =
                              '${formatDigit(dateTime.year)}-${formatDigit(dateTime.month)}-${dateTime.day}';
                        });
                      },
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    const Text('Address'),
                    SizedBox(
                      height: 6.h,
                    ),
                    ExpatTextField(
                      hint: 'Address',
                      textEditingController: _addressController,
                      textInputAction: TextInputAction.next,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Required field';
                        }
                        return null;
                      },
                      onClickSuffixIcon: () {
                        _addressController.text = '';
                      },
                      suffixIcon: Icon(
                        Icons.close,
                        size: 16.sp,
                      ),
                      keyboardType: TextInputType.streetAddress,
                    ),
                    SizedBox(
                      height: 15.h,
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
                          return 'Required field';
                        } else if (value.length < 6) {
                          return 'Password too short';
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
                    SizedBox(
                      height: 15.h,
                    ),
                    const Text('Confirm Password'),
                    SizedBox(
                      height: 6.h,
                    ),
                    ExpatTextField(
                      hint: 'Confirm password',
                      textEditingController: _confirmPasswordController,
                      textInputAction: TextInputAction.next,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Required field';
                        } else if (value != _passwordController.text) {
                          return 'Password do not match';
                        }
                        return null;
                      },
                      maxLines: 1,
                      obscureText: isShowPasswordChecked,
                      onClickSuffixIcon: () {
                        _confirmPasswordController.text = '';
                      },
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
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    ButtonWidget(
                      onPressed: authProvider.isLoading ? null : _register,
                      child: authProvider.isLoading
                          ? const SizedBox(
                              width: 24.0,
                              height: 24.0,
                              child: CircularProgressIndicator(
                                strokeWidth: 3.0,
                                color: Colors.white,
                              ))
                          : const Text('Register'),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: InkWell(
                        onTap: () => context.pushReplacement(LoginScreen.path),
                        child: RichText(
                          text: TextSpan(
                            text: 'Already have an account? ',
                            style: Theme.of(context).textTheme.bodyMedium,
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Login',
                                style:
                                    LightTheme.textTheme.bodyMedium!.copyWith(
                                  color: AppColor.primaryColor,
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.sp,
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }

  _register() async {
    final form = _formKey.currentState;
    if (form!.validate()) {
      try {
        await context.read<AuthProvider>().signUp(
            email: _emailController.text,
            fullName: _fullNameController.text,
            password: _passwordController.text,
            phoneNumber: _phoneNoController.text,
            address: _addressController.text,
            dateOfBirth: _dateOfBirthController.text);
        await showSuccess('Sign Up Successful. Click ok to verify email.');
        Future.delayed(
          const Duration(
            milliseconds: 1000,
          ),
          () => context.push(VerificationScreen.path),
        );
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
