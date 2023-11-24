import 'package:expatswap_task/ui/common/colors.dart';
import 'package:expatswap_task/ui/screens/login/login_screen.dart';
import 'package:expatswap_task/ui/screens/register/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../core/assets/assets.dart';
import '../../common/widgets.dart';
import '../../theme/theme.dart';

class OnboardingScreen extends StatefulWidget {
  static const String name = 'onboarding-screen';
  static const String path = '/onboarding-screen';
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController(initialPage: 0);
  double _progress = 1 / 3;
  bool _isLastPage = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          PageView(
            onPageChanged: (value) {
              if (value == 0) {
                setState(() {
                  _isLastPage = false;
                  _progress = 1 / 3;
                });
              } else if (value == 1) {
                setState(() {
                  _isLastPage = false;
                  _progress = 2 / 3;
                });
              } else if (value == 2) {
                setState(() {
                  _isLastPage = true;
                  _progress = 3 / 3;
                });
              }
            },
            controller: _controller,
            children: [
              OnboardingWidget(
                svgImage: Assets.onboarding1,
                headerText: 'Welcome to PersonalInfo',
                bodyText:
                    'Your gateway to secure and streamlined personal information management. Let\'s get started on a journey of convenience and data empowerment',
              ),
              OnboardingWidget(
                svgImage: Assets.onboarding2,
                headerText: 'Secure Authentication',
                bodyText:
                    'Enjoy peace of mind with our secure authentication process. Choose between Google and Email to ensure your data stays safe and sound.',
              ),
              OnboardingWidget(
                svgImage: Assets.onboarding3,
                headerText: 'Effortless Data Submission',
                bodyText:
                    'Inputting personal information has never been easier! Our intuitive form makes data submission a breeze, ensuring accuracy and completeness',
              ),
            ],
          ),
          Positioned(
            right: 20.w,
            top: 70.h,
            child: AnimatedOpacity(
              opacity: _isLastPage ? 0 : 1,
              duration: const Duration(milliseconds: 400),
              child: InkWell(
                onTap: () {
                  _controller.animateToPage(
                    2,
                    curve: Curves.easeInOut,
                    duration: const Duration(milliseconds: 500),
                  );
                },
                child: Row(
                  children: [
                    Text(
                      'Skip',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    SvgPicture.asset(Assets.arrowForward)
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 20,
            right: 20,
            bottom: 50.h,
            child: InkWell(
              onTap: () async {
                await _controller.nextPage(
                  curve: Curves.easeInOut,
                  duration: const Duration(milliseconds: 500),
                );
              },
              child: Row(
                children: [
                  SmoothPageIndicator(
                    controller: _controller, // PageController
                    count: 3,
                    effect: ExpandingDotsEffect(
                      activeDotColor: Colors.white,
                      dotHeight: 10.h,
                      dotWidth: 10.w,
                    ), // your preferred effect
                  ),
                  Expanded(
                    child: SizedBox(
                      width: 1.w,
                    ),
                  ),
                  Stack(
                    alignment: const Alignment(0, 0),
                    children: [
                      SizedBox(
                        height: 60.h,
                        width: 60.w,
                        child: CircularProgressIndicator.adaptive(
                          value: _progress,
                          backgroundColor: Colors.white,
                          strokeWidth: 1.w,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          if (_controller.page != 2) {
                            _controller.animateToPage(
                              _controller.page == 0 ? 1 : 2,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                            );
                          } else {
                            showLoginBottomSheet();
                          }
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: 40.w,
                          height: 40.h,
                          decoration: const ShapeDecoration(
                            color: Colors.white,
                            shape: OvalBorder(),
                            shadows: [
                              BoxShadow(
                                color: Color(0x1E2F2B43),
                                blurRadius: 14,
                                offset: Offset(0, 3),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                          child: Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 14.sp,
                            weight: 1.w,
                            color: AppColor.darkShade1,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  showLoginBottomSheet() {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        isDismissible: true,
        builder: (context) {
          return Container(
            padding: const EdgeInsets.all(20),
            height: MediaQuery.sizeOf(context).height * 0.3,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.r),
                topRight: Radius.circular(15.r),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ButtonWidget(
                  onPressed: () => context.push(LoginScreen.path),
                  child: Text(
                    'Login',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  'or',
                  style: GoogleFonts.poppins(
                    color: LightTheme.primaryColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                ButtonWidget(
                  onPressed: () => context.push(RegisterScreen.path),
                  child: Text(
                    'Register',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
