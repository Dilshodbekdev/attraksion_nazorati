
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:atraksion_nazorati/generated/l10n.dart';
import 'package:atraksion_nazorati/src/core/app_state/cubit/app_cubit.dart';
import 'package:atraksion_nazorati/src/features/home/presentation/manager/home_bloc.dart';

class AboutOmbudsmanPage extends StatefulWidget {
  const AboutOmbudsmanPage({super.key});

  @override
  State<AboutOmbudsmanPage> createState() => _AboutOmbudsmanPageState();
}

class _AboutOmbudsmanPageState extends State<AboutOmbudsmanPage> {
  late final bloc = context.read<HomeBloc>();

  @override
  void initState() {
    super.initState();
    bloc.about();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, appState) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              S.of(context).about,
            ),
          ),
          body: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              return Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/${!appState.isDark ? 'swatch' : 'swatch_auth'}.png',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24)),
                  child: state.isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : SingleChildScrollView(
                          padding: const EdgeInsets.all(8),
                          child: Html(data: state.about?.description ?? '')),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
