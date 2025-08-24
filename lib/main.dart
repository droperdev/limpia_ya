import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:limpio_ya/core/injection/injection.dart';
import 'package:limpio_ya/core/theme/app_theme.dart';
import 'package:limpio_ya/core/theme/theme_cubit.dart';
import 'package:limpio_ya/features/auth/presentation/forgot_password_page.dart';
import 'package:limpio_ya/features/auth/presentation/login_page.dart';
import 'package:limpio_ya/features/auth/presentation/register_page.dart';
import 'package:limpio_ya/features/onboarding/onboarding_page.dart';
import 'package:limpio_ya/features/splash/splash_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<ThemeCubit>(),
      child: BlocBuilder<ThemeCubit, ThemeData>(
        builder: (context, state) => MaterialApp(
          title: 'Limpia Ya',
          theme: state,
          routes: {
            '/splash': (context) => const SplashPage(),
            '/onboarding': (context) => const OnboardingPage(),
            '/auth/login': (context) => const LoginPage(),
            '/auth/register': (context) => const RegisterPage(),
            '/auth/forgot-password': (context) => const ForgotPasswordPage(),
          },
          home: SplashPage(),
        ),
      ),
    );
  }
}
