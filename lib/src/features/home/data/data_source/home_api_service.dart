import 'package:atraksion_nazorati/src/features/home/data/models/about_model.dart';
import 'package:atraksion_nazorati/src/features/home/data/models/questionnaire_model.dart';
import 'package:dio/dio.dart';
import 'package:atraksion_nazorati/src/features/home/data/body/voting_body.dart';
import 'package:atraksion_nazorati/src/features/home/data/models/faq_model.dart';
import 'package:atraksion_nazorati/src/features/home/data/models/leadership_model.dart';
import 'package:atraksion_nazorati/src/features/home/data/models/news_model.dart';
import 'package:atraksion_nazorati/src/features/home/data/models/notification_model.dart';
import 'package:atraksion_nazorati/src/features/home/data/models/sent_vote_model.dart';
import 'package:atraksion_nazorati/src/features/home/data/models/statistic_model.dart';
import 'package:retrofit/retrofit.dart';

part 'home_api_service.g.dart';

@RestApi()
abstract class HomeApiService {
  factory HomeApiService(Dio dio, {String baseUrl}) = _HomeApiService;

  /// URLS
  static const String _faq = 'api/question/faq/';
  static const String _news = 'api/news/';
  static const String _notifications = 'api/unread';
  static const String _updateNotify = 'api/update-notify/{id}';
  static const String _leadership = 'api/about/leadership/';
  static const String _about = 'api/about/';
  static const String _centralMembership = 'api/about/central-membership/';
  static const String _regionalMembership = 'api/about/regional-membership/';
  static const String _firstArticle = 'api/news/first-article/';
  static const String _statistic = 'api/about/statistics/';
  static const String _questionnaire = 'api/question/questionnaire/';
  static const String _createQuestionnaire = 'api/question/questionnaire/{id}/';

  @GET(_faq)
  Future<HttpResponse<List<FaqModel>>> faq();

  @GET(_leadership)
  Future<HttpResponse<List<LeadershipModel>>> leadership();

  @GET(_questionnaire)
  Future<HttpResponse<List<QuestionnaireModel>>> questionnaire();

  @PATCH(_createQuestionnaire)
  Future<HttpResponse<QuestionnaireModel>> createQuestionnaire(
    @Path('id') int id,
    @Body() VotingBody body,
  );

  @GET(_news)
  Future<HttpResponse<NewsModel>> news(
    @Query('p') int p,
    @Query('page_size') int pageSize,
  );

  @GET(_notifications)
  Future<HttpResponse<List<NotificationModel>>> notifications();

  @PUT(_updateNotify)
  Future<HttpResponse<SentVoteModel>> updateNotify(@Path('id') int id);

  @GET(_firstArticle)
  Future<HttpResponse<NewModel>> firstArticle();

  @GET(_statistic)
  Future<HttpResponse<StatisticModel>> statistic();

  @GET(_centralMembership)
  Future<HttpResponse<List<LeadershipModel>>> centralMembership();

  @GET(_regionalMembership)
  Future<HttpResponse<List<LeadershipModel>>> regionalMembership();

  @GET(_about)
  Future<HttpResponse<AboutModel>> about();
}
