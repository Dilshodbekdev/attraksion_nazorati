import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:atraksion_nazorati/src/core/resources/data_state.dart';
import 'package:atraksion_nazorati/src/core/services/services.dart';
import 'package:atraksion_nazorati/src/core/util/app_constants.dart';
import 'package:atraksion_nazorati/src/features/auth/data/models/one_id_model.dart';
import 'package:atraksion_nazorati/src/features/auth/domain/use_case/one_id_use_case.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final OneIdUseCase _oneIdUseCase;

  AuthBloc(
    this._oneIdUseCase,
  ) : super(AuthState()) {

    on<OneIdEvent>((event, emit) async {
      await emit.onEach(_onOneId(event), onData: emit.call);
    });
  }

  oneId({required String body}) {
    add(OneIdEvent(body: body));
  }

  Stream<AuthState> _onOneId(OneIdEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _oneIdUseCase.call(params: event.body);

    if (dataState is DataSuccess) {
      yield state.copyWith(oneIdModel: dataState.data, isOneIdVerified: true);
      Prefs.setString(AppConstants.kAccessToken, dataState.data?.token?.accessToken??'');
      Prefs.setString(AppConstants.kRefreshToken, dataState.data?.token?.refreshToken??'');
      Prefs.setString(AppConstants.kUser, "${dataState.data?.data?.lastName} ${dataState.data?.data?.firstName} ${dataState.data?.data?.fatherName}");
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }
}
