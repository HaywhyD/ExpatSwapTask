import 'package:expatswap_task/core/model/account_details.dart';
import 'package:expatswap_task/core/providers/auth_provider/auth_provider.dart';
import 'package:expatswap_task/ui/screens/login/login_screen.dart';
import 'package:expatswap_task/ui/screens/profile/edit_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../common/colors.dart';
import '../../common/text_field.dart';
import '../../common/widgets.dart';
import '../../theme/theme.dart';

class HomeScreen extends StatefulWidget {
  static const String name = 'agent-register-screen';
  static const String path = '/agent-register-screen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
  String _name = '';
  String _email = '';

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
  void initState() {
    super.initState();
    updateAccountDetails();
  }

  Future<void> updateAccountDetails() async {
    final AccountDetails accountDetails = context.read<AuthProvider>().details;
    setState(() {
      _emailController.text = accountDetails.email ?? '';
      _fullNameController.text = accountDetails.fullName ?? '';
      _phoneNoController.text = accountDetails.phoneNumber ?? '';
      _dateOfBirthController.text = accountDetails.dateOfBirth ?? '';
      _addressController.text = accountDetails.address ?? '';
      _email = accountDetails.email ?? '';
      _name = accountDetails.fullName ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: RefreshIndicator(
          triggerMode: RefreshIndicatorTriggerMode.anywhere,
          onRefresh: updateAccountDetails,
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
                        'Profile',
                        style: GoogleFonts.poppins(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Container(
                        padding: EdgeInsets.all(15.w),
                        height: 100.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: LightTheme.primaryColor,
                            borderRadius: BorderRadius.circular(8)),
                        child: Row(
                          children: [
                            Container(
                              height: 60.h,
                              width: 60.w,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2,
                                ),
                                image: context
                                        .read<AuthProvider>()
                                        .profilePic
                                        .isEmpty
                                    ? const DecorationImage(
                                        image: AssetImage(
                                          "assets/icon/icon.png",
                                        ),
                                        fit: BoxFit.cover,
                                      )
                                    : DecorationImage(
                                        image: NetworkImage(
                                          context
                                              .read<AuthProvider>()
                                              .profilePic,
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                              ),
                            ),
                            SizedBox(
                              width: 20.w,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _name,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.sp,
                                  ),
                                ),
                                Text(
                                  _email,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.sp,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
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
                        readOnly: true,
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
                        readOnly: true,
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
                      SizedBox(
                        height: 20.h,
                      ),
                      ButtonWidget(
                        onPressed: () async {
                          await context.push(EditProfileScreen.path);
                          updateAccountDetails();
                        },
                        child: const Text('Edit Profile'),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: InkWell(
                          onTap: _logout,
                          child: RichText(
                            text: TextSpan(
                              text: 'Logout',
                              style: LightTheme.textTheme.bodyMedium!.copyWith(
                                color: AppColor.primaryColor,
                              ),
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
      ),
    );
  }

  _logout() async {
    final form = _formKey.currentState;
    if (form!.validate()) {
      try {
        await context.read<AuthProvider>().logout();
        await showSuccess('Logout Successful, click ok to continue');
        Future.delayed(
          const Duration(
            milliseconds: 1000,
          ),
          () => context.go(LoginScreen.path),
        );
      } on Exception catch (e) {
        showError(e.toString());
      }
    }
  }

  showError(String e) {
    showExpatErrorDialog(context, e.toString().split(':')[1]);
  }

  showSuccess(String message) async {
    await showExpatSuccessDialog(context, message);
  }
}
