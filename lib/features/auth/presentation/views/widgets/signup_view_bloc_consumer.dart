import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frutes_app/core/helper/show_bar.dart';
import 'package:frutes_app/features/auth/presentation/cubits/signup/signup_cubit.dart';
import 'package:frutes_app/features/auth/presentation/views/widgets/signup_view_body.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignupViewBlocConsumer extends StatelessWidget {
  const SignupViewBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupSucces) {
          debugPrint('Success');
          Navigator.pop(context);
        }
        if (state is SignupFailure) {
          showBar(context, state.message);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          color: Colors.transparent,
          progressIndicator: CupertinoActivityIndicator(
            color: Theme.of(context).primaryColor,
          ),
          inAsyncCall: state is SignupLoading ? true : false,
          child: SignupViewBody(),
        );
      },
    );
  }
}
