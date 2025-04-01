import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:atraksion_nazorati/generated/l10n.dart';
import 'package:atraksion_nazorati/src/config/theme/app_colors.dart';
import 'package:atraksion_nazorati/src/core/app_state/cubit/app_cubit.dart';

class BiographyPage extends StatelessWidget {
  final String text;
  const BiographyPage({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).biography,
        ),
      ),
      body: BlocBuilder<AppCubit, AppState>(
  builder: (context, state) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(12),
        decoration:  BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/${!state.isDark?'swatch':'swatch_auth'}.png'),
            fit: BoxFit.cover,),
        ),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          child: DefaultTabController(
            length: 3,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Html(
                      data: text,
                      shrinkWrap: false,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
  },
),
    );
  }
}
