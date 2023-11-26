import 'package:expatswap_task/ui/screens/login/login_screen.dart';
import 'package:expatswap_task/ui/screens/onboarding/onboarding_screen.dart';
import 'package:expatswap_task/ui/screens/profile/edit_profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../../ui/screens/home/home_screen.dart';
import '../../ui/screens/login/forgot_password.dart';
import '../../ui/screens/register/register_screen.dart';
import '../../ui/screens/splash_screen/splash_screen.dart';
import '../../ui/screens/verification/verification_screen.dart';

final routes = GoRouter(
  initialLocation: SplashScreen.path,
  routes: [
    GoRoute(
      name: SplashScreen.name,
      path: SplashScreen.path,
      pageBuilder: (context, state) => CupertinoPage<void>(
        child: const SplashScreen(),
        key: state.pageKey,
      ),
    ),
    GoRoute(
      name: LoginScreen.name,
      path: LoginScreen.path,
      pageBuilder: (context, state) => CupertinoPage<void>(
        child: const LoginScreen(),
        key: state.pageKey,
      ),
    ),
    GoRoute(
      name: HomeScreen.name,
      path: HomeScreen.path,
      pageBuilder: (context, state) => CupertinoPage<void>(
        child: const HomeScreen(),
        key: state.pageKey,
      ),
    ),
    GoRoute(
      name: OnboardingScreen.name,
      path: OnboardingScreen.path,
      pageBuilder: (context, state) => CupertinoPage<void>(
        child: const OnboardingScreen(),
        key: state.pageKey,
      ),
    ),
    GoRoute(
      name: RegisterScreen.name,
      path: RegisterScreen.path,
      pageBuilder: (context, state) => CupertinoPage<void>(
        child: const RegisterScreen(),
        key: state.pageKey,
      ),
    ),

    GoRoute(
      name: ForgotPassword.name,
      path: ForgotPassword.path,
      pageBuilder: (context, state) => CupertinoPage<void>(
        child: const ForgotPassword(),
        key: state.pageKey,
      ),
    ),
    GoRoute(
      name: VerificationScreen.name,
      path: VerificationScreen.path,
      pageBuilder: (context, state) => CupertinoPage<void>(
        child: const VerificationScreen(),
        key: state.pageKey,
      ),
    ),
    GoRoute(
      name: EditProfileScreen.name,
      path: EditProfileScreen.path,
      pageBuilder: (context, state) => CupertinoPage<void>(
        child: const EditProfileScreen(),
        key: state.pageKey,
      ),
    ),
    // GoRoute(
    //     name: AgentVerificationScreen.name,
    //     path: AgentVerificationScreen.path,
    //     pageBuilder: (BuildContext context, GoRouterState state) {
    //       if (state.uri.queryParameters.isNotEmpty) {
    //         Map<String, dynamic> args = state.uri.queryParameters;
    //         return CupertinoPage<void>(
    //           child: AgentVerificationScreen(
    //             token: args['token'],
    //           ),
    //           key: state.pageKey,
    //         );
    //       } else {
    //         return const CupertinoPage<void>(
    //           child: AgentVerificationScreen(
    //             token: '',
    //           ),
    //         );
    //       }
    //     }),
    // GoRoute(
    //     name: UserVerificationScreen.name,
    //     path: UserVerificationScreen.path,
    //     pageBuilder: (BuildContext context, GoRouterState state) {
    //       if (state.uri.queryParameters.isNotEmpty) {
    //         Map<String, dynamic> args = state.uri.queryParameters;
    //         return CupertinoPage<void>(
    //           child: UserVerificationScreen(
    //             token: args['token'],
    //           ),
    //           key: state.pageKey,
    //         );
    //       } else {
    //         return CupertinoPage<void>(
    //           child: const UserVerificationScreen(
    //             token: '',
    //           ),
    //           key: state.pageKey,
    //         );
    //       }
    //     }),
  ],
);
