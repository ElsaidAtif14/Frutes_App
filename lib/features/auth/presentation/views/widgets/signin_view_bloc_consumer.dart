import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frutes_app/core/helper/show_bar.dart';
import 'package:frutes_app/core/utils/app_colors.dart';
import 'package:frutes_app/features/auth/presentation/cubits/signin/signin_cubit.dart';
import 'package:frutes_app/features/auth/presentation/views/widgets/signin_view_body.dart';
import 'package:frutes_app/features/home/presentation/views/main_view.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SigninViewBlocConsumer extends StatelessWidget {
  const  SigninViewBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SigninCubit, SigninState>(
      listener: (context, state) {
        if (state is SigninSuccess) {
          debugPrint('Success');
          Navigator.pushNamedAndRemoveUntil(
            context,
            MainView.routeName,
            (route) => false,
          );
        }
        if (state is SigninFailure) {
          showBar(context, state.message);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          color: Colors.transparent,
          progressIndicator: CupertinoActivityIndicator(
            color: AppColors.primaryColor,
          ),
          inAsyncCall: state is SigninLoading,
          child: SigninViewBody(),
        );
      },
    );
  }
}
