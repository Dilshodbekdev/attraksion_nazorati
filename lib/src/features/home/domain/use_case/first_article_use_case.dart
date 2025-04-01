import 'package:atraksion_nazorati/src/core/resources/data_state.dart';
import 'package:atraksion_nazorati/src/core/usecase/use_case.dart';
import 'package:atraksion_nazorati/src/features/home/data/models/news_model.dart';
import 'package:atraksion_nazorati/src/features/home/domain/repository/home_repository.dart';

class FirstArticleUseCase implements UseCase<DataState<NewModel>, int> {
  final HomeRepository _repository;

  FirstArticleUseCase(this._repository);

  @override
  Future<DataState<NewModel>> call({required int params}) async =>
      await _repository.firstArticle();
}
