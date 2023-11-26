import 'package:expatswap_task/core/model/account_details.dart';
import 'package:expatswap_task/core/providers/auth_provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../core/utils/functions/functions.dart';
import '../../common/text_field.dart';
import '../../common/widgets.dart';

class EditProfileScreen extends StatefulWidget {
  static const String name = 'edit-profile-screen';
  static const String path = '/edit-profile-screen';
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _dateOfBirthController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneNoController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _addressController.dispose();
    _dateOfBirthController.dispose();
    _fullNameController.dispose();
    _phoneNoController.dispose();

    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    updateAccountDetails();
  }

  updateAccountDetails() {
    final AccountDetails accountDetails = context.read<AuthProvider>().details;
    setState(() {
      _fullNameController.text = accountDetails.fullName ?? '';
      _phoneNoController.text = accountDetails.phoneNumber ?? '';
      _dateOfBirthController.text = accountDetails.dateOfBirth ?? '';
      _addressController.text = accountDetails.address ?? '';
    });
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
                      'Edit Profile',
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
                      height: 20.h,
                    ),
                    ButtonWidget(
                      onPressed: authProvider.isLoading ? null : _editProfile,
                      child: authProvider.isLoading
                          ? const SizedBox(
                              width: 24.0,
                              height: 24.0,
                              child: CircularProgressIndicator(
                                strokeWidth: 3.0,
                                color: Colors.white,
                              ))
                          : const Text('Update Profile'),
                    ),
                    SizedBox(
                      height: 20.h,
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

  _editProfile() async {
    final form = _formKey.currentState;
    if (form!.validate()) {
      try {
        await context.read<AuthProvider>().editProfile(
            fullName: _fullNameController.text,
            phoneNumber: _phoneNoController.text,
            address: _addressController.text,
            dateOfBirth: _dateOfBirthController.text);
        await showSuccess('Profile Successfully Updated');
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
