import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frutes_app/core/services/get_it_services.dart';
import 'package:frutes_app/core/widgets/build_app_bar.dart';
import 'package:frutes_app/features/auth/domain/repos/auth_repo.dart';
import 'package:frutes_app/features/auth/presentation/cubits/signin/signin_cubit.dart';
import 'package:frutes_app/features/auth/presentation/views/widgets/signin_view_bloc_consumer.dart';

class SigninView extends StatelessWidget {
  const SigninView({super.key});
  static const routeName = 'login';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SigninCubit(getit<AuthRepo>()),
      child: PopScope(
        canPop: false,
        child: Scaffold(
          appBar: buildAppBar(context, title: 'تسجيل الدخول '),
          body: SigninViewBlocConsumer(),
        ),
      ),
    );
  }
}
