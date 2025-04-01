import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:atraksion_nazorati/generated/l10n.dart';
import 'package:atraksion_nazorati/src/config/components/app_divider.dart';
import 'package:atraksion_nazorati/src/config/theme/app_colors.dart';
import 'package:atraksion_nazorati/src/core/app_state/cubit/app_cubit.dart';
import 'package:atraksion_nazorati/src/features/reference/data/model/answer_files_model.dart';
import 'package:atraksion_nazorati/src/features/reference/presentation/manager/appeal_bloc.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:toastification/toastification.dart';

class InfoAppealPage extends StatefulWidget {
  final int arg;
  const InfoAppealPage({super.key, required this.arg});

  @override
  State<InfoAppealPage> createState() => _InfoAppealPageState();
}

class _InfoAppealPageState extends State<InfoAppealPage> {
  late final bloc = context.read<AppealBloc>();
  List<AnswerFile>? answerFiles;
  String? type;

  @override
  void initState() {
    super.initState();
    bloc.appealDetails(widget.arg);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
  builder: (context, appState) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).my_appeals,
          style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: BlocConsumer<AppealBloc, AppealState>(
        listener: (context,state){
          if(state.hasError){
            toastification.show(
                title: Text(S.of(context).my_appeals,style: const TextStyle(fontSize: 16),),
                description: Text(state.errorMessage,style: const TextStyle(fontSize: 14),),
                type: ToastificationType.error,
                alignment: Alignment.bottomCenter,
                showProgressBar: false,
                style: ToastificationStyle.fillColored,
                autoCloseDuration: 3.seconds,
            );
          }
        },
        builder: (context, state) {
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/${!appState.isDark?'swatch':'swatch_auth'}.png'),
                  fit: BoxFit.cover),
            ),
            child:state.isLoading
                ? const Center(child: CircularProgressIndicator())
                : Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
              child: DefaultTabController(
                length:3,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: TabBar(
                        indicatorColor: AppColors.mainColor,
                        unselectedLabelStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        labelColor: AppColors.mainColor,
                        labelStyle: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                        tabs:[
                          Tab(text: S.of(context).appeal),
                          Tab(text: S.of(context).info),
                          Tab(text: S.of(context).answer),
                        ]
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        children:
                        [
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 12),
                            padding:
                            const EdgeInsets.symmetric(horizontal: 12),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    S.of(context).regions,
                                    style: const TextStyle(
                                      color: AppColors.secondaryTextColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const SizedBox(height: 4,),
                                  Text(
                                    state.appealDetailsModel?.region?.label??'--',
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    S.of(context).district,
                                    style: const TextStyle(
                                      color: AppColors.secondaryTextColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const SizedBox(height: 4,),
                                  Text(
                                    state.appealDetailsModel?.district?.label??'--',
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    S.of(context).istirohatBogi,
                                    style: const TextStyle(
                                      color: AppColors.secondaryTextColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const SizedBox(height: 4,),
                                  Text(
                                    state.appealDetailsModel?.park?.label??'--',
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    S.of(context).attraksionNomi,
                                    style: const TextStyle(
                                      color: AppColors.secondaryTextColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const SizedBox(height: 4,),
                                  Text(
                                    state.appealDetailsModel?.attraction?.label??'--',
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(height: 4,),
                                  ClipRRect(
                                    borderRadius: const BorderRadius.all(Radius.circular(24)),
                                    child: FadeInImage(
                                      placeholder: const AssetImage('assets/images/img_placeholder.jpg'),
                                      imageErrorBuilder: (context, error, stackTrace) {
                                        return Image.asset('assets/images/img_placeholder.jpg', fit: BoxFit.cover);
                                      },
                                      image: NetworkImage(state.appealDetailsModel?.attraction?.image??''),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    S.of(context).qonunbuzilishTuri,
                                    style: const TextStyle(
                                      color: AppColors.secondaryTextColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: List.generate(state.appealDetailsModel?.offenseTypes?.length??0, (index){
                                      return Chip(label: Text(state.appealDetailsModel?.offenseTypes?[index].label??'--'));
                                    }),
                                  ),
                                  const SizedBox(height: 12,),
                                  Text(
                                    S.of(context).attachment_files,
                                    style: const TextStyle(
                                        color:
                                        AppColors.secondaryTextColor,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  const SizedBox(height: 4),
                                  state.appealDetailsModel?.docs!=null?
                                  MediaQuery.removePadding(
                                    context: context,
                                    removeBottom: true,
                                    child: ListView.builder(
                                        physics: const ClampingScrollPhysics(),
                                        scrollDirection: Axis.vertical,
                                        shrinkWrap: true,
                                        itemCount: state.appealDetailsModel?.docs?.length,
                                        itemBuilder: (context, index) {
                                          return GestureDetector(
                                            onTap: () {
                                              snackBar(S.of(context).file_loading);
                                              openFile1(url: state.appealDetailsModel?.docs?[index].src?.replaceFirst('http', 'https')??'');
                                            },
                                            child: Card(
                                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      height: 42,
                                                      width: 42,
                                                      padding: const EdgeInsets.all(12),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                        BorderRadius.circular(21),
                                                        color: AppColors.mainColor,
                                                      ),
                                                      child: SvgPicture.asset(
                                                        'assets/icons/ic_folder.svg',
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                    const SizedBox(width: 10,),
                                                    Expanded(
                                                      child: Column(
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                        mainAxisAlignment:
                                                        MainAxisAlignment.spaceEvenly,
                                                        mainAxisSize: MainAxisSize.min,
                                                        children: [
                                                          Text(
                                                            state.appealDetailsModel?.docs?[index].src?.split('/').last??'--',
                                                            style: const TextStyle(
                                                              fontSize: 14,
                                                              fontWeight: FontWeight.w600,
                                                            ),
                                                            overflow: TextOverflow.ellipsis,
                                                            maxLines: 1,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        }),
                                  ):const SizedBox(),
                                  state.appealDetailsModel?.images!=null?
                                  MediaQuery.removePadding(
                                    context: context,
                                    removeBottom: true,
                                    child: GridView.builder(
                                        shrinkWrap: true,
                                        physics: const ClampingScrollPhysics(),
                                        scrollDirection: Axis.vertical,
                                        itemCount: state.appealDetailsModel?.images?.length,
                                        gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 4),
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return GestureDetector(
                                            onTap: () {
                                              openFile1(url: state.appealDetailsModel?.images?[index].image?.replaceFirst('http', 'https')??'');
                                            },
                                            child: ClipRRect(
                                              borderRadius: const BorderRadius.all(Radius.circular(24)),
                                              child: FadeInImage(
                                                placeholder: const AssetImage('assets/images/img_placeholder.jpg'),
                                                imageErrorBuilder: (context, error, stackTrace) {
                                                  return Image.asset('assets/images/img_placeholder.jpg', fit: BoxFit.cover);
                                                },
                                                image: NetworkImage(state.appealDetailsModel?.images?[index].image??""),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          );
                                        }),
                                  ):const SizedBox(),
                                  const SizedBox(height: 14,),
                                  const AppDivider(),
                                  const SizedBox(height: 14,),
                                  Text(
                                    S.of(context).appeal_text,
                                    style: const TextStyle(
                                      color: AppColors.secondaryTextColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const SizedBox(height: 4,),
                                  Text(
                                    state.appealDetailsModel?.description??'--',
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(height: 12,),
                                ],
                              ),
                            ),
                          ),
                          // info
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    S.of(context).status_appeal,
                                    style: const TextStyle(
                                      color: AppColors.secondaryTextColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const SizedBox(height: 2,),
                                  Container(
                                    padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      color: appealColor(state.appealDetailsModel?.status?.label??0).withOpacity(0.1),
                                    ),
                                    child: Text(
                                      state.appealDetailsModel?.status?.value??'--',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: appealColor(state.appealDetailsModel?.status?.label??0),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 16,),
                                  Text(
                                    S.of(context).qonunbuzilishTuri,
                                    style: const TextStyle(
                                      color: AppColors.secondaryTextColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: List.generate(state.appealDetailsModel?.offenseTypes?.length??0, (index){
                                      return Chip(label: Text(state.appealDetailsModel?.offenseTypes?[index].label??'--'));
                                    }),
                                  ),
                                  const SizedBox(height: 14),
                                  Text(
                                    S.of(context).inspector1,
                                    style: const TextStyle(
                                      color: AppColors.secondaryTextColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    state.appealDetailsModel?.answer?.executive??'--',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(height: 14),
                                  Text(
                                    S.of(context).inspector2,
                                    style: const TextStyle(
                                      color: AppColors.secondaryTextColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    state.appealDetailsModel?.answer?.responsibleDepartment??'--',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(height: 14),
                                  Text(
                                    S.of(context).create_appeal_date,
                                    style: const TextStyle(
                                      color: AppColors.secondaryTextColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const SizedBox(height: 4,),
                                  state.appealDetailsModel?.createdAt!=null?
                                  Text(
                                    DateFormat("yyyy-MM-dd hh:mm:ss").format(DateTime.parse(state.appealDetailsModel?.createdAt??'--')),
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ):const SizedBox(),
                                  const SizedBox(height: 14,),
                                  Text(
                                    S.of(context).process_appeal_date,
                                    style: const TextStyle(
                                      color: AppColors.secondaryTextColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const SizedBox(height: 4,),
                                  Text(
                                    state.appealDetailsModel?.proccessDate??'--',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // response
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 12,),
                                  Text(
                                    S.of(context).answer,
                                    style: const TextStyle(
                                      color: AppColors.secondaryTextColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const SizedBox(height: 4,),
                                  Text(
                                    state.appealDetailsModel?.answer?.answer??'--',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(height: 14,),
                                  const AppDivider(),
                                  const SizedBox(height: 14,),
                                  Text(
                                    S.of(context).attachment_files,
                                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                                  ),
                                  const SizedBox(height: 4,),
                                  MediaQuery.removePadding(
                                    context: context,
                                    removeBottom: true,
                                    child: ListView.builder(
                                        physics: const ClampingScrollPhysics(),
                                        scrollDirection: Axis.vertical,
                                        shrinkWrap: true,
                                        itemCount: state.appealDetailsModel?.answer?.files?.length,
                                        itemBuilder: (context, index) {
                                          return GestureDetector(
                                            onTap: () {
                                              openFile1(url: state.appealDetailsModel?.answer?.files?[index].src?.replaceFirst('http', 'https')??'');
                                            },
                                            child: Card(
                                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      height: 42,
                                                      width: 42,
                                                      padding: const EdgeInsets.all(12),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                        BorderRadius.circular(21),
                                                        color: AppColors.mainColor,
                                                      ),
                                                      child: SvgPicture.asset(
                                                        'assets/icons/ic_folder.svg',
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                    const SizedBox(width: 10,),
                                                    Expanded(
                                                      child: Column(
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                        mainAxisAlignment:
                                                        MainAxisAlignment.spaceEvenly,
                                                        mainAxisSize: MainAxisSize.min,
                                                        children: [
                                                          Text(
                                                            state.appealDetailsModel?.answer?.files?[index].src?.split('/').last??'--',
                                                            style: const TextStyle(
                                                              fontSize: 14,
                                                              fontWeight: FontWeight.w600,
                                                            ),
                                                            overflow: TextOverflow.ellipsis,
                                                            maxLines: 1,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        }),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ]
                      ),
                    )
                  ],
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

  snackBar(String? message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message!),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  Future<File?> downloadFile1(String url) async {
    final iosStorage = await getApplicationDocumentsDirectory();
    final androidStorage = await getDownloadsDirectory();
    final file = Platform.isIOS?File('${iosStorage.path}/${url.split('/').last}'):File('${androidStorage?.path}/${url.split('/').last}');
    final response = await Dio().get(url,
        options: Options(
            responseType: ResponseType.bytes,
            followRedirects: false,
        ));
    debugPrint("response status message ${response.statusCode}");
    final raf = file.openSync(mode: FileMode.write);
    raf.writeFromSync(response.data);
    await raf.close();
    return file;
  }

  Future openFile1({required String url}) async {
    debugPrint('Url: $url');
    final file = await downloadFile1(url);
    if (file == null) return;
    debugPrint('Path: ${file.path}');
    OpenFile.open(file.path);
  }
}
