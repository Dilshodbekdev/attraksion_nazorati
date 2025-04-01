import 'package:atraksion_nazorati/src/features/home/presentation/widgets/items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:atraksion_nazorati/generated/l10n.dart';
import 'package:atraksion_nazorati/src/config/theme/app_colors.dart';
import 'package:atraksion_nazorati/src/core/app_state/cubit/app_cubit.dart';
import 'package:atraksion_nazorati/src/features/home/presentation/manager/home_bloc.dart';

class LeadershipPage extends StatefulWidget {

  const LeadershipPage({super.key});

  @override
  State<LeadershipPage> createState() => _LeadershipPageState();
}

class _LeadershipPageState extends State<LeadershipPage> {
  late final bloc = context.read<HomeBloc>();

  @override
  void initState() {
    super.initState();
    bloc.leadership();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, appState) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              S.of(context).leadership,
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
                child: state.isLoading
                    ? const Center(
                        child: CircularProgressIndicator(
                        color: AppColors.mainColor,
                      ))
                    : MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        child: ListView.builder(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 12),
                            itemCount: state.leaderships?.length,
                            itemBuilder: (context, index) {
                              return buildLeadershipItem(
                                  context, state.leaderships?[index]);
                            }),
                      ),
              );
            },
          ),
        );
      },
    );
  }
}
