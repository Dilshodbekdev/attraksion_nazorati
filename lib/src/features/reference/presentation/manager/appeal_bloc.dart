import 'dart:async';

import 'package:atraksion_nazorati/src/features/reference/data/model/attraction_model.dart';
import 'package:atraksion_nazorati/src/features/reference/domain/use_case/appeal_details_use_case.dart';
import 'package:atraksion_nazorati/src/features/reference/domain/use_case/attraction_list_use_case.dart';
import 'package:atraksion_nazorati/src/features/reference/domain/use_case/district_list_use_case.dart';
import 'package:atraksion_nazorati/src/features/reference/domain/use_case/park_list_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:atraksion_nazorati/src/core/resources/data_state.dart';
import 'package:atraksion_nazorati/src/features/reference/data/body/create_appeal_body.dart';
import 'package:atraksion_nazorati/src/features/reference/data/model/appeal_model.dart';
import 'package:atraksion_nazorati/src/features/reference/data/model/create_appeal_model.dart';
import 'package:atraksion_nazorati/src/features/reference/data/model/region_model.dart';
import 'package:atraksion_nazorati/src/features/reference/data/model/requirment_model.dart';
import 'package:atraksion_nazorati/src/features/reference/domain/use_case/appeal_list_use_case.dart';
import 'package:atraksion_nazorati/src/features/reference/domain/use_case/appeal_types_use_case.dart';
import 'package:atraksion_nazorati/src/features/reference/domain/use_case/create_appeal_use_case.dart';
import 'package:atraksion_nazorati/src/features/reference/domain/use_case/region_list_use_case.dart';
import 'package:atraksion_nazorati/src/features/reference/domain/use_case/requirment_list_use_case.dart';

part 'appeal_event.dart';

part 'appeal_state.dart';

class AppealBloc extends Bloc<AppealEvent, AppealState> {
  final RegionListUseCase _regionListUseCase;
  final DistrictListUseCase _districtListUseCase;
  final ParkListUseCase _parkListUseCase;
  final AttractionListUseCase _attractionListUseCase;
  final AppealListUseCase _appealListUseCase;
  final AppealTypesUseCase _appealTypesUseCase;
  final CreateAppealUseCase _createAppealUseCase;
  final AppealDetailsUseCase _appealDetailsUseCase;
  final RequirmentListUseCase _requirmentListUseCase;

  AppealBloc(
    this._regionListUseCase,
    this._createAppealUseCase,
    this._appealTypesUseCase,
    this._appealListUseCase,
    this._requirmentListUseCase,
    this._districtListUseCase,
    this._parkListUseCase,
    this._attractionListUseCase,
    this._appealDetailsUseCase,
  ) : super(AppealState()) {
    on<RegionsEvent>((event, emit) async {
      await emit.onEach(_onRegions(event), onData: emit.call);
    });

    on<DistrictsEvent>((event, emit) async {
      await emit.onEach(_onDistricts(event), onData: emit.call);
    });

    on<ParksEvent>((event, emit) async {
      await emit.onEach(_onParks(event), onData: emit.call);
    });

    on<AttractionsEvent>((event, emit) async {
      await emit.onEach(_onAttractions(event), onData: emit.call);
    });

    on<AppealListEvent>((event, emit) async {
      await emit.onEach(_onAppealList(event), onData: emit.call);
    });

    on<AppealTypesEvent>((event, emit) async {
      await emit.onEach(_onAppealTypes(event), onData: emit.call);
    });

    on<CreateAppealEvent>((event, emit) async {
      await emit.onEach(_onCreateAppeal(event), onData: emit.call);
    });

    on<AppealDetailsEvent>((event, emit) async {
      await emit.onEach(_onAppealDetails(event), onData: emit.call);
    });

    on<RequirmentsEvent>((event, emit) async {
      await emit.onEach(_onRequirments(event), onData: emit.call);
    });
  }

  regions() {
    add(RegionsEvent());
  }

  districts(int id) {
    add(DistrictsEvent(id: id));
  }

  parks(int id) {
    add(ParksEvent(id: id));
  }

  attractions(int id) {
    add(AttractionsEvent(id: id));
  }

  requirments() {
    add(RequirmentsEvent());
  }

  createAppeal(CreateAppealBody body) {
    add(CreateAppealEvent(body: body));
  }

  appealDetails(int id) {
    add(AppealDetailsEvent(id: id));
  }

  appealList() {
    add(AppealListEvent());
  }

  appealTypes() {
    add(AppealTypesEvent());
  }

  Stream<AppealState> _onRegions(RegionsEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _regionListUseCase.call(params: 1);

    if (dataState is DataSuccess) {
      yield state.copyWith(regions: dataState.data);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<AppealState> _onDistricts(DistrictsEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _districtListUseCase.call(params: event.id);

    if (dataState is DataSuccess) {
      yield state.copyWith(districts: dataState.data);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<AppealState> _onParks(ParksEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _parkListUseCase.call(params: event.id);

    if (dataState is DataSuccess) {
      yield state.copyWith(parks: dataState.data);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<AppealState> _onAttractions(AttractionsEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _attractionListUseCase.call(params: event.id);

    if (dataState is DataSuccess) {
      yield state.copyWith(attractions: dataState.data);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<AppealState> _onAppealList(AppealListEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _appealListUseCase.call(params: 1);

    if (dataState is DataSuccess) {
      yield state.copyWith(
          appealList: dataState.data, isGetMessageVerified: true);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<AppealState> _onRequirments(RequirmentsEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _requirmentListUseCase.call(params: 1);

    if (dataState is DataSuccess) {
      yield state.copyWith(
          requirments: dataState.data, isGetMessageVerified: true);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<AppealState> _onAppealTypes(AppealTypesEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _appealTypesUseCase.call(params: 1);

    if (dataState is DataSuccess) {
      yield state.copyWith(
        appealTypes: dataState.data,
      );
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<AppealState> _onCreateAppeal(CreateAppealEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _createAppealUseCase.call(params: event.body);

    if (dataState is DataSuccess) {
      yield state.copyWith(
          createAppealModel: dataState.data, isSendVerified: true);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<AppealState> _onAppealDetails(AppealDetailsEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _appealDetailsUseCase.call(params: event.id);

    if (dataState is DataSuccess) {
      yield state.copyWith(appealDetailsModel: dataState.data);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }
}
