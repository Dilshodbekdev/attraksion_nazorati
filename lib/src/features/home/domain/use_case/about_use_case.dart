import 'package:atraksion_nazorati/src/core/resources/data_state.dart';
import 'package:atraksion_nazorati/src/core/usecase/use_case.dart';
import 'package:atraksion_nazorati/src/features/home/data/models/about_model.dart';

import 'package:atraksion_nazorati/src/features/home/domain/repository/home_repository.dart';

class AboutUseCase implements UseCase<DataState<AboutModel>, int> {
  final HomeRepository _repository;

  AboutUseCase(this._repository);

  @override
  Future<DataState<AboutModel>> call({required int params}) async =>
      await _repository.about();
}
