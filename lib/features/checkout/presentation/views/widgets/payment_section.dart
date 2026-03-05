import 'package:flutter/material.dart';
import 'package:frutes_app/features/checkout/presentation/views/widgets/order_summry_widget.dart';
import 'package:frutes_app/features/checkout/presentation/views/widgets/shipping_address_widget.dart';
import 'package:gap/gap.dart';

class PaymentSection extends StatelessWidget {
  const PaymentSection({super.key, required this.pageController});
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gap(24),
        OrderSummryWidget(),
        Gap(16),
        ShippingAddressWidget(pageController: pageController),
      ],
    );
  }
}
