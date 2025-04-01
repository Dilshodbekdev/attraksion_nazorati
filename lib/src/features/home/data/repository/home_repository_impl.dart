import 'package:atraksion_nazorati/src/core/resources/base_repository.dart';
import 'package:atraksion_nazorati/src/core/resources/data_state.dart';
import 'package:atraksion_nazorati/src/features/home/data/body/voting_body.dart';
import 'package:atraksion_nazorati/src/features/home/data/data_source/home_api_service.dart';
import 'package:atraksion_nazorati/src/features/home/data/models/about_model.dart';
import 'package:atraksion_nazorati/src/features/home/data/models/faq_model.dart';
import 'package:atraksion_nazorati/src/features/home/data/models/leadership_model.dart';
import 'package:atraksion_nazorati/src/features/home/data/models/news_model.dart';
import 'package:atraksion_nazorati/src/features/home/data/models/notification_model.dart';
import 'package:atraksion_nazorati/src/features/home/data/models/questionnaire_model.dart';
import 'package:atraksion_nazorati/src/features/home/data/models/sent_vote_model.dart';
import 'package:atraksion_nazorati/src/features/home/data/models/statistic_model.dart';
import 'package:atraksion_nazorati/src/features/home/domain/repository/home_repository.dart';

class HomeRepositoryImpl with BaseRepository implements HomeRepository {
  final HomeApiService _apiService;

  HomeRepositoryImpl(this._apiService);

  @override
  Future<DataState<List<FaqModel>>> faq() async =>
      await handleResponse(response: _apiService.faq());

  @override
  Future<DataState<List<LeadershipModel>>> leadership() async =>
      await handleResponse(response: _apiService.leadership());

  @override
  Future<DataState<List<QuestionnaireModel>>> questionnaire() async =>
      await handleResponse(response: _apiService.questionnaire());

  @override
  Future<DataState<NewsModel>> news(int page, int pageSize) async =>
      await handleResponse(response: _apiService.news(page, pageSize));

  @override
  Future<DataState<NewModel>> firstArticle() async =>
      await handleResponse(response: _apiService.firstArticle());

  @override
  Future<DataState<StatisticModel>> statistic() async =>
      await handleResponse(response: _apiService.statistic());

  @override
  Future<DataState<List<LeadershipModel>>> centralMembership() async =>
      await handleResponse(response: _apiService.centralMembership());

  @override
  Future<DataState<List<LeadershipModel>>> regionalMembership() async =>
      await handleResponse(response: _apiService.regionalMembership());

  @override
  Future<DataState<QuestionnaireModel>> createQuestionnaire(VotingBody body) async =>
      await handleResponse(response: _apiService.createQuestionnaire(int.parse(body.id??'0'),body));

  @override
  Future<DataState<List<NotificationModel>>> notifications() async =>
      await handleResponse(response: _apiService.notifications());

  @override
  Future<DataState<SentVoteModel>> updateNotify(int id) async =>
      await handleResponse(response: _apiService.updateNotify(id));

  @override
  Future<DataState<AboutModel>> about() async=>
      await handleResponse(response: _apiService.about());
}
