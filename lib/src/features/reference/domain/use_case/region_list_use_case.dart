import 'package:atraksion_nazorati/src/core/resources/data_state.dart';
import 'package:atraksion_nazorati/src/core/usecase/use_case.dart';
import 'package:atraksion_nazorati/src/features/reference/data/model/region_model.dart';
import 'package:atraksion_nazorati/src/features/reference/domain/repository/appeal_repository.dart';

class RegionListUseCase implements UseCase<DataState<List<RegionModel>>, int> {
  final AppealRepository _repository;

  RegionListUseCase(this._repository);

  @override
  Future<DataState<List<RegionModel>>> call({required int params}) async =>
      await _repository.regions();
}
