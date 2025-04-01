
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:atraksion_nazorati/generated/l10n.dart';
import 'package:atraksion_nazorati/src/config/theme/app_colors.dart';
import 'package:atraksion_nazorati/src/core/app_state/cubit/app_cubit.dart';
import 'package:atraksion_nazorati/src/core/router/app_routes.dart';
import 'package:atraksion_nazorati/src/features/reference/data/model/appeal_model.dart';
import 'package:atraksion_nazorati/src/features/reference/presentation/manager/appeal_bloc.dart';

class ReferencesPage extends StatefulWidget {
  const ReferencesPage({super.key});

  @override
  State<ReferencesPage> createState() => _ReferencesPageState();
}

class _ReferencesPageState extends State<ReferencesPage> {
  late final bloc = context.read<AppealBloc>();

  List<AppealModel> allTickets = [];
  List<AppealModel> news = [];
  List<AppealModel> processes = [];
  List<AppealModel> completed = [];

  @override
  void initState() {
    super.initState();
    bloc.appealList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AppealBloc, AppealState>(
        listener: (context, state) {
          if (state.isGetMessageVerified) {
            allTickets = state.appealList ?? [];
            news = state.appealList
                    ?.where((element) => element.status?.label == 0)
                    .toList() ??
                [];
            processes = state.appealList
                    ?.where((element) => element.status?.label == 1)
                    .toList() ??
                [];
            completed = state.appealList
                    ?.where((element) => element.status?.label == 2)
                    .toList() ??
                [];
          }
        },
        builder: (context, state) {
          return BlocBuilder<AppCubit, AppState>(
            builder: (context, appState) {
              return SafeArea(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/${!appState.isDark?'swatch':'swatch_auth'}.png'),
                        fit: BoxFit.cover),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              S.of(context).appeals,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            TextButton.icon(
                              onPressed: () {
                                context.pushNamed(AppRoutes.createAppeal.name);
                              },
                              icon: SvgPicture.asset(
                                'assets/icons/ic_create_reference.svg',
                              ),
                              label: Text(
                                S.of(context).new_appeal,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: Theme.of(context).colorScheme.tertiary
                                ),
                              ),
                            ),
                          ],
                        )
                            .animate()
                            .move()
                            .fade()
                            .slideY(begin: 1, end: 0, duration: 50.ms),
                      ),
                      Expanded(
                        child: DefaultTabController(
                          length: 4,
                          child: Column(
                            children: [
                              Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                child: TabBar(
                                  indicatorColor: AppColors.mainColor,
                                  unselectedLabelStyle: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  labelColor: AppColors.mainColor,
                                  isScrollable: true,
                                  labelStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                                  tabAlignment: TabAlignment.start,
                                  tabs: [
                                    Tab(text: S.of(context).all),
                                    Tab(text: S.of(context).new_appeal),
                                    Tab(text: S.of(context).process),
                                    Tab(text: S.of(context).complete),
                                  ],
                                ),
                              )
                                  .animate()
                                  .move()
                                  .fade()
                                  .slideY(begin: 1, end: 0, duration: 100.ms),
                              Expanded(
                                child: TabBarView(
                                  children: [
                                   allTickets.isNotEmpty? MediaQuery.removePadding(
                                      context: context,
                                      removeTop: true,
                                      child: ListView.builder(
                                          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                                          itemCount: allTickets.length,
                                          itemBuilder: (context, index) {
                                            return Card(
                                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                              child: InkWell(
                                                onTap: () {
                                                  context.pushNamed(
                                                      AppRoutes.infoAppeal.name,
                                                      pathParameters: {
                                                        'arg': allTickets[index].id.toString()
                                                      });
                                                },
                                                child: Ink(
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(16.0),
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text(
                                                          allTickets[index].invoiceNumber.toString(),
                                                          style: const TextStyle(
                                                            fontSize: 14,
                                                            fontWeight: FontWeight.w400,
                                                          ),
                                                        ),
                                                        Text(
                                                          allTickets[index].description ?? '--',
                                                          style: const TextStyle(
                                                            fontSize: 14,
                                                            fontWeight: FontWeight.w500,
                                                          ),
                                                        ),
                                                        const SizedBox(height: 8,),
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Container(
                                                              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                                                              decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.circular(6),
                                                                color: appealColor(allTickets[index].status?.label??0).withOpacity(0.1),
                                                              ),
                                                              child: Text(
                                                                allTickets[index].status?.value??'--',
                                                                style: TextStyle(
                                                                  fontSize: 12,
                                                                  color: appealColor(allTickets[index].status?.label??0),
                                                                ),
                                                              ),
                                                            ),
                                                            Text(
                                                              allTickets[index].createdAt ?? '--',
                                                              style: const TextStyle(
                                                                fontSize: 12,
                                                                color: AppColors.secondaryTextColor,
                                                                fontWeight: FontWeight.w400,
                                                              ),
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ).animate().move().fade().slideY(
                                                begin: 1,
                                                end: 0,
                                                duration: 100.ms);
                                          }),
                                    ): Center(
                                     child: Text(S.of(context).data_no,
                                       style: const TextStyle(
                                         fontSize: 16,
                                         fontWeight: FontWeight.w500,
                                       ),
                                     ),
                                   ),
                                    news.isNotEmpty? MediaQuery.removePadding(
                                      context: context,
                                      removeTop: true,
                                      child: ListView.builder(
                                          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                                          itemCount: news.length,
                                          itemBuilder: (context, index) {
                                            return Card(
                                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                              child: InkWell(
                                                onTap: () {
                                                  context.pushNamed(
                                                      AppRoutes.infoAppeal.name,
                                                      pathParameters: {
                                                        'arg': news[index].id.toString()
                                                      });
                                                },
                                                child: Ink(
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(16.0),
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text(
                                                          news[index].invoiceNumber.toString(),
                                                          style: const TextStyle(
                                                            fontSize: 14,
                                                            fontWeight: FontWeight.w400,
                                                          ),
                                                        ),
                                                        Text(
                                                          news[index].description ?? '--',
                                                          style: const TextStyle(
                                                            fontSize: 14,
                                                            fontWeight: FontWeight.w500,
                                                          ),
                                                        ),
                                                        const SizedBox(height: 8,),
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Container(
                                                              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                                                              decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.circular(6),
                                                                color: appealColor(news[index].status?.label??0).withOpacity(0.1),
                                                              ),
                                                              child: Text(
                                                                news[index].status?.value??'--',
                                                                style: TextStyle(
                                                                  fontSize: 12,
                                                                  color: appealColor(news[index].status?.label??0),
                                                                ),
                                                              ),
                                                            ),
                                                            Text(
                                                              news[index].createdAt ?? '--',
                                                              style: const TextStyle(
                                                                fontSize: 12,
                                                                color: AppColors.secondaryTextColor,
                                                                fontWeight: FontWeight.w400,
                                                              ),
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ).animate().move().fade().slideY(
                                                begin: 1,
                                                end: 0,
                                                duration: 100.ms);
                                          }),
                                    ): Center(
                                      child: Text(S.of(context).data_no,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    processes.isNotEmpty? MediaQuery.removePadding(
                                      context: context,
                                      removeTop: true,
                                      child: ListView.builder(
                                          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                                          itemCount: processes.length,
                                          itemBuilder: (context, index) {
                                            return Card(
                                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                              child: InkWell(
                                                onTap: () {
                                                  context.pushNamed(
                                                      AppRoutes.infoAppeal.name,
                                                      pathParameters: {
                                                        'arg': processes[index].id.toString()
                                                      });
                                                },
                                                child: Ink(
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(16.0),
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text(
                                                          processes[index].invoiceNumber.toString(),
                                                          style: const TextStyle(
                                                            fontSize: 14,
                                                            fontWeight: FontWeight.w400,
                                                          ),
                                                        ),
                                                        Text(
                                                          processes[index].description ?? '--',
                                                          style: const TextStyle(
                                                            fontSize: 14,
                                                            fontWeight: FontWeight.w500,
                                                          ),
                                                        ),
                                                        const SizedBox(height: 8,),
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Container(
                                                              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                                                              decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.circular(6),
                                                                color: appealColor(processes[index].status?.label??0).withOpacity(0.1),
                                                              ),
                                                              child: Text(
                                                                processes[index].status?.value??'--',
                                                                style: TextStyle(
                                                                  fontSize: 12,
                                                                  color: appealColor(processes[index].status?.label??0),
                                                                ),
                                                              ),
                                                            ),
                                                            Text(
                                                              processes[index].createdAt ?? '--',
                                                              style: const TextStyle(
                                                                fontSize: 12,
                                                                color: AppColors.secondaryTextColor,
                                                                fontWeight: FontWeight.w400,
                                                              ),
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ).animate().move().fade().slideY(
                                                begin: 1,
                                                end: 0,
                                                duration: 100.ms);
                                          }),
                                    ): Center(
                                      child: Text(S.of(context).data_no,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    completed.isNotEmpty? MediaQuery.removePadding(
                                      context: context,
                                      removeTop: true,
                                      child: ListView.builder(
                                          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                                          itemCount: completed.length,
                                          itemBuilder: (context, index) {
                                            return Card(
                                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                              child: InkWell(
                                                onTap: () {
                                                  context.pushNamed(
                                                      AppRoutes.infoAppeal.name,
                                                      pathParameters: {
                                                        'arg': completed[index].id.toString()
                                                      });
                                                },
                                                child: Ink(
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(16.0),
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text(
                                                          completed[index].invoiceNumber.toString(),
                                                          style: const TextStyle(
                                                            fontSize: 14,
                                                            fontWeight: FontWeight.w400,
                                                          ),
                                                        ),
                                                        Text(
                                                          completed[index].description ?? '--',
                                                          style: const TextStyle(
                                                            fontSize: 14,
                                                            fontWeight: FontWeight.w500,
                                                          ),
                                                        ),
                                                        const SizedBox(height: 8,),
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Container(
                                                              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                                                              decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.circular(6),
                                                                color: appealColor(completed[index].status?.label??0).withOpacity(0.1),
                                                              ),
                                                              child: Text(
                                                                completed[index].status?.value??'--',
                                                                style: TextStyle(
                                                                  fontSize: 12,
                                                                  color: appealColor(completed[index].status?.label??0),
                                                                ),
                                                              ),
                                                            ),
                                                            Text(
                                                              completed[index].createdAt ?? '--',
                                                              style: const TextStyle(
                                                                fontSize: 12,
                                                                color: AppColors.secondaryTextColor,
                                                                fontWeight: FontWeight.w400,
                                                              ),
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ).animate().move().fade().slideY(
                                                begin: 1,
                                                end: 0,
                                                duration: 100.ms);
                                          }),
                                    ): Center(
                                      child: Text(S.of(context).data_no,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Color appealColor(int id){
    Color selectColor;
    if(id==0){
      selectColor=AppColors.sentColor;
    }else if(id==1){
      selectColor=AppColors.progressColor;
    }else{
      selectColor=AppColors.completesColor;
    }
    return selectColor;
  }
}
