import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:atraksion_nazorati/src/config/theme/app_colors.dart';

class LanguageButton extends StatelessWidget {
  final String icon;
  final String title;
  final bool isCheck;
  final VoidCallback onClick;

  const LanguageButton({
    super.key,
    required this.icon,
    required this.title,
    required this.isCheck,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: AppColors.mainColor.withOpacity(0.06),
        borderRadius: BorderRadius.circular(15)
      ),
      child: Center(
        child: ListTile(
          onTap: () => onClick(),
          leading: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: SvgPicture.asset(icon,height: 40,)),
          title: Text(
            title,
            style: const TextStyle(fontSize: 16),
          ),
          trailing: Checkbox(
            checkColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
              value: isCheck,
              onChanged: (v)=>onClick()),
        ),
      ),
    );
  }
}
