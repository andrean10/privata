import 'package:auto_size_text/auto_size_text.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum TypeDropDown {
  menu,
  dialog,
  modal,
  bottomSheet,
}

class CustomDropdownTypeFormField<T> extends StatelessWidget {
  final String title;
  final String? hintText;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final BoxConstraints? constraints;
  final List<T>? items;
  final Future<List<T>> Function(String)? asyncItems;
  final String Function(T)? itemAsString;
  final T? selectedItem;
  final Function(T?)? onChanged;
  final bool Function(T, String)? filterFn;
  final bool Function(T)? disabledItemFn;
  final Widget? suffix;
  final bool isShowSearchBox;
  final bool isShowTitleBottomsheet;
  final bool isFilterOnline;
  final Widget Function(BuildContext, T, bool)? itemBuilder;
  final Widget Function(BuildContext, String)? loadingBuilder;
  final Widget Function(BuildContext, String)? emptyBuilder;
  final Widget Function(BuildContext, String, dynamic)? errorBuilder;
  final FormFieldValidator<T>? validator;
  final bool isEnabled;
  // final bool isEnableFilter;
  // final bool isEnableSearch;
  // final bool? isShowKeyboard;
  // final bool isFilled;
  // final bool isLabel;
  // final bool isExpanded;
  // final bool isDense;
  // final MenuStyle? menuStyle;
  // final double? menuHeight;
  // final Widget? leadingIcon;
  // final Widget? trailingIcon;
  // final Widget? selectedTrailignIcon;
  // final String? errorText;
  // final TextStyle? textStyle;
  // final ValueChanged<dynamic>? onSelected;
  // final int? Function(List<DropdownMenuEntry<dynamic>>, String)? searchCallback;
  final TypeDropDown? type;

  const CustomDropdownTypeFormField({
    super.key,
    this.controller,
    this.focusNode,
    required this.title,
    this.hintText,
    this.constraints,
    this.items,
    this.asyncItems,
    this.itemAsString,
    this.selectedItem,
    this.onChanged,
    this.filterFn,
    this.disabledItemFn,
    this.suffix,
    this.isShowSearchBox = false,
    this.isShowTitleBottomsheet = true,
    this.isFilterOnline = false,
    this.itemBuilder,
    this.emptyBuilder,
    this.errorBuilder,
    this.loadingBuilder,
    this.validator,
    this.isEnabled = true,
    // this.isEnableFilter = false,
    // this.isEnableSearch = true,
    // this.isShowKeyboard,
    // this.isFilled = false,
    // this.isLabel = false,
    // this.isExpanded = true,
    // this.isDense = false,
    // this.menuHeight,
    // this.menuStyle,
    // this.leadingIcon,
    // this.trailingIcon,
    // this.selectedTrailignIcon,
    // this.errorText,
    // this.textStyle,
    // this.onSelected,
    // this.searchCallback,
    this.type = TypeDropDown.menu,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (title != '')
          AutoSizeText(
            title,
            style: theme.textTheme.titleMedium,
          ),
        const SizedBox(height: 8),
        DropdownSearch<T>(
          autoValidateMode: AutovalidateMode.onUserInteraction,
          items: items ?? [],
          asyncItems: asyncItems,
          itemAsString: itemAsString,
          selectedItem: selectedItem,
          enabled: isEnabled,
          filterFn: filterFn,
          dropdownButtonProps: DropdownButtonProps(
            focusNode: focusNode,
            icon: const Icon(Icons.keyboard_arrow_down_rounded),
          ),
          onChanged: onChanged,
          dropdownDecoratorProps: DropDownDecoratorProps(
            dropdownSearchDecoration: InputDecoration(
              hintText: hintText,
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: theme.colorScheme.outline,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              suffix: suffix,
            ),
          ),
          popupProps: builderPopupProps(theme),
          validator: validator,
        ),
      ],
    );
  }

  PopupProps<T> builderPopupProps(ThemeData theme) {
    final textTheme = theme.textTheme;

    switch (type) {
      //! Kemungkinan udah gak digunakan lagi kedepannya
      case TypeDropDown.menu:
        return PopupProps.menu(
          showSearchBox: isShowSearchBox,
          constraints: constraints ?? const BoxConstraints(maxHeight: 350),
          searchFieldProps: TextFieldProps(
            decoration: InputDecoration(
              hintText: 'Masukkan Pencarian',
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: theme.colorScheme.outline,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        );
      case TypeDropDown.dialog:
        return PopupProps.dialog(
          title: Padding(
            padding: const EdgeInsets.all(16),
            child: AutoSizeText(
              'Pilih $title',
              style: textTheme.titleLarge,
            ),
          ),
          showSearchBox: isShowSearchBox,
          searchFieldProps: TextFieldProps(
            decoration: InputDecoration(
              hintText: 'Masukkan Pencarian',
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: theme.colorScheme.outline,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          showSelectedItems: true,
          isFilterOnline: isFilterOnline,
          itemBuilder: itemBuilder,
          loadingBuilder: loadingBuilder,
          emptyBuilder: emptyBuilder,
          errorBuilder: errorBuilder,
        );
      case TypeDropDown.modal:
        return PopupProps.modalBottomSheet(
          title: Padding(
            padding: const EdgeInsets.all(16),
            child: AutoSizeText(
              'Pilih $title',
              style: textTheme.titleLarge,
            ),
          ),
          showSearchBox: isShowSearchBox,
          modalBottomSheetProps: ModalBottomSheetProps(),
          searchFieldProps: TextFieldProps(
            decoration: InputDecoration(
              hintText: 'Masukkan Pencarian',
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: theme.colorScheme.outline,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          showSelectedItems: true,
          isFilterOnline: isFilterOnline,
          itemBuilder: itemBuilder,
          loadingBuilder: loadingBuilder,
          emptyBuilder: emptyBuilder,
          errorBuilder: errorBuilder,
        );
      case TypeDropDown.bottomSheet:
        return PopupProps.bottomSheet(
          fit: FlexFit.loose,
          title: (isShowTitleBottomsheet)
              ? Padding(
                  padding: const EdgeInsets.all(16),
                  child: AutoSizeText(
                    'Pilih $title',
                    style: textTheme.titleLarge,
                  ),
                )
              : const SizedBox.shrink(),
          showSearchBox: isShowSearchBox,
          searchFieldProps: TextFieldProps(
            decoration: InputDecoration(
              hintText: 'Masukkan Pencarian',
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: theme.colorScheme.outline,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          showSelectedItems: true,
          isFilterOnline: isFilterOnline,
          itemBuilder: itemBuilder,
          loadingBuilder: loadingBuilder,
          emptyBuilder: emptyBuilder,
          errorBuilder: errorBuilder,
        );
      default:
        return PopupProps.menu(
          showSearchBox: isShowSearchBox,
          showSelectedItems: true,
          searchFieldProps: TextFieldProps(
            decoration: InputDecoration(
              hintText: 'Masukkan Pencarian',
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: theme.colorScheme.outline,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        );
    }
  }
}
