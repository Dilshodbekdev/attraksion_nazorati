import 'package:atraksion_nazorati/src/core/resources/data_state.dart';
import 'package:atraksion_nazorati/src/core/usecase/use_case.dart';
import 'package:atraksion_nazorati/src/features/reference/data/model/requirment_model.dart';
import 'package:atraksion_nazorati/src/features/reference/domain/repository/appeal_repository.dart';

class RequirmentListUseCase implements UseCase<DataState<List<RequirmentModel>>, int> {
  final AppealRepository _repository;

  RequirmentListUseCase(this._repository);

  @override
  Future<DataState<List<RequirmentModel>>> call({required int params}) async =>
      await _repository.requirments();
}
