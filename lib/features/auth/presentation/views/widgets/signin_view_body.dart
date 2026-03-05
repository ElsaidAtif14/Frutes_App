import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frutes_app/constants.dart';
import 'package:frutes_app/core/utils/app_colors.dart';
import 'package:frutes_app/core/utils/app_images.dart';
import 'package:frutes_app/core/utils/app_text_styles.dart';
import 'package:frutes_app/core/widgets/custom_button.dart';
import 'package:frutes_app/core/widgets/custom_text_form_field.dart';
import 'package:frutes_app/features/auth/presentation/cubits/signin/signin_cubit.dart';
import 'package:frutes_app/features/auth/presentation/views/widgets/dont_have_an_account_widget.dart';
import 'package:frutes_app/features/auth/presentation/views/widgets/or_divider.dart';
import 'package:frutes_app/features/auth/presentation/views/widgets/social_login_button.dart';
import 'package:gap/gap.dart';

class SigninViewBody extends StatefulWidget {
  const SigninViewBody({super.key});

  @override
  State<SigninViewBody> createState() => _SigninViewBodyState();
}

class _SigninViewBodyState extends State<SigninViewBody> {
  final GlobalKey<FormState> formkey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String email, password;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizintalPadding),
      child: SingleChildScrollView(
        child: Form(
          key: formkey,
          autovalidateMode: autovalidateMode,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Gap(24),
              CustomTextFormField(
                hintText: 'البريد الالكتروني',
                textInputType: TextInputType.emailAddress,
                suffixIcon: Icons.email,
                onSaved: (value) {
                  email = value!.trim();
                },
              ),
              const Gap(16),
              CustomTextFormField(
                hintText: 'كلمة المرور',
                textInputType: TextInputType.visiblePassword,
                obscureText: true,
                onSaved: (value) {
                  password = value!.trim();
                },
              ),
              const Gap(16),
              Text(
                'نسيت كلمة المرور؟',
                style: TextStyles.semiBold13.copyWith(
                  color: AppColors.lightPrimaryColor,
                ),
                textAlign: TextAlign.end,
              ),
              const Gap(33),
              CustomButton(
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  if (formkey.currentState!.validate()) {
                    formkey.currentState!.save();

                    context.read<SigninCubit>().signInWithEmailAndPassword(
                      email: email,
                      password: password,
                    );
                    log(email);
                    log(password);
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
                text: 'تسجيل دخول',
              ),
              const Gap(33),
              const DontHaveAnAccountWidgets(),
              const Gap(33),
              const OrDivider(),
              const Gap(33),
              SocialLoginButton(
                image: Assets.assetsImagesGoogleIcon,
                title: 'تسجيل بواسطة جوجل',
                onPressed: () {
                  context.read<SigninCubit>().signInWithGoogle();
                },
              ),

              Platform.isIOS
                  ? Column(
                      children: [
                        const Gap(16),
                        SocialLoginButton(
                          image: Assets.assetsImagesApplIcon,
                          title: 'تسجيل بواسطة أبل',
                          onPressed: () {
                            context.read<SigninCubit>().signInWithApple();
                          },
                        ),
                      ],
                    )
                  : SizedBox(),
              const Gap(16),
              SocialLoginButton(
                image: Assets.assetsImagesFacebookIcon,
                title: 'تسجيل بواسطة فيسبوك',
                onPressed: () {
                  context.read<SigninCubit>().signInWithFacebook();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
