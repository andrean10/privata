import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String title;
  final String? initialValue;
  final String? hintText;
  final String? helperText;
  final String? errorText;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final String? suffixText;
  final bool? suffixIconState;
  final bool isFilled;
  final TextInputType keyboardType;
  final TextCapitalization textCapitalization;
  final TextInputAction textInputAction;
  final TextStyle? style;
  final bool isReadOnly;
  final bool isAutoCorrect;
  final bool isAutoFocus;
  final bool isEnable;
  final bool obscureText;
  final bool isLabel;
  final TextAlign textAlign;
  final int? maxLines;
  final int? maxLength;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChanged;
  // final VoidCallback? onEditingComplete;
  final Function(String)? onFieldSubmitted;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;

  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.focusNode,
    this.initialValue,
    required this.title,
    this.hintText,
    this.helperText,
    this.errorText,
    this.prefixIcon,
    this.suffixIcon,
    this.suffixText,
    this.suffixIconState,
    required this.isFilled,
    this.keyboardType = TextInputType.text,
    this.textCapitalization = TextCapitalization.words,
    this.textInputAction = TextInputAction.next,
    this.style,
    this.isAutoCorrect = false,
    this.isAutoFocus = false,
    this.isReadOnly = false,
    this.isEnable = true,
    this.obscureText = false,
    this.isLabel = false,
    this.textAlign = TextAlign.start,
    this.maxLines,
    this.maxLength,
    this.onTap,
    this.onChanged,
    // this.onEditingComplete,
    this.onFieldSubmitted,
    this.validator,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    Widget? builderSuffixIcon() {
      if (suffixIcon != null) {
        return suffixIcon;
      } else {
        if (suffixIconState != null) {
          if (suffixIconState!) {
            return IconButton(
              onPressed: () => controller?.clear(),
              icon: const Icon(
                Icons.cancel_outlined,
              ),
            );
          }
        }
      }
      return null;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (title != '' && !isLabel) ...[
          Text(
            title,
            style: theme.textTheme.titleMedium,
            maxLines: 1,
          ),
          const SizedBox(height: 8),
        ],
        (GetPlatform.isIOS || GetPlatform.isMacOS)
            ? CupertinoTextField(
                controller: controller,
                focusNode: focusNode,
                placeholder: hintText,
                decoration: BoxDecoration(
                  border: Border.fromBorderSide(
                    BorderSide(
                      width: 1,
                      color: theme.colorScheme.outline,
                    ),
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                clearButtonMode: OverlayVisibilityMode.editing,
                prefix: (prefixIcon != null) ? Icon(prefixIcon) : null,
                suffix: (suffixText != null)
                    ? Text('$suffixText')
                    : (suffixIcon != null)
                        ? suffixIcon
                        : null,
                keyboardType: keyboardType,
                textCapitalization: textCapitalization,
                textInputAction: textInputAction,
                style: style,
                readOnly: isReadOnly,
                obscureText: obscureText,
                autocorrect: isAutoCorrect,
                autofocus: isAutoFocus,
                maxLines: (keyboardType == TextInputType.multiline)
                    ? null
                    : (obscureText)
                        ? 1
                        : maxLines,
                maxLength: (keyboardType == TextInputType.multiline)
                    ? null
                    : maxLength,
                onChanged: onChanged,
                onTap: onTap,
                onTapOutside: (event) => FocusScope.of(context).unfocus(),
                onEditingComplete: () => FocusScope.of(context).nextFocus(),
                onSubmitted: onFieldSubmitted ??
                    (_) => FocusScope.of(context).nextFocus(),
                // validator: validator,
                // autovalidateMode: AutovalidateMode.onUserInteraction,
                // textAlign: textAlign,
                // buildCounter: (
                //   context, {
                //   required currentLength,
                //   required isFocused,
                //   maxLength,
                // }) =>
                //     null,
                enabled: isEnable,
                inputFormatters: inputFormatters,
              )
            : TextFormField(
                controller: controller,
                focusNode: focusNode,
                initialValue: initialValue,
                decoration: InputDecoration(
                  labelText: (isLabel) ? title : null,
                  hintText: hintText,
                  helperText: helperText,
                  helperMaxLines: 2,
                  errorText: errorText,
                  errorMaxLines: 5,
                  prefixIcon: (prefixIcon != null) ? Icon(prefixIcon) : null,
                  suffixIcon:
                      (suffixIcon != null) ? suffixIcon : builderSuffixIcon(),
                  suffixText: suffixText,
                  filled: isFilled,
                  border: (!isFilled)
                      ? OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                            color: theme.colorScheme.outline,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        )
                      : null,
                ),
                keyboardType: keyboardType,
                textCapitalization: textCapitalization,
                textInputAction: textInputAction,
                style: style,
                readOnly: isReadOnly,
                obscureText: obscureText,
                autocorrect: isAutoCorrect,
                autofocus: isAutoFocus,
                maxLines: (keyboardType == TextInputType.multiline)
                    ? null
                    : (obscureText)
                        ? 1
                        : maxLines,
                maxLength: (keyboardType == TextInputType.multiline)
                    ? null
                    : maxLength,
                onChanged: onChanged,
                onTap: onTap,
                onTapOutside: (event) => FocusScope.of(context).unfocus(),
                // onEditingComplete: () => FocusScope.of(context).nextFocus(),
                onFieldSubmitted: onFieldSubmitted ??
                    (_) => FocusScope.of(context).nextFocus(),
                validator: validator,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                textAlign: textAlign,
                buildCounter: (
                  context, {
                  required currentLength,
                  required isFocused,
                  maxLength,
                }) =>
                    null,
                enabled: isEnable,
                inputFormatters: inputFormatters,
              ),
      ],
    );
  }
}
