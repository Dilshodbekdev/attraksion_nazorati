import 'package:atraksion_nazorati/src/config/theme/app_colors.dart';
import 'package:flutter/material.dart';

OutlineInputBorder appTextFiledBorder() {
  return const OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(16),
    ),
    borderSide: BorderSide(color: AppColors.secondaryTextColor),
  );
}

OutlineInputBorder appTextFiledErrorBorder() {
  return const OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(16),
    ),
    borderSide: BorderSide(color: Colors.red),
  );
}

OutlineInputBorder appTextFiledTransparentBorder() {
  return const OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(16),
    ),
    borderSide: BorderSide(color: Colors.transparent),
  );
}

