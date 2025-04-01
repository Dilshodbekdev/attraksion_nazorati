import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:atraksion_nazorati/src/config/components/app_divider.dart';
import 'package:atraksion_nazorati/src/config/theme/app_colors.dart';

class HomeCard1Widget extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback onClick;

  const HomeCard1Widget({
    super.key,
    required this.title,
    required this.content,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.mainColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: InkWell(
        child: Ink(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      color: Colors.white
                    ),
                  ),
                ),
                SvgPicture.asset('assets/icons/ic_arrow_right.svg',color: Colors.white,)
              ],
            ),
          ),
        ),
        onTap: () => onClick(),
      ),
    );
  }
}
