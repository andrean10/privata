import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:searchfield/searchfield.dart';

abstract class SearchBars {
  static Widget popup<T>({
    required BuildContext context,
    TextEditingController? controller,
    FocusNode? focusNode,
    String? hintText,
    required List<SearchFieldListItem<T>> suggestions,
    List<SearchFieldListItem<T>>? Function(String)? onSearchTextChanged,
    Function(SearchFieldListItem<T>)? onSuggestionTap,
    required bool state,
    bool isEnable = true,
    bool isLoading = false,
    bool isShowEmpty = false,
    Iterable<Widget>? trailing,
    TextInputAction? textInputAction,
    TextInputType? textInputType,
    final FormFieldValidator<String>? validator,
    bool isReadOnly = false,
    double? maxSuggestionBoxHeight,
  }) {
    final theme = context.theme;
    final textTheme = context.textTheme;
    final height = context.mediaQuerySize.height;

    return SearchField<T>(
      controller: controller,
      focusNode: focusNode,
      hint: hintText,
      suggestions: suggestions,
      maxSuggestionBoxHeight: maxSuggestionBoxHeight ?? height / 3,
      onSearchTextChanged: onSearchTextChanged,
      searchInputDecoration: SearchInputDecoration(
        prefixIcon: const Icon(Icons.search_rounded),
        suffixIcon: (state)
            ? IconButton(
                onPressed: controller?.clear,
                icon: const Icon(Icons.clear_rounded),
              )
            : null,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: theme.colorScheme.outline,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        filled: true,
        fillColor: theme.colorScheme.surface,
      ),
      onSuggestionTap: onSuggestionTap,
      suggestionAction: SuggestionAction.unfocus,
      suggestionsDecoration: SuggestionDecoration(
        color: theme.colorScheme.surfaceContainerLow,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
      ),
      emptyWidget: (state)
          ? Container(
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
                          'Tidak ada data',
                          style: textTheme.titleMedium,
                        ),
                ),
              ),
            )
          : const SizedBox.shrink(),
      dynamicHeight: true,
      scrollbarDecoration: ScrollbarDecoration(
        radius: const Radius.circular(12),
        thumbColor: theme.colorScheme.secondaryContainer,
      ),
      enabled: isEnable,
      inputType: textInputType,
      validator: validator,
      readOnly: isReadOnly,
      textInputAction: textInputAction ?? TextInputAction.search,
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
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      textInputAction: textInputAction ?? TextInputAction.search,
      keyboardType: textInputType,
    );
  }
}
