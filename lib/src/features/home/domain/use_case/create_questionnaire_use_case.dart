import 'package:atraksion_nazorati/src/core/resources/data_state.dart';
import 'package:atraksion_nazorati/src/core/usecase/use_case.dart';
import 'package:atraksion_nazorati/src/features/home/data/body/voting_body.dart';
import 'package:atraksion_nazorati/src/features/home/data/models/questionnaire_model.dart';
import 'package:atraksion_nazorati/src/features/home/domain/repository/home_repository.dart';

class CreateQuestionnaireUseCase
    implements UseCase<DataState<QuestionnaireModel>, VotingBody> {
  final HomeRepository _repository;

  CreateQuestionnaireUseCase(this._repository);

  @override
  Future<DataState<QuestionnaireModel>> call(
          {required VotingBody params}) async =>
      await _repository.createQuestionnaire(params);
}
