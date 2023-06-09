import 'package:flutter/material.dart';

import '/core/utils/util.dart';
import '/theme/app_fonts.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
    this.onChanged,
    this.onClearSearch,
    this.hintText,
    this.controller,
  }) : super(key: key);
  final String? hintText;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final Function()? onClearSearch;

  @override
  Widget build(BuildContext context) {
    final c = controller ?? TextEditingController();
    return TextField(
      controller: c,
      keyboardType: TextInputType.name,
      textCapitalization: TextCapitalization.words,
      textInputAction: TextInputAction.search,
      onChanged: onChanged,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.search,
          color: context.neutral1100,
        ),
        suffixIcon: InkWell(
          onTap: () {
            c.clear();
            onClearSearch?.call();
          },
          child: Icon(
            Icons.clear,
            color: context.neutral1100,
          ),
        ),
        hintText: hintText,
        labelStyle: AppFonts.pSmall,
        hintStyle:
            AppFonts.pSmall.copyWith(color: context.neutral600, height: 1),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: context.neutral300, width: 2.0),
          borderRadius: borRad08,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: context.neutral300, width: 2.0),
          borderRadius: borRad08,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: context.primaryDark, width: 2.0),
          borderRadius: borRad08,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: context.funcRadicalRed, width: 2.0),
          borderRadius: borRad08,
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: context.funcRadicalRed, width: 2.0),
          borderRadius: borRad08,
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: context.neutral300, width: 2.0),
          borderRadius: borRad08,
        ),
        contentPadding: padSymHor08Ver06,
        helperMaxLines: 1,
        helperStyle: const TextStyle(fontSize: 0),
        errorMaxLines: 1,
        errorStyle: const TextStyle(fontSize: 0),
        counter: const SizedBox(),
      ),
    );
  }
}
