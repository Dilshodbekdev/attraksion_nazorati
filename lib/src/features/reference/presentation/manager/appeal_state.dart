part of 'appeal_bloc.dart';

class AppealState {
  final List<RequirmentModel>? requirments;
  final List<RegionModel>? regions;
  final List<RegionModel>? districts;
  final List<RegionModel>? parks;
  final List<AttractionModel>? attractions;
  final List<AppealModel>? appealList;
  final List<RegionModel>? appealTypes;
  final CreateAppealModel? createAppealModel;
  final CreateAppealModel? appealDetailsModel;
  final bool isSendVerified;
  final bool isGetMessageVerified;
  final bool isGetNewMessageVerified;
  final bool isPaging;
  final bool reachedMaxQuestions;
  final bool reachedMaxNews;
  final bool isLoading;
  final bool hasError;
  final String errorMessage;

  AppealState({
    this.requirments,
    this.regions,
    this.districts,
    this.parks,
    this.attractions,
    this.appealList,
    this.appealTypes,
    this.createAppealModel,
    this.appealDetailsModel,
    this.isSendVerified = false,
    this.isGetMessageVerified = false,
    this.isGetNewMessageVerified = false,
    this.isPaging = false,
    this.reachedMaxQuestions = false,
    this.reachedMaxNews = false,
    this.isLoading = false,
    this.hasError = false,
    this.errorMessage = 'Some Error',
  });

  AppealState copyWith({
    List<RequirmentModel>? requirments,
    List<RegionModel>? regions,
    List<RegionModel>? districts,
    List<RegionModel>? parks,
    List<AttractionModel>? attractions,
    List<AppealModel>? appealList,
    List<RegionModel>? appealTypes,
    CreateAppealModel? createAppealModel,
    CreateAppealModel? appealDetailsModel,
    bool? isSendVerified,
    bool? isGetMessageVerified,
    bool? isGetNewMessageVerified,
    bool? isPaging,
    bool? reachedMaxQuestions,
    bool? reachedMaxNews,
    bool? isLoading,
    bool? hasError,
    String? errorMessage,
  }) =>
      AppealState(
        requirments: requirments??this.requirments,
        regions: regions ?? this.regions,
        districts: districts ?? this.districts,
        parks: parks ?? this.parks,
        attractions: attractions ?? this.attractions,
        appealList: appealList ?? this.appealList,
        appealTypes: appealTypes ?? this.appealTypes,
        createAppealModel: createAppealModel,
        appealDetailsModel: appealDetailsModel,
        isSendVerified: isSendVerified ?? false,
        isGetMessageVerified: isGetMessageVerified ?? false,
        isGetNewMessageVerified: isGetNewMessageVerified ?? false,
        isPaging: isPaging ?? false,
        reachedMaxQuestions: reachedMaxQuestions ?? this.reachedMaxQuestions,
        reachedMaxNews: reachedMaxNews ?? this.reachedMaxNews,
        isLoading: isLoading ?? false,
        hasError: hasError ?? false,
        errorMessage: errorMessage ?? this.errorMessage,
      );
}
