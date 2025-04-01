import 'package:atraksion_nazorati/src/core/resources/base_repository.dart';
import 'package:atraksion_nazorati/src/core/resources/data_state.dart';
import 'package:atraksion_nazorati/src/features/auth/data/data_source/auth_api_service.dart';
import 'package:atraksion_nazorati/src/features/auth/data/models/one_id_model.dart';
import 'package:atraksion_nazorati/src/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl with BaseRepository implements AuthRepository {
  final AuthApiService _apiService;

  AuthRepositoryImpl(this._apiService);

  @override
  Future<DataState<OneIdModel>> oneId(String code) async =>
      await handleResponse(response: _apiService.oneId(code));
}
