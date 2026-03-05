import 'package:flutter/material.dart';
import 'package:frutes_app/features/splach/presentation/views/widgets/splach_view_body.dart';

class SplachView extends StatelessWidget {
  const SplachView({super.key});
  static const routeName = '/splach';
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: const SplachViewBody());
  }
}
