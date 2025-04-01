import 'package:atraksion_nazorati/src/core/resources/data_state.dart';
import 'package:atraksion_nazorati/src/features/home/data/body/voting_body.dart';
import 'package:atraksion_nazorati/src/features/home/data/models/about_model.dart';
import 'package:atraksion_nazorati/src/features/home/data/models/faq_model.dart';
import 'package:atraksion_nazorati/src/features/home/data/models/leadership_model.dart';
import 'package:atraksion_nazorati/src/features/home/data/models/news_model.dart';
import 'package:atraksion_nazorati/src/features/home/data/models/notification_model.dart';
import 'package:atraksion_nazorati/src/features/home/data/models/questionnaire_model.dart';
import 'package:atraksion_nazorati/src/features/home/data/models/sent_vote_model.dart';
import 'package:atraksion_nazorati/src/features/home/data/models/statistic_model.dart';

abstract class HomeRepository {
  Future<DataState<List<FaqModel>>> faq();

  Future<DataState<List<LeadershipModel>>> leadership();

  Future<DataState<List<QuestionnaireModel>>> questionnaire();

  Future<DataState<AboutModel>> about();

  Future<DataState<QuestionnaireModel>> createQuestionnaire(VotingBody body);

  Future<DataState<NewsModel>> news(int page, int pageSize);

  Future<DataState<List<NotificationModel>>> notifications();

  Future<DataState<SentVoteModel>> updateNotify(int id);

  Future<DataState<NewModel>> firstArticle();

  Future<DataState<StatisticModel>> statistic();

  Future<DataState<List<LeadershipModel>>> centralMembership();

  Future<DataState<List<LeadershipModel>>> regionalMembership();
}
