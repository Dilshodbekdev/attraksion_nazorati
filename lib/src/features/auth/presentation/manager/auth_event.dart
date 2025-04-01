part of 'auth_bloc.dart';

abstract class AuthEvent {}

class OneIdEvent extends AuthEvent {
  final String body;

  OneIdEvent({required this.body});
}