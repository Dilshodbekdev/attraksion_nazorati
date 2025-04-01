import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:atraksion_nazorati/generated/l10n.dart';
import 'package:atraksion_nazorati/src/config/components/app_divider.dart';
import 'package:atraksion_nazorati/src/config/components/app_elevated_button.dart';
import 'package:atraksion_nazorati/src/config/theme/app_colors.dart';
import 'package:atraksion_nazorati/src/core/app_state/cubit/app_cubit.dart';
import 'package:atraksion_nazorati/src/core/router/app_routes.dart';
import 'package:atraksion_nazorati/src/core/util/funs.dart';
import 'package:atraksion_nazorati/src/features/home/data/body/voting_body.dart';
import 'package:atraksion_nazorati/src/features/home/presentation/manager/home_bloc.dart';
import 'package:atraksion_nazorati/src/features/main/tabs/home/widgets/home_card_widget.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:toastification/toastification.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final bloc = context.read<HomeBloc>();
  String question = "q";
  int answerId = -1;
  int touchedIndex = -1;

  final colorList = <Color>[
    AppColors.progressColor,
    AppColors.mainColor,
    AppColors.secondaryTextColor,
  ];

  @override
  void initState() {
    super.initState();
    bloc.statistic();
    bloc.questionnaire();
    //bloc.notifications();
    bloc.firstArticle();
  }

  snackBar(String? message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message!),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, appState) {
        return Scaffold(
          body: SafeArea(
            child: BlocConsumer<HomeBloc, HomeState>(
              listener: (context, state) {
                if (state.isVoted) {
                  toastification.show(
                      title: Text(
                        S.of(context).successfully_send,
                        style: const TextStyle(fontSize: 16),
                      ),
                      description: Text(
                        S.of(context).voted,
                        style: const TextStyle(fontSize: 14),
                      ),
                      type: ToastificationType.info,
                      alignment: Alignment.bottomCenter,
                      showProgressBar: false,
                      icon: const Icon(Icons.check_circle_outline),
                      style: ToastificationStyle.fillColored,
                      autoCloseDuration: 3.seconds,
                      primaryColor: AppColors.mainColor);
                  bloc.questionnaire();
                }
              },
              builder: (context, state) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            'assets/images/${!appState.isDark ? 'swatch' : 'swatch_auth'}.png'),
                        fit: BoxFit.cover),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                S.of(context).welcome,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              IconButton(
                                  style: ElevatedButton.styleFrom(
                                    elevation: 4,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  onPressed: () {
                                    context.pushNamed(AppRoutes.notification.name);
                                  },
                                  icon: Stack(children: [
                                    Positioned(
                                        right: 2,
                                        child: state.notifications?.isNotEmpty==true? const Badge():const SizedBox(),
                                    ),
                                    SvgPicture.asset('assets/icons/ic_notification.svg')
                                  ],))
                            ],
                          ).animate()
                              .move()
                              .fade()
                              .slideY(begin: 1, end: 0, duration: 200.ms),
                        ),
                        HomeCardWidget(
                                title: S.of(context).about_ombudsman,
                                img: 'assets/images/card_mask_1.png',
                                btnText: S.of(context).detail,
                                bgColor: AppColors.mainColor,
                                btnColor: Colors.white,
                                onClick: () {
                                  context.pushNamed(AppRoutes.info.name);
                                })
                            .animate()
                            .move()
                            .fade()
                            .slideY(begin: 1, end: 0, duration: 220.ms),
                        /*const SizedBox(
                          height: 12,
                        ),
                        HomeCardWidget(
                            title: S.of(context).online_chat,
                            img: 'assets/images/card_mask_2.png',
                            btnText: S.of(context).detail,
                            bgColor: AppColors.mainColor,
                            btnColor: Colors.white,
                            onClick: () {
                              context.pushNamed(AppRoutes.chat.name);
                            })
                            .animate()
                            .move()
                            .fade()
                            .slideY(begin: 1, end: 0, duration: 240.ms),*/
                        const SizedBox(
                          height: 12,
                        ),
                        HomeCardWidget(
                            title: S.of(context).faq,
                            img: 'assets/images/card_mask_3.png',
                            btnText: S.of(context).detail,
                            bgColor: AppColors.mainColor,
                            btnColor: Colors.white,
                            onClick: () {
                              context.pushNamed(AppRoutes.faq.name);
                            })
                            .animate()
                            .move()
                            .fade()
                            .slideY(begin: 1, end: 0, duration: 240.ms),
                        const SizedBox(
                          height: 12,
                        ),
                        HomeCardWidget(
                                title: S.of(context).network_library,
                                img: 'assets/images/card_mask_4.png',
                                btnText: S.of(context).create_appeal1,
                            bgColor: AppColors.mainColor,
                            btnColor: Colors.white,
                                onClick: () {
                                  context
                                      .pushNamed(AppRoutes.createAppeal.name);
                                })
                            .animate()
                            .move()
                            .fade()
                            .slideY(begin: 1, end: 0, duration: 260.ms),
                        const SizedBox(
                          height: 12,
                        ),
                        state.firstArticle != null
                            ? Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24)),
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 16),
                                  width: MediaQuery.of(context).size.width,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        S.of(context).news,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 16,
                                      ),
                                      ClipRRect(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(12)),
                                        child: FadeInImage(
                                          placeholder: const AssetImage(
                                              'assets/images/img_placeholder.jpg'),
                                          imageErrorBuilder:
                                              (context, error, stackTrace) {
                                            return Image.asset(
                                                'assets/images/img_placeholder.jpg',
                                                fit: BoxFit.cover);
                                          },
                                          image: NetworkImage(
                                              state.firstArticle?.photos?.first.image ??
                                                  ''),
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                      const SizedBox(height: 16),
                                      Text(
                                        state.firstArticle?.title ?? '',
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      const SizedBox(height: 16),
                                      Html(data: state.firstArticle?.description??''),
                                      const SizedBox(height: 16),
                                      AppElevatedButton(
                                          text: S.of(context).all_news,
                                          onClick: () {
                                            context.pushNamed(AppRoutes.news.name);
                                          })
                                    ],
                                  ),
                                ),
                              )
                                .animate()
                                .move()
                                .fade()
                                .slideY(begin: 1, end: 0, duration: 280.ms)
                            : const SizedBox(),
                        const SizedBox(
                          height: 12,
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24)),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 16),
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  S.of(context).social_medias,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                const AppDivider(),
                                const SizedBox(
                                  height: 16,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: ElevatedButton.icon(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                AppColors.socialMediaColor),
                                        onPressed: () {
                                          launchInBrowser(Uri.parse(
                                              "https://t.me/scisuz"));
                                        },
                                        label: const Text(
                                          "Telegram",
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        icon: Image.asset(
                                          'assets/images/ic_telegram.png',
                                          height: 24,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Expanded(
                                        child: ElevatedButton.icon(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              AppColors.socialMediaColor),
                                      onPressed: () {
                                        launchInBrowser(Uri.parse(
                                            "https://www.facebook.com/sanoatxavfsizligi1scis"));
                                      },
                                      label: const Text(
                                        "Facebook",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      icon: Image.asset(
                                        'assets/images/ic_facebook.png',
                                        height: 24,
                                      ),
                                    )),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: ElevatedButton.icon(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                AppColors.socialMediaColor),
                                        onPressed: () {
                                          launchInBrowser(Uri.parse(
                                              "https://www.instagram.com/sanoat.xavfsizligi/?hl=ru"));
                                        },
                                        label: const Text("Instagram",
                                            style:
                                                TextStyle(color: Colors.black)),
                                        icon: Image.asset(
                                          'assets/images/ic_instagram.png',
                                          height: 24,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Expanded(child: ElevatedButton.icon(
                                      style: ElevatedButton.styleFrom(backgroundColor: AppColors.socialMediaColor),
                                      onPressed: () {
                                        launchInBrowser(Uri.parse("https://studio.youtube.com/channel/UC-J1PSmW08p1oEvQNLLdlfg/videos/upload?filter=%5B%5D&sort=%7B%22columnType%22%3A%22date%22%2C%22sortOrder%22%3A%22DESCENDING%22%7D"));
                                      },
                                      label: const Text("YouTube",
                                          style: TextStyle(color: Colors.black)),
                                      icon: Image.asset(
                                        'assets/images/ic_youtube.png',
                                        height: 24,
                                      ),
                                    )),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        state.questionnaires != null && state.questionnaires?.isNotEmpty==true
                            ? Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24)),
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 16,
                                            top: 16,
                                            right: 16,
                                            bottom: 8),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              S.of(context).questionnaire,
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16),
                                        child: Divider(
                                          height: 1,
                                          color: AppColors.mainColor
                                              .withOpacity(0.1),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 16, top: 8, right: 16),
                                        child: Text(
                                          state.questionnaires?.first.text??'--',
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      Column(
                                        children: List.generate(
                                            state.questionnaires?.first.options?.length ?? 0, (index) {
                                          return Container(
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 16, vertical: 8),
                                            decoration: BoxDecoration(
                                              color: AppColors.textFieldBgColor
                                                  .withOpacity(0.1),
                                              border: Border.all(
                                                color: AppColors.borderColor,
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            child: RadioListTile<String>(
                                              title: Text(
                                                state.questionnaires?.first.options?[index].text??'--',
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              activeColor: AppColors.mainColor,
                                              value: state.questionnaires?.first.options?[index].text??'--',
                                              groupValue: question,
                                              onChanged: (String? value) {
                                                setState(() {
                                                  question = value ?? "";
                                                  answerId = state.questionnaires?.first.options?[index].id??0;
                                                });
                                              },
                                            ),
                                          );
                                        }),
                                      ),
                                      const SizedBox(
                                        height: 12
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16),
                                        child: AppElevatedButton(
                                            text: S.of(context).voting,
                                            onClick: () {
                                              debugPrint(jsonEncode(
                                                  state.questionnaires));
                                              if (answerId != -1) {
                                                bloc.createQuestionnaire(
                                                    VotingBody(
                                                        id: state.questionnaires?.first.id.toString(),
                                                        optionId: answerId.toString()));
                                              }
                                            }),
                                      ),
                                      const SizedBox(
                                        height: 16,
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            : const SizedBox(),
                        const SizedBox(
                          height: 12,
                        ),
                        if (state.statisticModel != null)
                          Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24)),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    S.of(context).statistic,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  if (state.statisticModel != null)
                                    PieChart(
                                      dataMap: {
                                        S.of(context).new_appeals: state.statisticModel?.appealNew?.toDouble() ?? 0,
                                        S.of(context).process_appeals: state.statisticModel?.appealProccess?.toDouble() ?? 0,
                                        S.of(context).complete_appeals: state.statisticModel?.appealFinished?.toDouble() ?? 0,
                                      },
                                      animationDuration:
                                          const Duration(milliseconds: 800),
                                      chartLegendSpacing: 32,
                                      chartRadius:
                                          MediaQuery.of(context).size.width /
                                              3.2,
                                      colorList: colorList,
                                      initialAngleInDegree: 0,
                                      chartType: ChartType.ring,
                                      ringStrokeWidth: 32,
                                      centerText: state.statisticModel?.appealCount.toString(),
                                      centerTextStyle: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black),
                                      legendOptions: const LegendOptions(
                                          showLegendsInRow: false,
                                          legendPosition: LegendPosition.bottom,
                                          showLegends: true,
                                          legendTextStyle: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                          ),
                                          legendShape: BoxShape.circle),
                                      chartValuesOptions:
                                          const ChartValuesOptions(
                                        showChartValueBackground: true,
                                        showChartValues: true,
                                        showChartValuesInPercentage: true,
                                        showChartValuesOutside: true,
                                      ),
                                      // gradientList: ---To add gradient colors---
                                      // emptyColorGradient: ---Empty Color gradient---
                                    )
                                ],
                              ),
                            ),
                          ),
                        const SizedBox(
                          height: 12,
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24)),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 16),
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  S.of(context).contact,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                const AppDivider(),
                                const SizedBox(
                                  height: 16,
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.location_on,
                                      color: AppColors.secondaryTextColor,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      S.of(context).address,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          color: AppColors.secondaryTextColor),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(S.of(context).address1,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500)),
                                const SizedBox(
                                  height: 16,
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.phone,
                                      color: AppColors.secondaryTextColor,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      S.of(context).phone,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          color: AppColors.secondaryTextColor),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                const Text("+998 (71) 203-02-39",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500)),
                                const SizedBox(
                                  height: 8,
                                ),
                                const Text("+998 (71) 244-23-53",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500)),
                                const SizedBox(
                                  height: 16,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
