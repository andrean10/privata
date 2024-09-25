import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDropdownFormField<T> extends StatelessWidget {
  final String title;
  final String? hintText;
  final T? initialSelection;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final double? width;
  final List<DropdownMenuEntry<T>> items;
  final bool isEnabled;
  final bool isEnableFilter;
  final bool isEnableSearch;
  final bool? isShowKeyboard;
  final bool isFilled;
  final bool isLabel;
  final bool isExpanded;
  final bool isDense;
  final MenuStyle? menuStyle;
  final double? menuHeight;
  final Widget? leadingIcon;
  final Widget? trailingIcon;
  final Widget? selectedTrailignIcon;
  final String? errorText;
  final TextStyle? textStyle;
  final ValueChanged<dynamic>? onSelected;
  final int? Function(List<DropdownMenuEntry<dynamic>>, String)? searchCallback;

  const CustomDropdownFormField({
    super.key,
    this.initialSelection,
    this.controller,
    this.focusNode,
    this.width,
    required this.title,
    this.hintText,
    required this.items,
    this.isEnabled = true,
    this.isEnableFilter = false,
    this.isEnableSearch = true,
    this.isShowKeyboard,
    this.isFilled = false,
    this.isLabel = false,
    this.isExpanded = true,
    this.isDense = false,
    this.menuHeight,
    this.menuStyle,
    this.leadingIcon,
    this.trailingIcon,
    this.selectedTrailignIcon,
    this.errorText,
    this.textStyle,
    this.onSelected,
    this.searchCallback,
  });

  @override
  Widget build(BuildContext context) {
    final mediaWidth = context.width;
    final theme = context.theme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != '')
          AutoSizeText(
            title,
            style: theme.textTheme.titleMedium,
          ),
        const SizedBox(height: 8),
        (GetPlatform.isIOS || GetPlatform.isMacOS)
            ? CupertinoTextField(
                controller: controller,
                // focusNode: focusNode,
                placeholder: hintText,
                readOnly: true,
                showCursor: false,
                decoration: BoxDecoration(
                  border: Border.fromBorderSide(
                    BorderSide(
                      width: 1,
                      color: theme.colorScheme.outline,
                    ),
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                suffix: const Icon(Icons.keyboard_arrow_down_rounded),
                onTap: () {
                  showCupertinoModalPopup(
                    context: context,
                    builder: (context) => Container(
                      height: 150,
                      padding: const EdgeInsets.only(top: 4),
                      // margin: EdgeInsets.only(
                      //   bottom: MediaQuery.of(context).viewInsets.bottom,
                      // ),
                      color:
                          CupertinoColors.systemBackground.resolveFrom(context),
                      child: SafeArea(
                        top: false,
                        child: CupertinoPicker(
                          itemExtent: 32,
                          onSelectedItemChanged: (value) {
                            controller?.text = items[value].label;
                          },
                          children: items
                              .map(
                                (e) => Text(e.label),
                              )
                              .toList(),
                        ),
                      ),
                    ),
                  );
                },
              )
            : DropdownMenu<T>(
                initialSelection: initialSelection,
                controller: controller,
                focusNode: focusNode,
                width: width ?? mediaWidth / 1.1,
                hintText: hintText ?? 'Pilih Item',
                dropdownMenuEntries: items,
                enabled: isEnabled,
                enableSearch: isEnableSearch,
                requestFocusOnTap: isShowKeyboard,
                enableFilter: isEnableFilter,
                expandedInsets: isExpanded ? EdgeInsets.zero : null,
                menuHeight: menuHeight,
                leadingIcon: leadingIcon,
                trailingIcon: trailingIcon ??
                    const Icon(Icons.keyboard_arrow_down_rounded),
                selectedTrailingIcon: selectedTrailignIcon ??
                    const Icon(Icons.keyboard_arrow_up_rounded),
                errorText: errorText,
                textStyle: textStyle,
                label: (!isLabel) ? Text(title) : null,
                inputDecorationTheme: InputDecorationTheme(
                  isDense: isDense,
                  errorMaxLines: 2,
                  border: (!isFilled)
                      ? OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                            color: theme.colorScheme.outline,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        )
                      : null,
                  filled: isFilled,
                ),
                onSelected: onSelected,
                searchCallback: searchCallback,
              )
      ],
    );
  }
}
