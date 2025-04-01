import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:atraksion_nazorati/generated/l10n.dart';
import 'package:atraksion_nazorati/src/core/app_state/cubit/app_cubit.dart';
import 'package:atraksion_nazorati/src/core/util/funs.dart';
import 'package:atraksion_nazorati/src/features/home/data/models/language_model.dart';
import 'package:atraksion_nazorati/src/features/home/presentation/manager/home_bloc.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {

  late final bloc = context.read<HomeBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
  builder: (context, appState) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).notification,
        ),
      ),
      body: BlocConsumer<HomeBloc, HomeState>(
  listener: (context, state) {
    if(state.isGetNewMessageVerified){
      bloc.notifications();
    }
  },
  builder: (context, state) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/${!appState.isDark?'swatch':'swatch_auth'}.png'), fit: BoxFit.cover),
        ),
        child: state.notifications!=null&&state.notifications?.isNotEmpty==true? Column(
          children: [
            Expanded(
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child:ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.notifications?.length,
                    itemBuilder: (context, index) {
                      return Card(
                          color: Theme.of(context).colorScheme.primary,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        getLang(LanguageModel.fromJson(jsonDecode(state.notifications?[index].text??'')), appState.lang),
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    IconButton(onPressed: (){
                                      bloc.updateNotify(state.notifications?[index].id??0);
                                    }, icon: const Icon(Icons.clear,color: Colors.red,))
                                  ],
                                ),
                                Text(
                                  state.notifications?[index].description??'',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(height: 12,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                     Text(
                                      state.notifications?[index].createdAt?.split('T').first??'--',
                                      style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        color: textColor(int.parse(state.notifications?[index].status??'')).withOpacity(0.1),
                                      ),
                                      child: Text(
                                        getStatusText(int.parse(state.notifications?[index].status??''), appState.lang),
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: textColor(int.parse(state.notifications?[index].status??'')),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ));
                    })
              ),
            ),
            const SizedBox(height: 12,),
          ],
        ):Center(
          child: Text(
            S.of(context).data_no,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      );
  },
),
    );
  },
);
  }
}
