import 'package:flutter/material.dart';
import 'package:frutes_app/core/utils/app_text_styles.dart';
import 'package:frutes_app/features/best_selling_fruits/presentation/views/best_selling_view.dart';

class BestSellingHeader extends StatelessWidget {
  const BestSellingHeader({super.key, this.visibleMore = true});
  final bool visibleMore;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          'الأكثر مبيعًا',
          textAlign: TextAlign.right,
          style: TextStyles.bold16,
        ),
        const Spacer(),
        Visibility(
          visible: visibleMore,
          child: GestureDetector(
            onTap: () =>
                Navigator.pushNamed(context, BestSellingView.routeName),
            child: Text(
              'المزيد',
              textAlign: TextAlign.center,
              style: TextStyles.regular13.copyWith(
                color: const Color(0xFF949D9E),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
