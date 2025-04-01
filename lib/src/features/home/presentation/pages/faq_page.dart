import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:atraksion_nazorati/generated/l10n.dart';
import 'package:atraksion_nazorati/src/config/components/app_divider.dart';
import 'package:atraksion_nazorati/src/config/theme/app_colors.dart';
import 'package:atraksion_nazorati/src/core/app_state/cubit/app_cubit.dart';
import 'package:atraksion_nazorati/src/core/util/funs.dart';
import 'package:atraksion_nazorati/src/features/home/data/models/faq_model.dart';
import 'package:atraksion_nazorati/src/features/home/data/models/language_model.dart';
import 'package:atraksion_nazorati/src/features/home/presentation/manager/home_bloc.dart';

class FAQPage extends StatefulWidget {
  const FAQPage({super.key});

  @override
  State<FAQPage> createState() => _FAQPageState();
}

class _FAQPageState extends State<FAQPage> {
  late final bloc = context.read<HomeBloc>();
  int selectedTile = -1;

  @override
  void initState() {
    super.initState();
    bloc.faq();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
  builder: (context, appState) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).faq.replaceFirst('\n', ' '),
        ),
      ),
      body: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration:  BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/${!appState.isDark?'swatch':'swatch_auth'}.png'),
                  fit: BoxFit.cover,),
              ),
              child: state.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                      color: AppColors.mainColor,
                    ))
                  : state.faq?.isNotEmpty==true? ListView.builder(
                  key: Key(selectedTile.toString()),
                padding: const EdgeInsets.all(16),
                itemCount: state.faq?.length,
                itemBuilder: (context, index){
                  return Card(
                    color: Theme.of(context).colorScheme.primary,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    child: ExpansionTile(
                      key: Key(index.toString()),
                      initiallyExpanded: index == selectedTile,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      collapsedShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      collapsedIconColor: Colors.white,
                      iconColor: Colors.white,
                      textColor: Colors.white,
                      onExpansionChanged: ((newState) {
                        if (newState) {
                          setState(() {
                            selectedTile = index;
                          });
                        } else {
                          setState(() {
                            selectedTile = -1;
                          });
                        }
                      }),
                      collapsedTextColor: Colors.white,
                      title: Text(
                        state.faq?[index].question??'',
                        style:  const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      children: <Widget>[
                        const AppDivider(),
                        ListTile(
                          textColor: Colors.white,
                          title: Html(
                            data: state.faq?[index].answer,
                            shrinkWrap: true,
                          ),
                        ),
                      ],
                    ),
                  );
                }
              ):const SizedBox(),
          );
        },
      ),
    );
  },
);
  }

  Widget buildQuestionItem(FaqModel? model,int index) {
    return Card(
      color: Theme.of(context).colorScheme.primary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ExpansionTile(
        key: Key(index.toString()),
        initiallyExpanded: index == selectedTile,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        collapsedShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        collapsedIconColor: Colors.white,
        iconColor: Theme.of(context).colorScheme.tertiary,
        textColor: Colors.white,
        onExpansionChanged: ((newState) {
          if (newState) {
            setState(() {
              selectedTile = index;
            });
          } else {
            setState(() {
              selectedTile = -1;
            });
          }
        }),
        collapsedTextColor: Colors.white,
        title: Text(
          model?.question??'',
          style:  const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        children: <Widget>[
          const AppDivider(),
          ListTile(
            textColor: Colors.white,
            title: Html(
              data: model?.answer,
              shrinkWrap: true,
            ),
          ),
        ],
      ),
    );
  }
}
