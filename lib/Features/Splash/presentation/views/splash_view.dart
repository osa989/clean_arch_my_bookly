import 'package:flutter/material.dart';
import 'package:my_bookly/Features/Splash/presentation/views/widgets/splash_view_body.dart';
import 'package:my_bookly/constants.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kPrimaryColor,
      body: SplashViewBody(),
    );
  }
}