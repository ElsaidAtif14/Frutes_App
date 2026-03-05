import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frutes_app/core/widgets/custom_text_form_field.dart';
import 'package:frutes_app/features/checkout/domain/entites/order_entity.dart';
import 'package:gap/gap.dart';

class AddressInputSection extends StatelessWidget {
  const AddressInputSection({
    super.key,
    required this.formKey,
    required this.valueListenable,
  });
  final GlobalKey<FormState> formKey;
  final ValueListenable<AutovalidateMode> valueListenable;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,

      child: SingleChildScrollView(
        child: ValueListenableBuilder<AutovalidateMode>(
          valueListenable: valueListenable,
          builder: (context, value, child) => Form(
            key: formKey,
            autovalidateMode: value,
            child: Column(
              children: [
                const Gap(24),
                CustomTextFormField(
                  onSaved: (value) {
                    context.read<OrderEntity>().shippingAddressEntity.name =
                        value!;
                  },
                  hintText: 'الاسم كامل',
                  textInputType: TextInputType.text,
                ),
                const Gap(16),
                CustomTextFormField(
                  onSaved: (value) {
                    context.read<OrderEntity>().shippingAddressEntity.email =
                        value!;
                  },
                  hintText: 'البريد الإلكتروني',
                  textInputType: TextInputType.text,
                ),
                const Gap(16),
                CustomTextFormField(
                  onSaved: (value) {
                    context.read<OrderEntity>().shippingAddressEntity.address =
                        value!;
                  },
                  hintText: 'العنوان',
                  textInputType: TextInputType.text,
                ),
                const Gap(16),
                CustomTextFormField(
                  onSaved: (value) {
                    context.read<OrderEntity>().shippingAddressEntity.city =
                        value!;
                  },
                  hintText: 'المدينه',
                  textInputType: TextInputType.text,
                ),
                const Gap(16),
                CustomTextFormField(
                  onSaved: (value) {
                    context.read<OrderEntity>().shippingAddressEntity.floor =
                        value!;
                  },
                  hintText: 'رقم الطابق , رقم الشقه ..',
                  textInputType: TextInputType.text,
                ),
                const Gap(16),
                CustomTextFormField(
                  onSaved: (value) {
                    context.read<OrderEntity>().shippingAddressEntity.phone =
                        value!;
                  },
                  hintText: 'رقم الهاتف',
                  textInputType: TextInputType.number,
                ),
                const Gap(16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
