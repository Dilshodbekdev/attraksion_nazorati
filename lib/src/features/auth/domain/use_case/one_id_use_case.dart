
import 'package:atraksion_nazorati/src/core/resources/data_state.dart';
import 'package:atraksion_nazorati/src/core/usecase/use_case.dart';
import 'package:atraksion_nazorati/src/features/auth/data/models/one_id_model.dart';
import 'package:atraksion_nazorati/src/features/auth/domain/repository/auth_repository.dart';

class OneIdUseCase implements UseCase<DataState<OneIdModel>, String> {
  final AuthRepository _repository;

  OneIdUseCase(this._repository);

  @override
  Future<DataState<OneIdModel>> call({required String params}) async => await _repository.oneId(params);
}
