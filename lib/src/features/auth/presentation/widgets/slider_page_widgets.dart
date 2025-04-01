import 'package:flutter/material.dart';
import 'package:atraksion_nazorati/src/config/theme/app_colors.dart';

class AppButton extends StatelessWidget {
  String text;

  AppButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: AppColors.buttonColorDark,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Center(child: Text(text,style: const TextStyle(color: Colors.white,fontSize: 16),)),
    );
  }
}
