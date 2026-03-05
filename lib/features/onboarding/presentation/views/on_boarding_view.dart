import 'package:flutter/material.dart';
import 'package:frutes_app/features/onboarding/presentation/views/widgets/on_boarding_view_body.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});
  static const routeName = 'onBoardingView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: const OnBoardingViewBody());
  }
}
