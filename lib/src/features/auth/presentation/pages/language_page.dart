import 'package:atraksion_nazorati/src/config/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:atraksion_nazorati/generated/l10n.dart';
import 'package:atraksion_nazorati/src/config/components/app_elevated_button.dart';
import 'package:atraksion_nazorati/src/core/app_state/cubit/app_cubit.dart';
import 'package:atraksion_nazorati/src/core/app_state/localization.dart';
import 'package:atraksion_nazorati/src/core/router/app_routes.dart';
import 'package:atraksion_nazorati/src/features/auth/presentation/widgets/language_button.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({super.key});

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  String language = 'uz';
  late final cubit = context.read<AppCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Scaffold(
            backgroundColor: AppColors.mainColor,
            body: Stack(alignment: Alignment.center, children: [
              Positioned(
                  left: 0,
                  right: 0,
                  top: 0,
                  bottom: 0,
                  child: Image.asset(
                    'assets/images/img_bg.png',
                    fit: BoxFit.cover,
                  )),
              Positioned(
                left: 32,
                right: 32,
                top: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/img_logo.png', height: 120)
                        .animate()
                        .scale(duration: 1.seconds),
                    const SizedBox(
                      height: 26,
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      S.of(context).app_title.toUpperCase(),
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Container(
                  padding: const EdgeInsets.only(
                      left: 16, right: 16, bottom: 32, top: 24),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(36),
                          topLeft: Radius.circular(36))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        textAlign: TextAlign.center,
                        S.of(context).select_language,
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      LanguageButton(
                        icon: 'assets/icons/uz.svg',
                        title: "O'zbek",
                        isCheck: language == 'uz',
                        onClick: () {
                          setState(() {
                            language = 'uz';
                          });
                          cubit.changeLocale(Localization.uz, 'uz');
                        },
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      LanguageButton(
                        icon: 'assets/icons/ru.svg',
                        title: "Русский",
                        isCheck: language == 'ru',
                        onClick: () {
                          setState(() {
                            language = 'ru';
                          });
                          cubit.changeLocale(Localization.ru, 'ru');
                        },
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      AppElevatedButton(
                          text: S.of(context).next,
                          onClick: () {
                            context.goNamed(AppRoutes.slider.name,
                                pathParameters: {'args': '1'});
                          })
                    ],
                  ),
                ),
              )
            ]));
      },
    );
  }
}
