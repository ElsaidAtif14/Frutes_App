import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frutes_app/core/widgets/custom_button.dart';
import 'package:frutes_app/features/checkout/domain/entites/order_entity.dart';
import 'package:frutes_app/features/checkout/presentation/manger/add_order_cubit/add_order_cubit.dart';
import 'package:frutes_app/features/checkout/presentation/views/widgets/order_summry_widget.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class OrderSummaryBottomSheet extends StatelessWidget {
  const OrderSummaryBottomSheet({
    super.key,
    required this.orderEntity,
    required this.addOrderCubit,
  });

  final OrderEntity orderEntity;
  final AddOrderCubit addOrderCubit;

  @override
  Widget build(BuildContext context) {
    // تحديد الألوان بناءً على الثيم (استخدام الرمادي الفحمي للدارك مود)
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDarkMode ? const Color(0xFF1A1D1E) : Colors.white;
    final handleColor = isDarkMode ? Colors.grey[700] : const Color(0xFFCACECE);

    return MultiProvider(
      providers: [
        // توفير الـ Entity والـ Cubit للمسار الجديد (الـ Bottom Sheet)
        Provider.value(value: orderEntity),
        BlocProvider.value(value: addOrderCubit),
      ],
      child: BlocListener<AddOrderCubit, AddOrderState>(
        listener: (context, state) {
          if (state is AddOrderSuccess) {
            // قفل الـ Bottom Sheet فقط عند نجاح العملية
            Navigator.pop(context);
          }

          if (state is AddOrderFailure) {
            // إظهار رسالة الخطأ لو حصلت مشكلة في السيرفر
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errMessage),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        child: Container(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            top: 12,
            bottom: MediaQuery.of(context).viewInsets.bottom + 24,
          ),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // الـ Handle (الشرطة اللي فوق لبيان إمكانية السحب)
              Container(
                height: 4,
                width: 45,
                decoration: BoxDecoration(
                  color: handleColor,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const Gap(24),
              const OrderSummryWidget(),
              const Gap(24),
              CustomButton(
                text: 'تأكيد الطلب',
                onPressed: () {
                  addOrderCubit.addOrder(order: orderEntity);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
