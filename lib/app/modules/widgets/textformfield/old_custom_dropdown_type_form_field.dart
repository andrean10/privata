// import 'dart:async';
// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:dropdown_search/dropdown_search.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../../helpers/text_helper.dart';
// import '../buttons/buttons.dart';

// enum TypeDropDown {
//   menu,
//   dialog,
//   modal,
//   bottomSheet,
// }

// class CustomDropdownTypeFormField<T> extends StatelessWidget {
//   final TextEditingController? controller;
//   final FocusNode? focusNode;
//   final BoxConstraints? constraints;
//   final bool isRequired;
//   final Mode mode;
//   final String title;
//   final String? hintText;
//   final String? hintTextSearch;
//   final String? helperText;
//   final String? errorText;
//   final T? selectedItem;
//   final FutureOr<List<T>> Function(String filter, LoadProps? props)? items;
//   // final Future<List<T>> Function(String)? asyncItems;
//   final String Function(T value)? itemAsString;
//   final Function(T? value)? onChanged;
//   final bool Function(T, String)? filterFn;
//   final bool Function(T, T)? compareFn;
//   final bool Function(T)? disabledItemFn;
//   final IconData? prefixIcon;
//   final Widget? suffix;
//   final bool isShowSearchBox;
//   final bool isShowTitleBottomsheet;
//   final bool isFilterOnline;
//   final Widget Function(
//     BuildContext context,
//     T item,
//     bool isDisabled,
//     bool isSelected,
//   )? itemBuilder;
//   final Widget Function(BuildContext, String)? loadingBuilder;
//   final Widget Function(BuildContext, String)? emptyBuilder;
//   final Widget Function(BuildContext context, String, dynamic)? errorBuilder;
//   final FormFieldValidator<T>? validator;
//   final bool isEnabled;
//   final bool isLabel;
//   final bool isFilled;
//   final bool isDense;
//   // final bool isEnableFilter;
//   // final bool isEnableSearch;
//   // final bool? isShowKeyboard;
//   // final bool isFilled;
//   // final bool isLabel;
//   // final bool isExpanded;
//   // final bool isDense;
//   // final MenuStyle? menuStyle;
//   // final double? menuHeight;
//   // final Widget? leadingIcon;
//   // final Widget? trailingIcon;
//   final Widget? selectedTrailingIcon;
//   final TextStyle? textStyle;
//   // final ValueChanged<dynamic>? onSelected;
//   // final int? Function(List<DropdownMenuEntry<dynamic>>, String)? searchCallback;
//   final InfiniteScrollProps? infiniteScrollProps;
//   final Function(List<T> items)? onItemsLoaded;
//   final TypeDropDown? type;

//   const CustomDropdownTypeFormField({
//     super.key,
//     this.controller,
//     this.focusNode,
//     this.constraints,
//     this.isRequired = false,
//     this.mode = Mode.form,
//     required this.title,
//     this.hintText,
//     this.hintTextSearch,
//     this.helperText,
//     this.isLabel = false,
//     this.items,
//     // this.asyncItems,
//     this.itemAsString,
//     this.selectedItem,
//     this.onChanged,
//     this.filterFn,
//     this.compareFn,
//     this.disabledItemFn,
//     this.prefixIcon,
//     this.suffix,
//     this.isShowSearchBox = false,
//     this.isShowTitleBottomsheet = true,
//     this.isFilterOnline = false,
//     this.itemBuilder,
//     this.emptyBuilder,
//     this.errorBuilder,
//     this.loadingBuilder,
//     this.validator,
//     this.isEnabled = true,
//     this.isFilled = false,
//     this.isDense = false,
//     // this.isEnableFilter = false,
//     // this.isEnableSearch = true,
//     // this.isShowKeyboard,
//     // this.isExpanded = true,
//     // this.isDense = false,
//     // this.menuHeight,
//     // this.menuStyle,
//     // this.leadingIcon,
//     // this.trailingIcon,
//     this.selectedTrailingIcon,
//     this.errorText,
//     this.textStyle,
//     // this.onSelected,
//     // this.searchCallback,
//     this.infiniteScrollProps,
//     this.onItemsLoaded,
//     this.type = TypeDropDown.menu,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final theme = context.theme;
//     final textTheme = context.textTheme;

//     Widget builderTitle() {
//       if (title != '' && !isLabel) {
//         return Column(
//           children: [
//             if (isRequired)
//               TextHelper.buildRichText(
//                 text: '$title *',
//                 highlight: '*',
//                 highlightStyle:
//                     textTheme.titleMedium!.copyWith(color: Colors.red),
//                 defaultStyle: textTheme.titleMedium,
//               )
//             else
//               Text(
//                 title,
//                 style: theme.textTheme.titleMedium,
//                 maxLines: 1,
//               ),
//             const SizedBox(height: 8),
//           ],
//         );
//       }

//       return const SizedBox.shrink();
//     }

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         builderTitle(),
//         DropdownSearch<T>(
//           autoValidateMode: AutovalidateMode.onUserInteraction,
//           mode: mode,
//           items: items,
//           // items: items ?? [],
//           // asyncItems: asyncItems,
//           itemAsString: itemAsString,
//           selectedItem: selectedItem,
//           enabled: isEnabled,
//           filterFn: (compareFn == null) ? filterFn : null,
//           compareFn: compareFn ?? (item1, item2) => item1 == item2,
//           onChanged: onChanged,
//           popupProps: builderPopupProps(theme),
//           decoratorProps: DropDownDecoratorProps(
//             baseStyle: textStyle,
//             decoration: InputDecoration(
//               labelText: (isLabel) ? title : null,
//               hintText: hintText,
//               helperText: helperText,
//               helperMaxLines: 2,
//               errorText: errorText,
//               errorMaxLines: 3,
//               prefixIcon: (prefixIcon != null) ? Icon(prefixIcon) : null,
//               border: (!isFilled)
//                   ? OutlineInputBorder(
//                       borderSide: BorderSide(
//                         width: 1,
//                         color: theme.colorScheme.outline,
//                       ),
//                       borderRadius: BorderRadius.circular(12),
//                     )
//                   : null,
//               suffix: suffix,
//               filled: isFilled,
//               isDense: isDense,
//             ),
//           ),
//           suffixProps: DropdownSuffixProps(
//             dropdownButtonProps: DropdownButtonProps(
//               focusNode: focusNode,
//               // isSelected: true,
//               visualDensity: VisualDensity.compact,
//               iconOpened: const Icon(Icons.keyboard_arrow_down_rounded),
//               iconClosed: selectedTrailingIcon ??
//                   const Icon(Icons.keyboard_arrow_up_rounded),
//             ),
//           ),
//           validator: validator,
//         ),
//       ],
//     );
//   }

//   PopupProps<T> builderPopupProps(ThemeData theme) {
//     final textTheme = theme.textTheme;

//     switch (type) {
//       //! Kemungkinan udah gak digunakan lagi kedepannya
//       // case TypeDropDown.menu:
//       //   return PopupProps.menu(
//       //     showSearchBox: isShowSearchBox,
//       //     fit: FlexFit.loose,
//       //     // constraints: constraints ?? const BoxConstraints(maxHeight: 350),
//       //     showSelectedItems: true,
//       //     isFilterOnline: isFilterOnline,
//       //     searchFieldProps: TextFieldProps(
//       //       decoration: InputDecoration(
//       //         hintText: 'Masukkan Pencarian',
//       //         border: OutlineInputBorder(
//       //           borderSide: BorderSide(
//       //             width: 1,
//       //             color: theme.colorScheme.outline,
//       //           ),
//       //           borderRadius: BorderRadius.circular(12),
//       //         ),
//       //       ),
//       //     ),
//       //   );
//       case TypeDropDown.dialog:
//         return PopupProps.dialog(
//           title: Padding(
//             padding: const EdgeInsets.all(16),
//             child: AutoSizeText(
//               'Pilih $title',
//               style: textTheme.titleLarge,
//             ),
//           ),
//           showSearchBox: isShowSearchBox,
//           searchFieldProps: TextFieldProps(
//             decoration: InputDecoration(
//               hintText: 'Masukkan Pencarian',
//               border: OutlineInputBorder(
//                 borderSide: BorderSide(
//                   width: 1,
//                   color: theme.colorScheme.outline,
//                 ),
//                 borderRadius: BorderRadius.circular(12),
//               ),
//             ),
//           ),
//           showSelectedItems: true,
//           disableFilter: isFilterOnline,
//           itemBuilder: itemBuilder,
//           loadingBuilder: loadingBuilder,
//           emptyBuilder: emptyBuilder,
//           errorBuilder: errorBuilder,
//         );
//       case TypeDropDown.modal:
//         return PopupProps.modalBottomSheet(
//           title: Padding(
//             padding: const EdgeInsets.all(16),
//             child: AutoSizeText(
//               'Pilih $title',
//               style: textTheme.titleLarge,
//             ),
//           ),
//           showSearchBox: isShowSearchBox,
//           modalBottomSheetProps: ModalBottomSheetProps(),
//           searchFieldProps: TextFieldProps(
//             decoration: InputDecoration(
//               hintText: 'Masukkan Pencarian',
//               border: OutlineInputBorder(
//                 borderSide: BorderSide(
//                   width: 1,
//                   color: theme.colorScheme.outline,
//                 ),
//                 borderRadius: BorderRadius.circular(12),
//               ),
//             ),
//           ),
//           showSelectedItems: true,
//           disableFilter: isFilterOnline,
//           itemBuilder: itemBuilder,
//           loadingBuilder: loadingBuilder,
//           emptyBuilder: emptyBuilder,
//           errorBuilder: errorBuilder,
//         );
//       case TypeDropDown.bottomSheet:
//         return PopupProps.bottomSheet(
//           fit: FlexFit.loose,
//           title: (isShowTitleBottomsheet)
//               ? Padding(
//                   padding: const EdgeInsets.all(16),
//                   child: AutoSizeText(
//                     'Pilih $title',
//                     style: textTheme.titleLarge,
//                   ),
//                 )
//               : const SizedBox.shrink(),
//           showSearchBox: isShowSearchBox,
//           searchFieldProps: TextFieldProps(
//             decoration: InputDecoration(
//               hintText: 'Masukkan Pencarian',
//               border: OutlineInputBorder(
//                 borderSide: BorderSide(
//                   width: 1,
//                   color: theme.colorScheme.outline,
//                 ),
//                 borderRadius: BorderRadius.circular(12),
//               ),
//             ),
//           ),
//           showSelectedItems: true,
//           disableFilter: isFilterOnline,
//           itemBuilder: itemBuilder,
//           loadingBuilder: loadingBuilder,
//           emptyBuilder: emptyBuilder,
//           errorBuilder: errorBuilder,
//         );
//       default:
//         return PopupProps.menu(
//           suggestedItemProps: SuggestedItemProps(
//             showSuggestedItems: true,
//             suggestedItems: (items) => [items.first],
//           ),
//           fit: FlexFit.loose,
//           constraints: const BoxConstraints(maxHeight: 200),
//           showSearchBox: isShowSearchBox,
//           showSelectedItems: true,
//           disableFilter: isFilterOnline,
//           searchFieldProps: TextFieldProps(
//             decoration: InputDecoration(
//               isDense: isDense,
//               hintText: 'Masukkan Pencarian',
//               border: OutlineInputBorder(
//                 borderSide: BorderSide(
//                   width: 1,
//                   color: theme.colorScheme.outline,
//                 ),
//                 borderRadius: BorderRadius.circular(12),
//               ),
//             ),
//           ),
//           // cacheItems: false,
//           infiniteScrollProps: infiniteScrollProps,
//           onItemsLoaded: onItemsLoaded,
//           itemBuilder: itemBuilder,
//           // loadingBuilder: loadingBuilder ??
//           //     (context, searchEntry) => const Center(
//           //           child: CircularProgressIndicator.adaptive(),
//           //         ),
//           emptyBuilder: emptyBuilder,
//           errorBuilder: errorBuilder ??
//               (context, searchEntry, exception) {
//                 return builderError(context, exception);
//               },
//         );
//     }
//   }

//   Widget builderError(BuildContext context, dynamic exception) {
//     final textTheme = context.textTheme;
//     return Center(
//       child: Column(
//         children: [
//           Text(
//             'Gagal memuat data, coba lagi',
//             style: textTheme.bodyMedium,
//           ),
//           const SizedBox(height: 4),
//           Buttons.filled(
//             onPressed: () {},
//             child: const Text('Coba lagi'),
//           )
//         ],
//       ),
//     );
//   }
// }