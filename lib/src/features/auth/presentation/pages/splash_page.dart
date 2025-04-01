import 'dart:async';

import 'package:atraksion_nazorati/src/config/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:atraksion_nazorati/generated/l10n.dart';
import 'package:atraksion_nazorati/src/core/app_state/cubit/app_cubit.dart';
import 'package:atraksion_nazorati/src/core/router/app_routes.dart';
import 'package:atraksion_nazorati/src/core/services/services.dart';
import 'package:atraksion_nazorati/src/core/util/app_constants.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () async {
      final String token = await Prefs.getString(AppConstants.kAccessToken) ?? "";
      debugPrint(token);
      if (token.isNotEmpty) {
        context.goNamed(AppRoutes.main.name);
      } else {
        context.goNamed(AppRoutes.language.name);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
        body: BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Stack(
          children: [
            Positioned(
                left: 0,
                right: 0,
                top: 0,
                bottom: 0,
                child: Image.asset('assets/images/img_bg.png',fit: BoxFit.cover,)),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //SvgPicture.asset('assets/icons/ic_logo.svg',height: 100,fit: BoxFit.cover,),
                Image.asset(
                  'assets/images/img_logo.png',
                  height: 160,
                  fit: BoxFit.cover,
                ).animate().scale(duration: 1.seconds),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Text(
                    textAlign: TextAlign.center,
                    S.of(context).app_title,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w700,color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Text(
                    textAlign: TextAlign.center,
                    S.of(context).app_desc,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w700,color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    ));
  }
}
