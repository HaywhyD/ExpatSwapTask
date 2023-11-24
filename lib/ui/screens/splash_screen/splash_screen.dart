import 'package:expatswap_task/ui/screens/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  static const String name = 'splash-screen';
  static const String path = '/splash-screen';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(
        milliseconds: 3000,
      ),
      () => context.go(OnboardingScreen.path),
    );
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
