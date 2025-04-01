import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:atraksion_nazorati/generated/l10n.dart';
import 'package:atraksion_nazorati/src/config/theme/app_colors.dart';
import 'package:atraksion_nazorati/src/core/app_state/cubit/app_cubit.dart';

class AboutAppPage extends StatelessWidget {
  const AboutAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
  builder: (context, state) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            S.of(context).about_app,
          ),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/${!state.isDark?'swatch':'swatch_auth'}.png'),
                fit: BoxFit.cover),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Card(
                  color: Theme.of(context).colorScheme.primary,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24)),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 14),
                        S.of(context).about_app_text1),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  S.of(context).about_target,
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 6),
                Card(
                  color: Theme.of(context).colorScheme.primary,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24)),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 14),
                        S.of(context).about_app_text2),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  S.of(context).about_task,
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 6),
                Card(
                  color: Theme.of(context).colorScheme.primary,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24)),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                        style: const TextStyle(fontSize: 14),
                        S.of(context).about_app_text3),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  S.of(context).about_priority,
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 6),
                Card(
                  color: Theme.of(context).colorScheme.primary,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24)),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                        style: const TextStyle(fontSize: 14),
                        S.of(context).about_app_text4),
                  ),
                ),
              ],
            ),
          ),
        ));
  },
);
  }
}
