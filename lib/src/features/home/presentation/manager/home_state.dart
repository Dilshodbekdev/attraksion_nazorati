part of 'home_bloc.dart';

class HomeState {
  final List<FaqModel>? faq;
  final List<NewModel> news;
  final ArticlesBody? questionsBody;
  final ArticlesBody? newsBody;
  final StatisticModel? statisticModel;
  final List<LeadershipModel>? centralMembership;
  final List<LeadershipModel>? regionalMembership;
  final List<LeadershipModel>? leaderships;
  final List<NotificationModel>? notifications;
  final NewModel? firstArticle;
  final AboutModel? about;
  final List<QuestionnaireModel>? questionnaires;
  final QuestionnaireModel? createQuestionnaire;
  final SentVoteModel? updateNotify;
  final bool isSendVerified;
  final bool isVoted;
  final bool isGetMessageVerified;
  final bool isGetNewMessageVerified;
  final bool isPagingFaq;
  final bool isPagingNews;
  final bool reachedMaxFaq;
  final bool reachedMaxNews;
  final bool isLoading;
  final bool hasError;
  final String errorMessage;

  HomeState({
    this.faq,
    this.news = const [],
    this.questionsBody,
    this.newsBody,
    this.statisticModel,
    this.centralMembership,
    this.regionalMembership,
    this.leaderships,
    this.notifications,
    this.firstArticle,
    this.about,
    this.questionnaires,
    this.createQuestionnaire,
    this.updateNotify,
    this.isSendVerified = false,
    this.isVoted = false,
    this.isGetMessageVerified = false,
    this.isGetNewMessageVerified = false,
    this.isPagingFaq = false,
    this.isPagingNews = false,
    this.reachedMaxFaq = false,
    this.reachedMaxNews = false,
    this.isLoading = false,
    this.hasError = false,
    this.errorMessage = 'Some Error',
  });

  HomeState copyWith({
    List<FaqModel>? faq,
    List<NewModel>? news,
    ArticlesBody? questionsBody,
    ArticlesBody? newsBody,
    StatisticModel? statisticModel,
    List<LeadershipModel>? centralMembership,
    List<LeadershipModel>? regionalMembership,
    List<LeadershipModel>? leaderships,
    List<NotificationModel>? notifications,
    NewModel? firstArticle,
    AboutModel? about,
    List<QuestionnaireModel>? questionnaires,
    QuestionnaireModel? createQuestionnaires,
    SentVoteModel? updateNotify,
    bool? isSendVerified,
    bool? isVoted,
    bool? isGetMessageVerified,
    bool? isGetNewMessageVerified,
    bool? isPagingNews,
    bool? isPagingFaq,
    bool? reachedMaxFaq,
    bool? reachedMaxNews,
    bool? isLoading,
    bool? hasError,
    String? errorMessage,
  }) =>
      HomeState(
        faq: faq ?? this.faq,
        news: news ?? this.news,
        questionsBody: questionsBody ?? this.questionsBody,
        newsBody: newsBody ?? this.newsBody,
        statisticModel: statisticModel ?? this.statisticModel,
        centralMembership: centralMembership ?? this.centralMembership,
        regionalMembership: regionalMembership ?? this.regionalMembership,
        leaderships: leaderships ?? this.leaderships,
        notifications: notifications ?? this.notifications,
        firstArticle: firstArticle ?? this.firstArticle,
        about: about ?? this.about,
        questionnaires: questionnaires ?? this.questionnaires,
        createQuestionnaire: createQuestionnaires,
        updateNotify: updateNotify,
        isSendVerified: isSendVerified ?? false,
        isVoted: isVoted ?? false,
        isGetMessageVerified: isGetMessageVerified ?? false,
        isGetNewMessageVerified: isGetNewMessageVerified ?? false,
        isPagingNews: isPagingNews ?? false,
        isPagingFaq: isPagingFaq ?? false,
        reachedMaxFaq: reachedMaxFaq ?? this.reachedMaxFaq,
        reachedMaxNews: reachedMaxNews ?? this.reachedMaxNews,
        isLoading: isLoading ?? false,
        hasError: hasError ?? false,
        errorMessage: errorMessage ?? this.errorMessage,
      );
}
