import 'dart:async';

import 'package:atraksion_nazorati/src/features/home/data/models/about_model.dart';
import 'package:atraksion_nazorati/src/features/home/data/models/questionnaire_model.dart';
import 'package:atraksion_nazorati/src/features/home/domain/use_case/about_use_case.dart';
import 'package:atraksion_nazorati/src/features/home/domain/use_case/central_membership_use_case.dart';
import 'package:atraksion_nazorati/src/features/home/domain/use_case/regional_membership_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:atraksion_nazorati/src/core/resources/data_state.dart';
import 'package:atraksion_nazorati/src/features/home/data/body/articles_body.dart';
import 'package:atraksion_nazorati/src/features/home/data/body/voting_body.dart';
import 'package:atraksion_nazorati/src/features/home/data/models/faq_model.dart';
import 'package:atraksion_nazorati/src/features/home/data/models/leadership_model.dart';
import 'package:atraksion_nazorati/src/features/home/data/models/news_model.dart';
import 'package:atraksion_nazorati/src/features/home/data/models/notification_model.dart';
import 'package:atraksion_nazorati/src/features/home/data/models/sent_vote_model.dart';
import 'package:atraksion_nazorati/src/features/home/data/models/statistic_model.dart';
import 'package:atraksion_nazorati/src/features/home/domain/use_case/create_questionnaire_use_case.dart';
import 'package:atraksion_nazorati/src/features/home/domain/use_case/faq_use_case.dart';
import 'package:atraksion_nazorati/src/features/home/domain/use_case/first_article_use_case.dart';
import 'package:atraksion_nazorati/src/features/home/domain/use_case/leadership_use_case.dart';
import 'package:atraksion_nazorati/src/features/home/domain/use_case/news_use_case.dart';
import 'package:atraksion_nazorati/src/features/home/domain/use_case/notifications_use_case.dart';
import 'package:atraksion_nazorati/src/features/home/domain/use_case/questionnaire_use_case.dart';
import 'package:atraksion_nazorati/src/features/home/domain/use_case/statistic_use_case.dart';
import 'package:atraksion_nazorati/src/features/home/domain/use_case/update_notify_use_case.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final FaqUseCase _faqUseCase;
  final LeadershipUseCase _leadershipUseCase;
  final NotificationsUseCase _notificationsUseCase;
  final UpdateNotifyUseCase _updateNotifyUseCase;
  final NewsUseCase _newsUseCase;
  final StatisticUseCase _statisticUseCase;
  final CentralMembershipUseCase _centralMembershipUseCase;
  final RegionalMembershipUseCase _regionalMembershipUseCase;
  final FirstArticleUseCase _firstArticleUseCase;
  final QuestionnaireUseCase _questionnaireUseCase;
  final CreateQuestionnaireUseCase _createQuestionnaireUseCase;
  final AboutUseCase _aboutUseCase;

  HomeBloc(
    this._faqUseCase,
    this._newsUseCase,
    this._statisticUseCase,
    this._firstArticleUseCase,
    this._centralMembershipUseCase,
    this._questionnaireUseCase,
    this._createQuestionnaireUseCase,
    this._regionalMembershipUseCase,
    this._leadershipUseCase,
    this._notificationsUseCase,
    this._updateNotifyUseCase,
    this._aboutUseCase,
  ) : super(HomeState()) {
    on<FaqEvent>((event, emit) async {
      await emit.onEach(_onFaq(event), onData: emit.call);
    });

    on<LeadershipEvent>((event, emit) async {
      await emit.onEach(_onLeadership(event), onData: emit.call);
    });

    on<NotificationsEvent>((event, emit) async {
      await emit.onEach(_onNotifications(event), onData: emit.call);
    });

    on<CentralMembershipEvent>((event, emit) async {
      await emit.onEach(_onCentralMembership(event), onData: emit.call);
    });

    on<RegionalMembershipEvent>((event, emit) async {
      await emit.onEach(_onRegionalMembership(event), onData: emit.call);
    });

    on<NewsEvent>((event, emit) async {
      await emit.onEach(_onNews(event), onData: emit.call);
    });

    on<StatisticEvent>((event, emit) async {
      await emit.onEach(_onStatistic(event), onData: emit.call);
    });

    on<FirstArticleEvent>((event, emit) async {
      await emit.onEach(_onFirstArticle(event), onData: emit.call);
    });

    on<AboutEvent>((event, emit) async {
      await emit.onEach(_onAbout(event), onData: emit.call);
    });

    on<QuestionnaireEvent>((event, emit) async {
      await emit.onEach(_onQuestionnaire(event), onData: emit.call);
    });

    on<CreateQuestionnaireEvent>((event, emit) async {
      await emit.onEach(_onCreateQuestionnaire(event), onData: emit.call);
    });

    on<UpdateNotifyEvent>((event, emit) async {
      await emit.onEach(_onUpdateNotify(event), onData: emit.call);
    });
  }

  faq() {
    add(FaqEvent());
  }

  leadership() {
    add(LeadershipEvent());
  }

  notifications() {
    add(NotificationsEvent());
  }

  centralMembership() {
    add(CentralMembershipEvent());
  }

  regionalMembership() {
    add(RegionalMembershipEvent());
  }

  updateNotify(int id) {
    add(UpdateNotifyEvent(id: id));
  }

  news() {
    add(NewsEvent(isPaging: false));
  }

  pagingNews() {
    add(NewsEvent(isPaging: true));
  }

  statistic() {
    add(StatisticEvent());
  }

  firstArticle() {
    add(FirstArticleEvent());
  }

  about() {
    add(AboutEvent());
  }

  questionnaire() {
    add(QuestionnaireEvent());
  }

  createQuestionnaire(VotingBody body) {
    add(CreateQuestionnaireEvent(body: body));
  }

  Stream<HomeState> _onFaq(FaqEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _faqUseCase.call(params: 1);

    if (dataState is DataSuccess) {
      yield state.copyWith(faq: dataState.data);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<HomeState> _onLeadership(LeadershipEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _leadershipUseCase.call(params: 1);

    if (dataState is DataSuccess) {
      yield state.copyWith(leaderships: dataState.data);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<HomeState> _onNotifications(NotificationsEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _notificationsUseCase.call(params: 1);

    if (dataState is DataSuccess) {
      yield state.copyWith(notifications: dataState.data);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<HomeState> _onCentralMembership(CentralMembershipEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _centralMembershipUseCase.call(params: 1);

    if (dataState is DataSuccess) {
      yield state.copyWith(centralMembership: dataState.data);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<HomeState> _onRegionalMembership(
      RegionalMembershipEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _regionalMembershipUseCase.call(params: 1);

    if (dataState is DataSuccess) {
      yield state.copyWith(regionalMembership: dataState.data);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<HomeState> _onNews(NewsEvent event) async* {
    if (!state.reachedMaxNews || !event.isPaging) {
      final page = event.isPaging ? (state.newsBody?.page ?? 1) : 1;
      yield state.copyWith(
          isLoading: !event.isPaging, isPagingNews: event.isPaging);
      final dataState =
          await _newsUseCase.call(params: ArticlesBody(page: page));

      if (dataState is DataSuccess) {
        final newList = dataState.data?.results ?? [];
        yield state.copyWith(
          news: state.isPagingNews ? [...state.news, ...newList] : newList,
          reachedMaxNews: newList.length < 10,
          newsBody: (state.newsBody ?? ArticlesBody()).copyWith(page: page + 1),
        );
      } else if (dataState is DataFailed) {
        yield state.copyWith(hasError: true, errorMessage: dataState.message);
      }
    }
  }

  Stream<HomeState> _onStatistic(StatisticEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _statisticUseCase.call(params: 1);

    if (dataState is DataSuccess) {
      yield state.copyWith(statisticModel: dataState.data);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<HomeState> _onFirstArticle(FirstArticleEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _firstArticleUseCase.call(params: 1);

    if (dataState is DataSuccess) {
      yield state.copyWith(firstArticle: dataState.data);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<HomeState> _onAbout(AboutEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _aboutUseCase.call(params: 1);

    if (dataState is DataSuccess) {
      yield state.copyWith(about: dataState.data);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<HomeState> _onQuestionnaire(QuestionnaireEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _questionnaireUseCase.call(params: 1);

    if (dataState is DataSuccess) {
      yield state.copyWith(questionnaires: dataState.data);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<HomeState> _onCreateQuestionnaire(
      CreateQuestionnaireEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState =
        await _createQuestionnaireUseCase.call(params: event.body);

    if (dataState is DataSuccess) {
      yield state.copyWith(createQuestionnaires: dataState.data, isVoted: true);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<HomeState> _onUpdateNotify(UpdateNotifyEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _updateNotifyUseCase.call(params: event.id);

    if (dataState is DataSuccess) {
      yield state.copyWith(
          updateNotify: dataState.data, isGetNewMessageVerified: true);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }
}
