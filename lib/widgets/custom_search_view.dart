import 'package:flutter/material.dart';
import '../core/app_export.dart';
class CustomSearchView extends StatelessWidget {
  CustomSearchView({
    Key? key,
    this.alignment,
    this.width,
    this.controller,
    this.focusNode,
    this.autofocus = true,
    this.textStyle,
    this.textInputType = TextInputType.text,
    this.maxLines,
    this.hintText,
    this.hintStyle,
    this.prefix,
    this.prefixConstraints,
    this.suffix,
    this.suffixConstraints,
    this.contentPadding,
    this.borderDecoration,
    this.fillColor,
    this.filled = true,
    this.validator,
    this.onChanged,
    this.onSearch,  // Add an onSearch callback
  }) : super(key: key);

  final Alignment? alignment;
  final double? width;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool autofocus;
  final TextStyle? textStyle;
  final TextInputType textInputType;
  final int? maxLines;
  final String? hintText;
  final TextStyle? hintStyle;
  final Widget? prefix;
  final BoxConstraints? prefixConstraints;
  final Widget? suffix;
  final BoxConstraints? suffixConstraints;
  final EdgeInsets? contentPadding;
  final InputBorder? borderDecoration;
  final Color? fillColor;
  final bool filled;
  final FormFieldValidator<String>? validator;
  final Function(String)? onChanged;
  final VoidCallback? onSearch;  // Callback for when the search button is pressed

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: searchViewWidget,
          )
        : searchViewWidget;
  }

  Widget get searchViewWidget => SizedBox(
        width: width ?? double.infinity,
        child: TextFormField(
          controller: controller,
          focusNode: focusNode ?? FocusNode(),
          autofocus: autofocus,
          style: textStyle ?? TextStyle(fontSize: 15),
          keyboardType: textInputType,
          maxLines: maxLines ?? 1,
          decoration: decoration,
          validator: validator,
          onChanged: onChanged,
        ),
      );

  InputDecoration get decoration => InputDecoration(
        hintText: hintText ?? "Search",
        hintStyle: hintStyle ?? TextStyle(fontWeight: FontWeight.bold),
        suffixIcon: suffix ?? IconButton(
          icon: Icon(Icons.search),  // Search icon button
          onPressed: onSearch,  // Trigger the provided onSearch callback
        ),
        suffixIconConstraints: suffixConstraints ??
            BoxConstraints(
              maxHeight: 40, maxWidth: 40,
            ),
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(vertical: 11, horizontal: 11),
        fillColor: fillColor ?? Colors.grey[300],
        filled: filled,
        border: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none,
            ),
        enabledBorder: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none,
            ),
        focusedBorder: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(23),
              borderSide: BorderSide(width: 1, color: Colors.blue),
            ),
      );
}
