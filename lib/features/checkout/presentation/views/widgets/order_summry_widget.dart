import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frutes_app/core/utils/app_text_styles.dart';
import 'package:frutes_app/features/checkout/domain/entites/order_entity.dart';
import 'package:frutes_app/features/checkout/presentation/views/widgets/payment_item.dart';
import 'package:gap/gap.dart';

class OrderSummryWidget extends StatelessWidget {
  const OrderSummryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PaymentItem(
      title: 'ملخص الطلب',
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'المجموع الفرعي :',
                style: TextStyles.regular13.copyWith(
                ),
              ),
              const Spacer(),
              Text(
                '  ${context.read<OrderEntity>().cartEntity.calculateTotalPrice()} جنية',
                textAlign: TextAlign.right,
                style: TextStyles.semiBold16,
              ),
            ],
          ),
          const Gap(8),
          Row(
            children: [
              Text(
                'التوصيل  :',
                style: TextStyles.regular13.copyWith(
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  '30 جنية',
                  textAlign: TextAlign.right,
                  style: TextStyles.regular13.copyWith(
                   
                  ),
                ),
              ),
            ],
          ),
          const Gap(9),
          const Divider(thickness: .5, color: Color(0xFFCACECE)),
          const Gap(9),
          Row(
            children: [
              const Text('الكلي', style: TextStyles.bold16),
              const Spacer(),
              Text(
                '${(context.read<OrderEntity>().cartEntity.calculateTotalPrice()) + 30} جنية',
                style: TextStyles.bold16,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
