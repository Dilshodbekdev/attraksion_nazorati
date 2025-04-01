import 'package:flutter/material.dart';

OutlineInputBorder appReferenceTextFiledBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
    borderSide: const BorderSide(color: Colors.transparent),
  );
}

OutlineInputBorder appReferenceTextFiledErrorBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
    borderSide: const BorderSide(color: Colors.red),
  );
}
