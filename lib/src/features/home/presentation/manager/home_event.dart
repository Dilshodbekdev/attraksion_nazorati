part of 'home_bloc.dart';

abstract class HomeEvent {}

class FaqEvent extends HomeEvent {
  FaqEvent();
}

class LeadershipEvent extends HomeEvent {
  LeadershipEvent();
}

class NotificationsEvent extends HomeEvent {
  NotificationsEvent();
}

class RegionalMembershipEvent extends HomeEvent {
  RegionalMembershipEvent();
}

class CentralMembershipEvent extends HomeEvent {
  CentralMembershipEvent();
}

class NewsEvent extends HomeEvent {
  final bool isPaging;

  NewsEvent({required this.isPaging});
}

class StatisticEvent extends HomeEvent {
  StatisticEvent();
}

class FirstArticleEvent extends HomeEvent {
  FirstArticleEvent();
}

class AboutEvent extends HomeEvent {
  AboutEvent();
}

class QuestionnaireEvent extends HomeEvent {
  QuestionnaireEvent();
}

class CreateQuestionnaireEvent extends HomeEvent {
  final VotingBody body;

  CreateQuestionnaireEvent({required this.body});
}

class UpdateNotifyEvent extends HomeEvent {
  final int id;

  UpdateNotifyEvent({required this.id});
}
