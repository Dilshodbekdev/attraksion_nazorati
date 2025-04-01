import 'package:atraksion_nazorati/src/core/resources/data_state.dart';
import 'package:atraksion_nazorati/src/core/usecase/use_case.dart';
import 'package:atraksion_nazorati/src/features/reference/data/model/attraction_model.dart';
import 'package:atraksion_nazorati/src/features/reference/data/model/region_model.dart';
import 'package:atraksion_nazorati/src/features/reference/domain/repository/appeal_repository.dart';

class AttractionListUseCase implements UseCase<DataState<List<AttractionModel>>, int> {
  final AppealRepository _repository;

  AttractionListUseCase(this._repository);

  @override
  Future<DataState<List<AttractionModel>>> call({required int params}) async =>
      await _repository.attractions(params);
}
