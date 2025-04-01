import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:atraksion_nazorati/src/features/reference/data/body/create_appeal_body.dart';
import 'package:atraksion_nazorati/src/features/reference/data/model/attraction_model.dart';
import 'package:atraksion_nazorati/src/features/reference/data/model/region_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:atraksion_nazorati/generated/l10n.dart';
import 'package:atraksion_nazorati/src/config/components/app_elevated_button.dart';
import 'package:atraksion_nazorati/src/config/components/text_field_components.dart';
import 'package:atraksion_nazorati/src/config/theme/app_colors.dart';
import 'package:atraksion_nazorati/src/core/app_state/cubit/app_cubit.dart';
import 'package:atraksion_nazorati/src/features/reference/presentation/manager/appeal_bloc.dart';
import 'package:open_file/open_file.dart';
import 'package:reactive_dropdown_search/reactive_dropdown_search.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:toastification/toastification.dart';

class CreateAppealPage extends StatefulWidget {
  const CreateAppealPage({super.key});

  @override
  State<CreateAppealPage> createState() => _CreateAppealPageState();
}

class _CreateAppealPageState extends State<CreateAppealPage> {
  late final bloc = context.read<AppealBloc>();

  final form = FormGroup({
    'region': FormControl<int>(validators: [Validators.required]),
    'district': FormControl<int>(validators: [Validators.required]),
    'park': FormControl<int>(validators: [Validators.required]),
    'attraction': FormControl<AttractionModel>(validators: [Validators.required]),
    'appeal_type': FormControl<List<RegionModel>>(validators: [Validators.required]),
    'text': FormControl<String>(validators: [Validators.required]),
  });

  FormControl<int> get region => form.control('region') as FormControl<int>;
  FormControl<int> get district => form.control('district') as FormControl<int>;
  FormControl<int> get park => form.control('park') as FormControl<int>;
  FormControl<AttractionModel> get attraction => form.control('attraction') as FormControl<AttractionModel>;
  FormControl<List<RegionModel>> get appealType => form.control('appeal_type') as FormControl<List<RegionModel>>;
  FormControl<String> get text => form.control('text') as FormControl<String>;

  String? selectImg;
  int fileFormat=-1;

  final List<File> imgFiles = [];
  final List<File> docFiles = [];

  @override
  void initState() {
    super.initState();
    bloc.regions();
    bloc.appealTypes();
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
      appBar: AppBar(
        title: Text(
          S.of(context).create_appeal,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: BlocConsumer<AppealBloc, AppealState>(
        listener: (context, state) {
          if (state.isSendVerified) {
            toastification.show(
                title: Text(
                  S.of(context).create_appeal,
                  style: const TextStyle(fontSize: 16),
                ),
                description: Text(
                  S.of(context).appeal_sended,
                  style: const TextStyle(fontSize: 14),
                ),
                type: ToastificationType.info,
                alignment: Alignment.bottomCenter,
                showProgressBar: false,
                icon: const Icon(Icons.check_circle_outline),
                style: ToastificationStyle.fillColored,
                autoCloseDuration: 3.seconds,
                primaryColor: AppColors.mainColor);
            bloc.appealList();
            context.pop();
          }
        },
        builder: (context, state) {
          return ReactiveForm(
            formGroup: form,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/${!appState.isDark?'swatch':'swatch_auth'}.png'),
                    fit: BoxFit.cover),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.info,
                              color: Colors.red,
                            ),
                            const SizedBox(width: 8,),
                            Expanded(
                                child: Text(
                                  S.of(context).required,
                                  style: const TextStyle(
                                      fontSize: 12, color: Colors.red),
                                )),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(S.of(context).enter_address,style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                            const SizedBox(height: 6,),
                            ReactiveDropdownField<int>(
                              isExpanded: true,
                              formControl: region,
                              decoration: InputDecoration(
                                isDense: true,
                                errorStyle: const TextStyle(height: 0),
                                border: appTextFiledBorder(),
                                enabledBorder: appTextFiledBorder(),
                                disabledBorder: appTextFiledBorder(),
                                focusedBorder: appTextFiledBorder(),
                                errorBorder: appTextFiledErrorBorder(),
                              ),
                              borderRadius: BorderRadius.circular(6),
                              items:state.regions?.map((e){
                                return  DropdownMenuItem(
                                  value: e.value,
                                  child: Text(e.label??'--'),
                                );
                              }).toList()??[],
                              hint: Text(S.of(context).regions,style: const TextStyle(color: Colors.grey),),
                              onChanged: (val) {
                                bloc.districts(val.value??0);
                              },
                              validationMessages: {
                                'required': (error) => '',
                              },
                            ),
                            const SizedBox(height: 10,),
                            ReactiveDropdownField<int>(
                              isExpanded: true,
                              formControl: district,
                              decoration: InputDecoration(
                                isDense: true,
                                errorStyle: const TextStyle(height: 0),
                                border: appTextFiledBorder(),
                                enabledBorder: appTextFiledBorder(),
                                disabledBorder: appTextFiledBorder(),
                                focusedBorder: appTextFiledBorder(),
                                errorBorder: appTextFiledErrorBorder(),
                              ),
                              borderRadius: BorderRadius.circular(6),
                              items:state.districts?.map((e){
                                return  DropdownMenuItem(
                                  value: e.value,
                                  child: Text(e.label??'--'),
                                );
                              }).toList()??[],
                              hint: Text(S.of(context).district,style: const TextStyle(color: Colors.grey),),
                              onChanged: (val) {
                                bloc.parks(val.value??0);
                              },
                              validationMessages: {
                                'required': (error) => '',
                              },
                            ),
                            const SizedBox(height: 10,),
                            ReactiveDropdownField<int>(
                              isExpanded: true,
                              formControl: park,
                              decoration: InputDecoration(
                                isDense: true,
                                errorStyle: const TextStyle(height: 0),
                                border: appTextFiledBorder(),
                                enabledBorder: appTextFiledBorder(),
                                disabledBorder: appTextFiledBorder(),
                                focusedBorder: appTextFiledBorder(),
                                errorBorder: appTextFiledErrorBorder(),
                              ),
                              borderRadius: BorderRadius.circular(6),
                              items:state.parks?.map((e){
                                return  DropdownMenuItem(
                                  value: e.value,
                                  child: Text(e.label??'--'),
                                );
                              }).toList()??[],
                              hint: Text(S.of(context).istirohatBogi,style: const TextStyle(color: Colors.grey),),
                              onChanged: (val) {
                                bloc.attractions(val.value??0);
                              },
                              validationMessages: {
                                'required': (error) => '',
                              },
                            ),
                            const SizedBox(height: 10,),
                            ReactiveDropdownField<AttractionModel>(
                              isExpanded: true,
                              formControl: attraction,
                              decoration: InputDecoration(
                                isDense: true,
                                errorStyle: const TextStyle(height: 0),
                                border: appTextFiledBorder(),
                                enabledBorder: appTextFiledBorder(),
                                disabledBorder: appTextFiledBorder(),
                                focusedBorder: appTextFiledBorder(),
                                errorBorder: appTextFiledErrorBorder(),
                              ),
                              borderRadius: BorderRadius.circular(6),
                              items:state.attractions?.map((e){
                                return  DropdownMenuItem(
                                  value: e,
                                  child: Text(e.label??'--'),
                                );
                              }).toList()??[],
                              hint: Text(S.of(context).attraksionNomi,style: const TextStyle(color: Colors.grey),),
                              onChanged: (val) {
                                setState(() {
                                  selectImg=val.value?.image;
                                });
                              },
                              validationMessages: {
                                'required': (error) => '',
                              },
                            ),
                            const SizedBox(height: 10),
                            selectImg!=null?
                            ClipRRect(
                              borderRadius: const BorderRadius.all(Radius.circular(24)),
                              child: FadeInImage(
                                placeholder: const AssetImage('assets/images/img_placeholder.jpg'),
                                imageErrorBuilder: (context, error, stackTrace) {
                                  return Image.asset('assets/images/img_placeholder.jpg', fit: BoxFit.cover);
                                },
                                image: NetworkImage(selectImg??''),
                                fit: BoxFit.cover,
                              ),
                            ):const SizedBox(),
                            const SizedBox(height: 10),
                            Text(S.of(context).attraksiondagiQonunbuzilishTuri,style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                            const SizedBox(height: 4),
                            ReactiveDropdownSearchMultiSelection<RegionModel, RegionModel>(
                              formControl: appealType,
                              dropdownDecoratorProps: DropDownDecoratorProps(
                                dropdownSearchDecoration: InputDecoration(
                                  isDense: true,
                                  errorStyle: const TextStyle(height: 0),
                                  border: appTextFiledBorder(),
                                  enabledBorder: appTextFiledBorder(),
                                  disabledBorder: appTextFiledBorder(),
                                  focusedBorder: appTextFiledBorder(),
                                  errorBorder: appTextFiledErrorBorder(),
                                ),
                              ),
                              popupProps: PopupPropsMultiSelection.menu(
                                menuProps: MenuProps(borderRadius: BorderRadius.circular(6)),
                                showSelectedItems: false,
                                itemBuilder: (context,item,isSelected,){
                                  return DropdownMenuItem(
                                    value: item.value,
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Text(item.label??"--"),
                                    ),
                                  );
                                },
                              ),
                              dropdownBuilder: (context, selectedItems) {
                                if (selectedItems.isEmpty) {
                                  return Text(S.of(context).qonunbuzilishTuri,style: const TextStyle(color: Colors.grey,fontSize: 16),);
                                } else {
                                  return Wrap(
                                    children: selectedItems.map((item) {
                                      return Chip(
                                        label: Text(item.label??'--'),
                                      );
                                    }).toList(),
                                  );
                                }
                              },
                              validationMessages: {
                                'required': (error) => '',
                              },
                              items: state.appealTypes??[],
                              showClearButton: true,
                            ),
                            const SizedBox(height: 10,),
                            Text(S.of(context).appeal,style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                            const SizedBox(height: 6,),
                            ReactiveTextField(
                              formControl: form.control('text') as FormControl<String>,
                              decoration: InputDecoration(
                                isDense: true,
                                errorStyle: const TextStyle(height: 0),
                                errorText: null,
                                hintText: S.of(context).appeal_text,
                                border: appTextFiledBorder(),
                                enabledBorder: appTextFiledBorder(),
                                disabledBorder: appTextFiledBorder(),
                                focusedBorder: appTextFiledBorder(),
                                errorBorder: appTextFiledErrorBorder(),
                              ),
                              cursorColor: Theme.of(context).colorScheme.tertiary,
                              keyboardType: TextInputType.text,
                              minLines: 5,
                              maxLines: null,
                              validationMessages: {
                                'required': (error) => '',
                              },
                            ),
                            const SizedBox(height: 10,),
                            Text(S.of(context).attachment,style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w600,),),
                            const SizedBox(height: 6,),
                            Row(
                              children: [
                              Expanded(
                                child: SizedBox(
                                  height: 56,
                                  child: IconButton(
                                      onPressed: () async {
                                        FilePickerResult? result = await FilePicker.platform.pickFiles(
                                          type: FileType.custom,
                                          allowedExtensions: ['pdf','doc','docx','xls'],
                                        );
                                        if (result != null && result.files.single.path != null) {
                                          int bytes=await File(result.files.single.path!).length();
                                          if(bytes<=5242880){
                                            setState(() {
                                              docFiles.add(File(result.files.single.path!));
                                            });
                                            fileFormat=1;
                                            String bytes = await getFileSize(File(result.files.single.path!).path, 1);
                                            debugPrint(bytes);
                                          }else{
                                            snackBar(S.of(context).file_required);
                                          }
                                        } else {
                                          /// User canceled the picker
                                        }
                                      },
                                      icon: SvgPicture.asset('assets/icons/ic_folder.svg',color: Colors.white,),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.buttonColorDark,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16,),
                              Expanded(
                                child: SizedBox(
                                  height: 56,
                                  child: IconButton(
                                      onPressed: () async {
                                        try {
                                          final image = await ImagePicker().pickImage(source: ImageSource.camera);
                                          if (image != null) {
                                            int bytes=await image.length();
                                            if(bytes<=5242880){
                                              setState(() {
                                                imgFiles.add(File(image.path));
                                              });
                                              fileFormat=2;
                                              String bytes = await getFileSize(image.path, 1);
                                              debugPrint(bytes);
                                            }else{
                                              snackBar(S.of(context).file_required);
                                            }
                                          }
                                        } on PlatformException catch (e) {
                                          debugPrint('Failed to pick image: $e');
                                        }
                                      },
                                      icon: SvgPicture.asset('assets/icons/ic_camera.svg',color: Colors.white,),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.buttonColorDark,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                                const SizedBox(width: 16,),
                              Expanded(
                                child: SizedBox(
                                  height: 56,
                                  child: IconButton(
                                      onPressed: () async {
                                        try {
                                          final image = await ImagePicker().pickImage(source: ImageSource.gallery);
                                          if (image != null) {
                                            int bytes=await image.length();
                                            if(bytes<=5242880){
                                              setState(() {
                                                imgFiles.add(File(image.path));
                                              });
                                              fileFormat=2;
                                              String bytes = await getFileSize(image.path, 1);
                                              debugPrint(bytes);
                                            }else{
                                              snackBar(S.of(context).file_required);
                                            }
                                          }
                                        } on PlatformException catch (e) {
                                          debugPrint('Failed to pick image: $e');
                                        }
                                      },
                                      icon: SvgPicture.asset('assets/icons/ic_gallery.svg',color: Colors.white,),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.buttonColorDark,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],),
                            const SizedBox(height: 8,),
                            Align(
                              alignment: Alignment.center,
                                child: Text(S.of(context).file_required,style: const TextStyle(fontSize: 14),textAlign: TextAlign.center,))
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16,),
                    imgFiles.isNotEmpty?
                      MediaQuery.removePadding(
                        context: context,
                        removeBottom: true,
                        child: GridView.builder(
                            shrinkWrap: true,
                            physics: const ClampingScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemCount: imgFiles.length,
                            gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4),
                            itemBuilder:
                                (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () {
                                  OpenFile.open(imgFiles[index].path);
                                },
                                child: Stack(
                                  children: [
                                    Container(
                                      height: 100,
                                      margin: const EdgeInsets.all(2),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(8),
                                          image: DecorationImage(
                                              image: FileImage(File(
                                                  imgFiles[index].path)),
                                              fit: BoxFit.cover)),
                                    ),
                                    Positioned(
                                      right:0,
                                      child: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              imgFiles.removeAt(index);
                                            });
                                          },
                                          icon: const Icon(Icons.delete,color: Colors.red,)),
                                    ),
                                  ],
                                ),
                              );
                            }),
                      ):const SizedBox(),
                    const SizedBox(height: 10),
                    docFiles.isNotEmpty?
                      MediaQuery.removePadding(
                        context: context,
                        removeBottom: true,
                        child: ListView.builder(
                            physics: const ClampingScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: docFiles.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  OpenFile.open(docFiles[index].path);
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
                                                docFiles[index].path.split('/').last??'--',
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
                                        const SizedBox(height: 10,),
                                        IconButton(
                                            onPressed: () {
                                              setState(() {
                                                docFiles.removeAt(index);
                                              });
                                            },
                                            icon: const Icon(Icons.delete,color: Colors.red,))
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ):const SizedBox(),
                    const SizedBox(height: 12,),
                    state.isLoading?const CircularProgressIndicator(color: AppColors.mainColor,):
                    ReactiveFormConsumer(builder: (context,form,child){
                      return AppElevatedButton(
                          text: S.of(context).sending,
                          onClick: () async {
                            if(form.valid){
                              debugPrint(jsonEncode(form.value));
                              await filesUpload(appealType.value).then((items){
                                bloc.createAppeal(CreateAppealBody(
                                regionId: region.value,
                                districtId: district.value,
                                parkId: park.value,
                                attractionId: attraction.value?.value,
                                description: text.value,
                                docs: docFiles,
                                images: imgFiles,
                                  offenseTypesIds: items
                              ));
                              });
                            }else{
                              form.markAllAsTouched();
                            }
                          });
                    }),
                    const SizedBox(height: 12,),
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

  Future<List<String>> filesUpload(List<RegionModel?>? regions) async {
    List<String> ids = [];
    for (RegionModel? file in regions ?? []) {
      ids.add(file?.value.toString()??'0');
    }
    debugPrint(ids.toString());
    return ids;
  }

  getFileSize(String filepath, int decimals) async {
    var file = File(filepath);
    int bytes = await file.length();
    if (bytes <= 0) return "0 B";
    const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
    var i = (log(bytes) / log(1024)).floor();
    return '${(bytes / pow(1024, i)).toStringAsFixed(decimals)} ${suffixes[i]}';
  }
}
