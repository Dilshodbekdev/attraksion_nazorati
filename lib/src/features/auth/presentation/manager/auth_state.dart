part of 'auth_bloc.dart';

class AuthState {
  final OneIdModel? oneIdModel;
  final bool isLoginVerified;
  final bool isOneIdVerified;
  final bool isLoading;
  final bool hasError;
  final String errorMessage;

  AuthState({
    this.oneIdModel,
    this.isLoginVerified = false,
    this.isOneIdVerified = false,
    this.isLoading = false,
    this.hasError = false,
    this.errorMessage = 'Some Error',
  });

  AuthState copyWith({
    OneIdModel? oneIdModel,
    bool? isLoading,
    bool? isLoginVerified,
    bool? isOneIdVerified,
    bool? hasError,
    String? errorMessage,
  }) =>
      AuthState(
        oneIdModel: oneIdModel ?? this.oneIdModel,
        isLoginVerified: isLoginVerified ?? false,
        isOneIdVerified: isOneIdVerified ?? false,
        isLoading: isLoading ?? false,
        hasError: hasError ?? false,
        errorMessage: errorMessage ?? this.errorMessage,
      );
}
