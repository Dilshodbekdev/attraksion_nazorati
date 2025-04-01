part of 'appeal_bloc.dart';

abstract class AppealEvent {}

class RegionsEvent extends AppealEvent {
  RegionsEvent();
}

class DistrictsEvent extends AppealEvent {
  final int id;

  DistrictsEvent({required this.id});
}

class ParksEvent extends AppealEvent {
  final int id;

  ParksEvent({required this.id});
}

class AttractionsEvent extends AppealEvent {
  final int id;

  AttractionsEvent({required this.id});
}

class CategoryListEvent extends AppealEvent {
  CategoryListEvent();
}

class AppealListEvent extends AppealEvent {
  AppealListEvent();
}

class AppealTypesEvent extends AppealEvent {
  AppealTypesEvent();
}

class RequirmentsEvent extends AppealEvent {
  RequirmentsEvent();
}

class CreateAppealEvent extends AppealEvent {
  final CreateAppealBody body;

  CreateAppealEvent({required this.body});
}

class AppealDetailsEvent extends AppealEvent {
  final int id;

  AppealDetailsEvent({required this.id});
}
