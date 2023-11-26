import 'package:expatswap_task/core/data/database/database.dart';
import 'package:expatswap_task/core/providers/auth_provider/auth_provider.dart';
import 'package:expatswap_task/ui/screens/home/home_screen.dart';
import 'package:expatswap_task/ui/screens/login/login_screen.dart';
import 'package:expatswap_task/ui/screens/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../core/model/account_details.dart';

class SplashScreen extends StatefulWidget {
  static const String name = 'splash-screen';
  static const String path = '/splash-screen';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final LocalDatabase _database = LocalDatabase.instance;
  AccountDetails _accountDetails = AccountDetails();

  @override
  void initState() {
    super.initState();

    checkUser();
  }

  checkUser() async {
    final accountDetails = await _database.fetchAccountDetails();
    if (accountDetails.isNotEmpty) {
      setState(() {
        _accountDetails = AccountDetails.fromMap(accountDetails[0]);
      });
      await updateDetails(accountDetails);
      if (_accountDetails.isLoggedIn == true &&
          _accountDetails.isVerified == true) {
        navigateToScreen(HomeScreen.path);
      } else if (_accountDetails.isLoggedIn == true &&
          _accountDetails.isVerified == false) {
        navigateToScreen(LoginScreen.path);
      } else {
        navigateToScreen(OnboardingScreen.path);
      }
    } else {
      navigateToScreen(OnboardingScreen.path);
    }
  }

  navigateToScreen(String path) {
    Future.delayed(
      const Duration(
        milliseconds: 2000,
      ),
      () => context.go(path),
    );
  }

  updateDetails(accountDetails) {
    context
        .read<AuthProvider>()
        .updateDetails(AccountDetails.fromMap(accountDetails[0]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Hero(
        flightShuttleBuilder: (
          flightContext,
          animation,
          flightDirection,
          fromHeroContext,
          toHeroContext,
        ) {
          switch (flightDirection) {
            case HeroFlightDirection.push:
              return Material(
                color: Colors.transparent,
                child: ScaleTransition(
                  scale: animation.drive(
                    Tween<double>(
                      begin: 0,
                      end: 1,
                    ).chain(
                      CurveTween(
                        curve: Curves.fastOutSlowIn,
                      ),
                    ),
                  ),
                  child: toHeroContext.widget,
                ),
              );

            case HeroFlightDirection.pop:
              return Material(
                color: Colors.transparent,
                child: toHeroContext.widget,
              );
          }
        },
        tag: 'profile',
        child: Container(
          width: 100,
          height: 100,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(
                'assets/icon/icon.png',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
      )),
    );
  }
}
