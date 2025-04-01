import 'package:atraksion_nazorati/src/core/resources/data_state.dart';
import 'package:atraksion_nazorati/src/core/usecase/use_case.dart';
import 'package:atraksion_nazorati/src/features/home/data/models/statistic_model.dart';
import 'package:atraksion_nazorati/src/features/home/domain/repository/home_repository.dart';

class StatisticUseCase implements UseCase<DataState<StatisticModel>, int> {
  final HomeRepository _repository;

  StatisticUseCase(this._repository);

  @override
  Future<DataState<StatisticModel>> call({required int params}) async =>
      await _repository.statistic();
}
