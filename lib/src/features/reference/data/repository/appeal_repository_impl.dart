import 'package:atraksion_nazorati/src/core/resources/base_repository.dart';
import 'package:atraksion_nazorati/src/core/resources/data_state.dart';
import 'package:atraksion_nazorati/src/features/reference/data/body/create_appeal_body.dart';
import 'package:atraksion_nazorati/src/features/reference/data/data_source/appeal_api_service.dart';
import 'package:atraksion_nazorati/src/features/reference/data/model/appeal_model.dart';
import 'package:atraksion_nazorati/src/features/reference/data/model/attraction_model.dart';
import 'package:atraksion_nazorati/src/features/reference/data/model/create_appeal_model.dart';
import 'package:atraksion_nazorati/src/features/reference/data/model/region_model.dart';
import 'package:atraksion_nazorati/src/features/reference/data/model/requirment_model.dart';
import 'package:atraksion_nazorati/src/features/reference/domain/repository/appeal_repository.dart';

class AppealRepositoryImpl with BaseRepository implements AppealRepository {
  final AppealApiService _apiService;

  AppealRepositoryImpl(this._apiService);

  @override
  Future<DataState<List<RegionModel>>> regions() async =>
      await handleResponse(response: _apiService.regionList());

  @override
  Future<DataState<List<RegionModel>>> districts(int id) async =>
      await handleResponse(response: _apiService.districtList(id));

  @override
  Future<DataState<List<RegionModel>>> parks(int id) async =>
      await handleResponse(response: _apiService.parkList(id));

  @override
  Future<DataState<List<AttractionModel>>> attractions(int id) async =>
      await handleResponse(response: _apiService.attractionList(id));

  @override
  Future<DataState<CreateAppealModel>> createAppeal(
          CreateAppealBody body) async =>
      await handleResponse(
          response: _apiService.createAppeal(
        body.regionId,
        body.districtId,
        body.parkId,
        body.attractionId,
        body.description,
        body.offenseTypesIds,
        body.images,
        body.docs,
      ));

  @override
  Future<DataState<CreateAppealModel>> appealDetails(int id) async =>
      await handleResponse(response: _apiService.appealDetails(id));

  @override
  Future<DataState<List<AppealModel>>> appealList() async =>
      await handleResponse(response: _apiService.appealList());

  @override
  Future<DataState<List<RegionModel>>> appealTypes() async =>
      await handleResponse(response: _apiService.appealTypes());

  @override
  Future<DataState<List<RequirmentModel>>> requirments() async =>
      await handleResponse(response: _apiService.requirments());
}
