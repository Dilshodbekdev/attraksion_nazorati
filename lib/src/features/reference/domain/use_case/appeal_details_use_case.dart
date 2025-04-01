import 'package:atraksion_nazorati/src/core/resources/data_state.dart';
import 'package:atraksion_nazorati/src/core/usecase/use_case.dart';
import 'package:atraksion_nazorati/src/features/reference/data/model/create_appeal_model.dart';
import 'package:atraksion_nazorati/src/features/reference/domain/repository/appeal_repository.dart';

class AppealDetailsUseCase
    implements UseCase<DataState<CreateAppealModel>, int> {
  final AppealRepository _repository;

  AppealDetailsUseCase(this._repository);

  @override
  Future<DataState<CreateAppealModel>> call({required int params}) async =>
      await _repository.appealDetails(params);
}
