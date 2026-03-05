import 'package:flutter/material.dart';
import 'package:frutes_app/core/utils/app_text_styles.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(thickness: 2, color: Color(0xffDDDFDF))),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Text('او', style: TextStyles.semiBold16),
        ),
        Expanded(child: Divider(thickness: 2, color: Color(0xffDDDFDF))),
      ],
    );
  }
}
