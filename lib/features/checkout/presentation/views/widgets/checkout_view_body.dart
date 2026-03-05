import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:frutes_app/core/helper/show_bar.dart';
import 'package:frutes_app/core/utils/app_keys.dart';
import 'package:frutes_app/core/widgets/custom_button.dart';
import 'package:frutes_app/features/checkout/domain/entites/order_entity.dart';
import 'package:frutes_app/features/checkout/domain/entites/paypal_payment_entity/paypal_payment_entity.dart';
import 'package:frutes_app/features/checkout/presentation/manger/add_order_cubit/add_order_cubit.dart';
import 'package:frutes_app/features/checkout/presentation/views/widgets/checkout_steps.dart';
import 'package:frutes_app/features/checkout/presentation/views/widgets/checkout_steps_page_view.dart';
import 'package:gap/gap.dart';

class CheckoutViewBody extends StatefulWidget {
  const CheckoutViewBody({super.key});

  @override
  State<CheckoutViewBody> createState() => _CheckoutViewBodyState();
}

class _CheckoutViewBodyState extends State<CheckoutViewBody> {
  late PageController pageController;
  ValueNotifier<AutovalidateMode> valueNotifier = ValueNotifier(
    AutovalidateMode.disabled,
  );
  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        currentPageIndex = pageController.page!.toInt();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    valueNotifier.dispose();
    super.dispose();
  }

  int currentPageIndex = 0;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Gap(20),
          CheckoutSteps(
            currentPageIndex: currentPageIndex,
            pageController: pageController,
          ),
          Expanded(
            child: CheckoutStepsPageView(
              pageController: pageController,
              formKey: _formKey,
              valueListenable: valueNotifier,
            ),
          ),
          CustomButton(
            onPressed: () {
              if (currentPageIndex == 0) {
                _handleShippingSectionValidation(context);
              } else if (currentPageIndex == 1) {
                _handleAddressValidation();
              } else {
                // var order=context.read<OrderEntity>();
                // context.read<AddOrderCubit>().addOrder(order: order);
                _proccessPayment(context);
              }
            },
            text: getNextButtonText(currentPageIndex),
          ),

          Gap(30),
        ],
      ),
    );
  }

  String getNextButtonText(int currentPageIndex) {
    switch (currentPageIndex) {
      case 0:
        return 'التالى';
      case 1:
        return 'التالى';
      case 2:
        return 'الدفع عن طريق PayPal';
      default:
        return 'التالى';
    }
  }

  void _handleShippingSectionValidation(BuildContext context) {
    if (context.read<OrderEntity>().payWithCash != null) {
      pageController.animateToPage(
        currentPageIndex + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.bounceIn,
      );
    } else {
      showBar(context, 'يرجي تحديد طريقه الدفع');
    }
  }

  void _handleAddressValidation() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      pageController.animateToPage(
        currentPageIndex + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.bounceIn,
      );
    } else {
      valueNotifier.value = AutovalidateMode.always;
    }
  }

  void _proccessPayment(BuildContext context) {
    var orderEntity = context.read<OrderEntity>();
    PaypalPaymentEntity paypalPaymentEntity = PaypalPaymentEntity.fromEntity(
      orderEntity,
    );
    log(paypalPaymentEntity.toJson().toString());
    var addOrderCubit = context.read<AddOrderCubit>();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => PaypalCheckoutView(
          sandboxMode: true,
          clientId: kpaypalClientId,
          secretKey: kpaypalSecretKey,
          transactions: [paypalPaymentEntity.toJson()],

          note: "Contact us for any questions on your order.",
          onSuccess: (Map params) async {
            log("onSuccess: $params");
            addOrderCubit.addOrder(order: orderEntity);
            Navigator.pop(context);
            showBar(context, 'تمت عمليه الدفع بنجاح');
          },
          onError: (error) {
            log("onError: $error");
            Navigator.pop(context);
            showBar(context, 'حدث خطأ اثناء عمليه الدفع');
          },
          onCancel: () {
            log('cancelled:');
            Navigator.pop(context);
            showBar(context, 'تم الغاء عمليه الدفع');
          },
        ),
      ),
    );
  }
}
