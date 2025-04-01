import 'dart:convert';

import 'package:atraksion_nazorati/src/features/main/tabs/home/widgets/home_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:atraksion_nazorati/generated/l10n.dart';
import 'package:atraksion_nazorati/src/config/theme/app_colors.dart';
import 'package:atraksion_nazorati/src/core/app_state/cubit/app_cubit.dart';
import 'package:atraksion_nazorati/src/core/router/app_routes.dart';
import 'package:atraksion_nazorati/src/core/util/funs.dart';
import 'package:atraksion_nazorati/src/features/home/data/models/language_model.dart';
import 'package:atraksion_nazorati/src/features/home/presentation/manager/home_bloc.dart';
import 'package:atraksion_nazorati/src/features/main/tabs/home/widgets/home_card1_widget.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  late final bloc = context.read<HomeBloc>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, appState) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              S.of(context).about_ombudsman.replaceFirst('\n', ' '),
            ),
          ),
          body: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              return Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/images/${!appState.isDark ? 'swatch' : 'swatch_auth'}.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Column(
                      children: [
                        HomeCard1Widget(
                                title: S.of(context).about,
                                content: S.of(context).about_ombudsman_details,
                                onClick: () {
                                  context
                                      .pushNamed(AppRoutes.aboutOmbudsman.name);
                                })
                            .animate()
                            .move()
                            .fade()
                            .slideY(begin: 1, end: 0, duration: 300.ms),
                        HomeCard1Widget(
                                title: S.of(context).leadership,
                                content: S.of(context).about_leadership,
                                onClick: () {
                                  context.pushNamed(AppRoutes.leadership.name);
                                })
                            .animate()
                            .move()
                            .fade()
                            .slideY(begin: 1, end: 0, duration: 350.ms),
                        HomeCard1Widget(
                                title: S.of(context).central_membership,
                                content: S.of(context).about_central_membership,
                                onClick: () {
                                  context.pushNamed(
                                      AppRoutes.centralMembership.name);
                                })
                            .animate()
                            .move()
                            .fade()
                            .slideY(begin: 1, end: 0, duration: 400.ms),
                        HomeCard1Widget(
                                title: S.of(context).regional_membership,
                                content: S.of(context).about_regional_membership,
                                onClick: () {
                                  context.pushNamed(
                                      AppRoutes.regionalMembership.name);
                                })
                            .animate()
                            .move()
                            .fade()
                            .slideY(begin: 1, end: 0, duration: 450.ms),
                      ],
                    ),
                  ));
            },
          ),
        );
      },
    );
  }
}
