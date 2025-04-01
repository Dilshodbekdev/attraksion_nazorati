import 'package:atraksion_nazorati/src/core/resources/data_state.dart';
import 'package:atraksion_nazorati/src/features/reference/data/body/create_appeal_body.dart';
import 'package:atraksion_nazorati/src/features/reference/data/model/appeal_model.dart';
import 'package:atraksion_nazorati/src/features/reference/data/model/attraction_model.dart';
import 'package:atraksion_nazorati/src/features/reference/data/model/create_appeal_model.dart';
import 'package:atraksion_nazorati/src/features/reference/data/model/region_model.dart';
import 'package:atraksion_nazorati/src/features/reference/data/model/requirment_model.dart';

abstract class AppealRepository {
  Future<DataState<List<RegionModel>>> regions();

  Future<DataState<List<RegionModel>>> districts(int id);

  Future<DataState<List<RegionModel>>> parks(int id);

  Future<DataState<List<AttractionModel>>> attractions(int id);

  Future<DataState<List<RequirmentModel>>> requirments();

  Future<DataState<CreateAppealModel>> createAppeal(CreateAppealBody body);

  Future<DataState<CreateAppealModel>> appealDetails(int id);

  Future<DataState<List<AppealModel>>> appealList();

  Future<DataState<List<RegionModel>>> appealTypes();
}
