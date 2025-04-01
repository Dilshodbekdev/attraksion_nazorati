import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:go_router/go_router.dart';
import 'package:atraksion_nazorati/generated/l10n.dart';
import 'package:atraksion_nazorati/src/config/components/app_divider.dart';
import 'package:atraksion_nazorati/src/config/components/app_elevated_button.dart';
import 'package:atraksion_nazorati/src/core/app_state/cubit/app_cubit.dart';
import 'package:atraksion_nazorati/src/core/router/app_routes.dart';
import 'package:atraksion_nazorati/src/core/util/funs.dart';
import 'package:atraksion_nazorati/src/features/home/data/models/language_model.dart';
import 'package:atraksion_nazorati/src/features/reference/presentation/manager/appeal_bloc.dart';

class RequirementsPage extends StatefulWidget {
  const RequirementsPage({super.key});

  @override
  State<RequirementsPage> createState() => _RequirementsPageState();
}

class _RequirementsPageState extends State<RequirementsPage> {
  late final bloc = context.read<AppealBloc>();

  bool checkboxValue = false;

  @override
  void initState() {
    super.initState();
    bloc.requirments();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
  builder: (context, appState) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).network_library.replaceFirst('\n', ' '),
        ),
      ),
      body: BlocBuilder<AppealBloc, AppealState>(
  builder: (context, state) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/${!appState.isDark?'swatch':'swatch_auth'}.png'),
              fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            Expanded(
              child: state.requirments!=null? Card(
                color: Theme.of(context).colorScheme.primary,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: state.requirments?.isNotEmpty==true? SingleChildScrollView(child: Html(
                          data: getLang(LanguageModel.fromJson(jsonDecode(state.requirments?[0].description??'')), appState.lang),)):const SizedBox(),
                      ),
                    const SizedBox(height: 16,),
                    const AppDivider(),
                    CheckboxListTile(
                      title: Text(S.of(context).met,style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                      dense: true,
                        value: checkboxValue,
                        onChanged: (val){
                        setState(() {
                          checkboxValue=val!;
                        });
                    }),
                    ],
                  ),
                ),
              ):const Center(child: CircularProgressIndicator()),
            ),
            const SizedBox(height: 16,),
            AppElevatedButton(text: S.of(context).next, onClick: checkboxValue? (){
              context.pushNamed(AppRoutes.createAppeal.name);
            }:null),
            const SizedBox(height: 16,),
          ],
        ),
      );
  },
)
    );
  },
);
  }

}