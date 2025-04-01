import 'package:atraksion_nazorati/src/core/resources/data_state.dart';
import 'package:atraksion_nazorati/src/core/usecase/use_case.dart';
import 'package:atraksion_nazorati/src/features/home/data/body/articles_body.dart';
import 'package:atraksion_nazorati/src/features/home/data/models/news_model.dart';
import 'package:atraksion_nazorati/src/features/home/domain/repository/home_repository.dart';

class NewsUseCase implements UseCase<DataState<NewsModel>, ArticlesBody> {
  final HomeRepository _repository;

  NewsUseCase(this._repository);

  @override
  Future<DataState<NewsModel>> call({required ArticlesBody params}) async =>
      await _repository.news(params.page ?? 0, params.pageSize ?? 10);
}
