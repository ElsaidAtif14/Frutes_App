import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frutes_app/constants.dart';
import 'package:frutes_app/core/services/firebase_auth_services.dart';
import 'package:frutes_app/core/services/shared_preferences_singleton.dart';
import 'package:frutes_app/core/utils/app_images.dart';
import 'package:frutes_app/features/auth/presentation/views/signin_view.dart';
import 'package:frutes_app/features/home/presentation/views/main_view.dart';
import 'package:frutes_app/features/onboarding/presentation/views/on_boarding_view.dart';

class SplachViewBody extends StatefulWidget {
  const SplachViewBody({super.key});

  @override
  State<SplachViewBody> createState() => _SplachViewBodyState();
}

class _SplachViewBodyState extends State<SplachViewBody> {
  @override
  void initState() {
    super.initState();
    exeuceteNavigtion();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [SvgPicture.asset(Assets.assetsImagesPlant)],
        ),
        SvgPicture.asset(Assets.assetsImagesLogo),
        SvgPicture.asset(Assets.assetsImagesSplashBottom, fit: BoxFit.fill),
      ],
    );
  }

  void exeuceteNavigtion() {
    bool isOnBoardingViewSeen = Prefs.getBool(kIsOnBoardingViewSeen);

    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;

      if (isOnBoardingViewSeen) {
        var isLoggedin = FirebaseAuthServices().isUserLoggedIn();
        if (isLoggedin) {
          Navigator.pushReplacementNamed(context, MainView.routeName);
        } else {
          Navigator.pushReplacementNamed(context, SigninView.routeName);
        }
      } else {
        Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
      }
    });
  }
}
