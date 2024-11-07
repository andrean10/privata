import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privata/app/helpers/text_helper.dart';
import 'package:searchfield/searchfield.dart';

abstract class SearchBars {
  static Widget popup<T>({
    required BuildContext context,
    AutovalidateMode? validateMode,
    TextEditingController? controller,
    FocusNode? focusNode,
    String? title,
    required String hintText,
    SearchFieldListItem<T>? initialValue,
    required List<SearchFieldListItem<T>> suggestions,
    required Function(SearchFieldListItem<T> item) onSuggestionTap,
    List<SearchFieldListItem<T>>? Function(String filter)? onSearchTextChanged,
    Function()? onTap,
    required bool state,
    bool isRequired = false,
    bool isFilled = false,
    bool isEnable = true,
    bool isLoading = false,
    bool isShowEmpty = false,
    bool isDynamicHeight = false,
    Iterable<Widget>? trailing,
    TextInputAction? textInputAction,
    TextInputType? textInputType,
    final FormFieldValidator<String>? validator,
    bool isReadOnly = false,
    double? maxSuggestionBoxHeight,
    int maxSuggestionsInViewPort = 5,
  }) {
    final theme = context.theme;
    final textTheme = context.textTheme;
    final height = context.mediaQuerySize.height;

    Widget builderTitle = const SizedBox.shrink();

    if (title != null) {
      if (isRequired) {
        builderTitle = Container(
          margin: const EdgeInsets.only(bottom: 8),
          child: TextHelper.buildRichText(
            text: '$title *',
            highlight: '*',
            highlightStyle: textTheme.titleMedium!.copyWith(color: Colors.red),
            defaultStyle: textTheme.titleMedium,
          ),
        );
      } else {
        builderTitle = Container(
          margin: const EdgeInsets.only(bottom: 8),
          child: AutoSizeText(
            title,
            style: textTheme.titleMedium,
          ),
        );
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        builderTitle,
        SearchField<T>(
          autovalidateMode: validateMode,
          autoCorrect: false,
          controller: controller,
          focusNode: focusNode,
          initialValue: initialValue,
          hint: hintText,
          suggestions: suggestions,
          onTap: onTap,
          onTapOutside: (_) => focusNode?.unfocus(),
          onSearchTextChanged: onSearchTextChanged,
          searchInputDecoration: SearchInputDecoration(
            cursorColor: theme.colorScheme.onSurface,
            prefixIcon: const Icon(Icons.search_rounded),
            suffixIcon: (state)
                ? IconButton(
                    onPressed: controller?.clear,
                    icon: const Icon(Icons.clear_rounded),
                  )
                : null,
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
            // fillColor: theme.colorScheme.surface,
          ),
          onSuggestionTap: onSuggestionTap,
          // suggestionState: Suggestion.hidden,
          suggestionAction: SuggestionAction.unfocus,
          maxSuggestionsInViewPort: maxSuggestionsInViewPort,
          suggestionsDecoration: SuggestionDecoration(
            color: theme.colorScheme.surfaceContainerLow,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
          ),
          emptyWidget: Container(
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerLow,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(21),
              child: Center(
                child: (isLoading)
                    ? const CircularProgressIndicator.adaptive()
                    : Text(
                        'Hasil Pencarian Tidak Ditemukan',
                        style: textTheme.titleMedium,
                      ),
              ),
            ),
          ),
          // emptyWidget: (state)
          //     ? Container(
          //         decoration: BoxDecoration(
          //           color: theme.colorScheme.surfaceContainerLow,
          //           borderRadius: const BorderRadius.only(
          //             bottomLeft: Radius.circular(16),
          //             bottomRight: Radius.circular(16),
          //           ),
          //         ),
          //         child: Padding(
          //           padding: const EdgeInsets.all(21),
          //           child: Center(
          //             child: (isLoading)
          //                 ? const CircularProgressIndicator.adaptive()
          //                 : Text(
          //                     'Tidak ada data',
          //                     style: textTheme.titleMedium,
          //                   ),
          //           ),
          //         ),
          //       )
          //     : const SizedBox.shrink(),
          dynamicHeight: isDynamicHeight,
          maxSuggestionBoxHeight: maxSuggestionBoxHeight ?? height / 3,
          // scrollbarDecoration: ScrollbarDecoration(
          //   radius: const Radius.circular(12),
          //   thumbColor: theme.colorScheme.secondaryContainer,
          // ),
          showEmpty: isShowEmpty,
          enabled: isEnable,
          inputType: textInputType,
          validator: validator,
          readOnly: isReadOnly,
          textInputAction: textInputAction ?? TextInputAction.search,
        ),
      ],
    );
  }

  static Widget build<T>({
    required BuildContext context,
    required TextEditingController controller,
    FocusNode? focusNode,
    String? hintText,
    required bool state,
    Iterable<Widget>? trailing,
    TextInputAction? textInputAction,
    TextInputType? textInputType,
  }) {
    return SearchBar(
      controller: controller,
      focusNode: focusNode,
      hintText: hintText,
      elevation: const WidgetStatePropertyAll(0),
      leading: const Icon(Icons.search_rounded),
      trailing: trailing ??
          [
            if (state)
              IconButton(
                onPressed: () => controller.clear(),
                icon: const Icon(Icons.close_rounded),
              ),
          ],
      onTapOutside: (event) => (focusNode != null)
          ? focusNode.unfocus()
          : FocusScope.of(context).unfocus(),
      textInputAction: textInputAction ?? TextInputAction.search,
      keyboardType: textInputType,
    );
  }
}
