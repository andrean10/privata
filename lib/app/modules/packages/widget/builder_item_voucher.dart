import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privata/app/modules/packages/controllers/packages_controller.dart';

import '../../../../shared/shared_theme.dart';
import '../../widgets/buttons/buttons.dart';
import '../../widgets/textformfield/text_form_fields.dart';

class BuilderItemVoucher extends GetView<PackagesController> {
  final TextEditingController ctr;
  final FocusNode node;
  final String title;
  final String hint;
  final String? titleModal;
  final Widget? child;

  const BuilderItemVoucher({
    super.key,
    required this.ctr,
    required this.node,
    required this.title,
    required this.hint,
    this.titleModal,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;

    return TextFormFields.outlined(
      controller: ctr,
      focusNode: node,
      title: title,
      hintText: hint,
      isReadOnly: true,
      suffixIcon: const Icon(Icons.keyboard_arrow_down_rounded),
      onTap: () {
        showModalBottomSheet(
          context: context,
          showDragHandle: true,
          builder: (_) => Container(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  titleModal ?? '',
                  style: textTheme.titleMedium
                      ?.copyWith(fontWeight: SharedTheme.bold),
                ),
                const SizedBox(height: 21),
                Obx(
                  () => TextFormFields.outlined(
                    controller: controller.voucherModalC,
                    title: 'Kode Voucher',
                    hintText: 'Input Kode',
                    suffixIconState: controller.voucherModal.value.isNotEmpty,
                    textInputAction: TextInputAction.done,
                    onFieldSubmitted: (_) => controller.setVoucher(),
                  ),
                ),
                const SizedBox(height: 32),
                Obx(
                  () => Buttons.filled(
                    width: double.infinity,
                    onPressed: controller.voucherModal.value.isNotEmpty
                        ? () => controller.setVoucher()
                        : null,
                    child: const Text('Gunakan Kode'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
