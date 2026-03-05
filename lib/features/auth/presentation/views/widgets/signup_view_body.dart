import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frutes_app/constants.dart';
import 'package:frutes_app/core/helper/show_bar.dart';
import 'package:frutes_app/core/widgets/custom_button.dart';
import 'package:frutes_app/core/widgets/custom_text_form_field.dart';
import 'package:frutes_app/features/auth/presentation/cubits/signup/signup_cubit.dart';
import 'package:frutes_app/features/auth/presentation/views/widgets/have_an_account_widget.dart';
import 'package:frutes_app/features/auth/presentation/views/widgets/terms_and_conditions.dart';
import 'package:gap/gap.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  late bool isTermsAccepted = false;
  final GlobalKey<FormState> formkey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String email, name, password;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizintalPadding),
      child: SingleChildScrollView(
        child: Form(
          key: formkey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              const Gap(24),
              CustomTextFormField(
                suffixIcon: Icons.person,
                hintText: 'الاسم كامل',
                textInputType: TextInputType.name,
                onSaved: (value) {
                  name = value!.trim();
                },
              ),
              const Gap(16),
              CustomTextFormField(
                suffixIcon: Icons.email,
                hintText: 'البريد الالكتروني',
                textInputType: TextInputType.emailAddress,
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
              TermsAndConditionsWidget(
                onChanged: (value) {
                  isTermsAccepted = value;
                },
              ),
              const Gap(30),
              CustomButton(
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  if (formkey.currentState!.validate()) {
                    formkey.currentState!.save();
                    if (isTermsAccepted) {
                      context
                          .read<SignupCubit>()
                          .createUserWithEmailAndPassword(
                            email: email,
                            password: password,
                            name: name,
                          );
                      log(email);
                      log(password);
                    } else {
                      showBar(context, 'يجب عليك الموافقه على الشروط والاحكام');
                    }
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
                text: 'إنشاء حساب جديد',
              ),
              const Gap(26),
              HaveAnAccountWidgets(),
            ],
          ),
        ),
      ),
    );
  }
}
