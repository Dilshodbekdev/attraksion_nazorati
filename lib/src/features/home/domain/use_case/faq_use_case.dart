import 'package:atraksion_nazorati/src/core/resources/data_state.dart';
import 'package:atraksion_nazorati/src/core/usecase/use_case.dart';
import 'package:atraksion_nazorati/src/features/home/data/models/faq_model.dart';

import 'package:atraksion_nazorati/src/features/home/domain/repository/home_repository.dart';

class FaqUseCase implements UseCase<DataState<List<FaqModel>>, int> {
  final HomeRepository _repository;

  FaqUseCase(this._repository);

  @override
  Future<DataState<List<FaqModel>>> call({required int params}) async =>
      await _repository.faq();
}
