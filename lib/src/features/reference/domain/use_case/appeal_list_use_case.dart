import 'package:atraksion_nazorati/src/core/resources/data_state.dart';
import 'package:atraksion_nazorati/src/core/usecase/use_case.dart';
import 'package:atraksion_nazorati/src/features/reference/data/model/appeal_model.dart';
import 'package:atraksion_nazorati/src/features/reference/domain/repository/appeal_repository.dart';

class AppealListUseCase implements UseCase<DataState<List<AppealModel>>, int> {
  final AppealRepository _repository;

  AppealListUseCase(this._repository);

  @override
  Future<DataState<List<AppealModel>>> call({required int params}) async =>
      await _repository.appealList();
}
