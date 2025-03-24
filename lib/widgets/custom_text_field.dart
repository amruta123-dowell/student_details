import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final TextEditingController? textController;
  final String? name;
  final Function(String)? onChanged;
  final Widget? suffixIcon;
  final String? hintText;
  final bool? readOnly;
  final BorderRadius? borderRadius;
  final Color? fillColor;
  final int? maxLines;
  final bool? enableVisibleIcon;
  final String? obsecureString;
  final Color? borderColor;
  final EdgeInsetsGeometry? contentPadding;
  bool? obscureText;
  final Widget? prefixIcon;
  CustomTextFieldWidget(
      {super.key,
      this.textController,
      required this.onChanged,
      this.suffixIcon,
      this.hintText,
      this.readOnly = false,
      this.prefixIcon,
      this.borderRadius,
      this.fillColor,
      this.maxLines,
      this.name,
      this.obscureText,
      this.enableVisibleIcon,
      this.obsecureString,
      this.borderColor,
      this.contentPadding});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      obscuringCharacter: obsecureString ?? '•',
      style: const TextStyle(
        color: Colors.black,
        fontSize: 12,
      ),
      autofocus: false,
      obscureText: obscureText ?? false,
      maxLines: maxLines ?? 1,
      readOnly: readOnly ?? false,
      controller: textController,
      decoration: InputDecoration(
        isDense: true,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        suffixIconConstraints:
            const BoxConstraints(minWidth: 12, minHeight: 10),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 12,
        ),
        errorBorder: InputBorder.none,
        fillColor: fillColor,
        filled: true,
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black, width: 1),
            borderRadius: borderRadius ?? BorderRadius.circular(44)),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black, width: 1),
            borderRadius: borderRadius ?? BorderRadius.circular(44)),
        contentPadding: contentPadding ??
            const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      ),
      onChanged: onChanged,
    );
  }
}
