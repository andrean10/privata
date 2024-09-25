import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privata/app/helpers/text_helper.dart';
import 'package:privata/app/modules/packages/controllers/packages_controller.dart';

import '../../../../shared/shared_theme.dart';
import '../../widgets/textformfield/text_form_fields.dart';

class BuilderItemPackage<T> extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode node;
  final String title;
  final String hint;
  final String? titleModal;
  final List<T> data;
  final T? groupValue;
  final Function(T?)? onChanged;

  const BuilderItemPackage({
    super.key,
    required this.controller,
    required this.node,
    required this.title,
    required this.hint,
    required this.titleModal,
    required this.data,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;

    return TextFormFields.outlined(
      controller: controller,
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
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  titleModal ?? '',
                  style: textTheme.titleMedium
                      ?.copyWith(fontWeight: SharedTheme.bold),
                ),
                const SizedBox(height: 4),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: data.map(
                    (value) {
                      var text = '';

                      if (value is SubscriptionProduct) {
                        text = TextHelper.capitalizeEachWords(value.name) ?? '';
                      } else {
                        text = '$value';
                      }

                      return RadioListTile.adaptive(
                        contentPadding: EdgeInsets.zero,
                        title: Text(text),
                        value: value,
                        groupValue: groupValue,
                        onChanged: onChanged,
                        controlAffinity: ListTileControlAffinity.trailing,
                      );
                    },
                  ).toList(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
