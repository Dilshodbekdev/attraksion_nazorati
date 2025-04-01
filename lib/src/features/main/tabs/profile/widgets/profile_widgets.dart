import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:atraksion_nazorati/src/config/components/app_divider.dart';
import 'package:atraksion_nazorati/src/config/theme/app_colors.dart';

class ProfileButtonWidget extends StatelessWidget {
  final String icon;
  final String text;
  final VoidCallback onClick;

  const ProfileButtonWidget({
    super.key,
    required this.icon,
    required this.text,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () => onClick(),
          title: Text(
            text,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          leading: SvgPicture.asset(icon,color: Theme.of(context).colorScheme.tertiary,)
        ),
        const AppDivider()
      ],
    );
  }
}
