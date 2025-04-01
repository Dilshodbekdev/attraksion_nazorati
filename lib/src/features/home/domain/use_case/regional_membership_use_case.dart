import 'package:atraksion_nazorati/src/core/resources/data_state.dart';
import 'package:atraksion_nazorati/src/core/usecase/use_case.dart';
import 'package:atraksion_nazorati/src/features/home/data/models/leadership_model.dart';
import 'package:atraksion_nazorati/src/features/home/domain/repository/home_repository.dart';

class RegionalMembershipUseCase
    implements UseCase<DataState<List<LeadershipModel>>, int> {
  final HomeRepository _repository;

  RegionalMembershipUseCase(this._repository);

  @override
  Future<DataState<List<LeadershipModel>>> call({required int params}) async =>
      await _repository.regionalMembership();
}
