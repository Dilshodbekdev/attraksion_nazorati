import 'package:atraksion_nazorati/src/core/resources/data_state.dart';
import 'package:atraksion_nazorati/src/core/usecase/use_case.dart';
import 'package:atraksion_nazorati/src/features/home/data/models/questionnaire_model.dart';
import 'package:atraksion_nazorati/src/features/home/domain/repository/home_repository.dart';

class QuestionnaireUseCase
    implements UseCase<DataState<List<QuestionnaireModel>>, int> {
  final HomeRepository _repository;

  QuestionnaireUseCase(this._repository);

  @override
  Future<DataState<List<QuestionnaireModel>>> call({required int params}) async =>
      await _repository.questionnaire();
}
