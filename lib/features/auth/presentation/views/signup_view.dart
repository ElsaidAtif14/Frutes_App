import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frutes_app/core/services/get_it_services.dart';
import 'package:frutes_app/core/widgets/build_app_bar.dart';
import 'package:frutes_app/features/auth/domain/repos/auth_repo.dart';
import 'package:frutes_app/features/auth/presentation/cubits/signup/signup_cubit.dart';
import 'package:frutes_app/features/auth/presentation/views/widgets/signup_view_bloc_consumer.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});
  static const routeName = 'signup';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(getit<AuthRepo>()),
      child: Scaffold(
        appBar: buildAppBar(
          context,
          title: 'حساب جديد',
          leadingWedgit: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios),
          ),
        ),
        body: SignupViewBlocConsumer(),
      ),
    );
  }
}
