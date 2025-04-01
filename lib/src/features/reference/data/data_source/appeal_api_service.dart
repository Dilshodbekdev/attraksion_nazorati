import 'dart:async';
import 'dart:io';

import 'package:atraksion_nazorati/src/features/reference/data/model/attraction_model.dart';
import 'package:dio/dio.dart';
import 'package:atraksion_nazorati/src/features/reference/data/model/appeal_model.dart';
import 'package:atraksion_nazorati/src/features/reference/data/model/appeal_type_model.dart';
import 'package:atraksion_nazorati/src/features/reference/data/model/create_appeal_model.dart';
import 'package:atraksion_nazorati/src/features/reference/data/model/region_model.dart';
import 'package:atraksion_nazorati/src/features/reference/data/model/requirment_model.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'appeal_api_service.g.dart';

@RestApi()
abstract class AppealApiService {
  factory AppealApiService(Dio dio, {String baseUrl}) = _AppealApiService;

  /// URLS

  static const String _createAppeal = 'api/appeal/create/';
  static const String _appealList = 'api/appeal/';
  static const String _appealDetails = 'api/appeal/{id}';
  static const String _regionList = 'api/appeal/region-list/';
  static const String _districtList = 'api/appeal/district-list/{id}/';
  static const String _parkList = 'api/appeal/park-list/{id}/';
  static const String _attractionList = 'api/appeal/attraction-list/{id}/';
  static const String _requirments = 'api/requirments';
  static const String _appealTypes = 'api/appeal/offense-types-list/';

  @GET(_regionList)
  Future<HttpResponse<List<RegionModel>>> regionList();

  @GET(_districtList)
  Future<HttpResponse<List<RegionModel>>> districtList(@Path('id') int id);

  @GET(_parkList)
  Future<HttpResponse<List<RegionModel>>> parkList(@Path('id') int id);

  @GET(_attractionList)
  Future<HttpResponse<List<AttractionModel>>> attractionList(@Path('id') int id);

  @GET(_requirments)
  Future<HttpResponse<List<RequirmentModel>>> requirments();

  @POST(_createAppeal)
  @MultiPart()
  Future<HttpResponse<CreateAppealModel>> createAppeal(
    @Part() int? region_id,
    @Part() int? district_id,
    @Part() int? park_id,
    @Part() int? attraction_id,
    @Part() String? description,
    @Part() List<String>? offense_types_ids,
    @Part() List<File>? images,
    @Part() List<File>? files,
  );

  @GET(_appealList)
  Future<HttpResponse<List<AppealModel>>> appealList();

  @GET(_appealDetails)
  Future<HttpResponse<CreateAppealModel>> appealDetails(@Path('id') int id);

  @GET(_appealTypes)
  Future<HttpResponse<List<RegionModel>>> appealTypes();
}
