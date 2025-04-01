import 'package:atraksion_nazorati/src/core/resources/data_state.dart';
import 'package:atraksion_nazorati/src/core/usecase/use_case.dart';
import 'package:atraksion_nazorati/src/features/reference/data/body/create_appeal_body.dart';
import 'package:atraksion_nazorati/src/features/reference/data/model/create_appeal_model.dart';
import 'package:atraksion_nazorati/src/features/reference/domain/repository/appeal_repository.dart';

class CreateAppealUseCase implements UseCase<DataState<CreateAppealModel>, CreateAppealBody> {
  final AppealRepository _repository;

  CreateAppealUseCase(this._repository);

  @override
  Future<DataState<CreateAppealModel>> call({required CreateAppealBody params}) async =>
      await _repository.createAppeal(params);
}
