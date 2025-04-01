import 'package:atraksion_nazorati/src/features/home/domain/use_case/about_use_case.dart';
import 'package:atraksion_nazorati/src/features/home/domain/use_case/central_membership_use_case.dart';
import 'package:atraksion_nazorati/src/features/home/domain/use_case/regional_membership_use_case.dart';
import 'package:atraksion_nazorati/src/features/reference/domain/use_case/appeal_details_use_case.dart';
import 'package:atraksion_nazorati/src/features/reference/domain/use_case/attraction_list_use_case.dart';
import 'package:atraksion_nazorati/src/features/reference/domain/use_case/district_list_use_case.dart';
import 'package:atraksion_nazorati/src/features/reference/domain/use_case/park_list_use_case.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:atraksion_nazorati/src/core/app_state/cubit/app_cubit.dart';
import 'package:atraksion_nazorati/src/core/network/api_interceptor.dart';
import 'package:atraksion_nazorati/src/features/auth/data/data_source/auth_api_service.dart';
import 'package:atraksion_nazorati/src/features/auth/data/repository/auth_repository_impl.dart';
import 'package:atraksion_nazorati/src/features/auth/domain/repository/auth_repository.dart';
import 'package:atraksion_nazorati/src/features/auth/domain/use_case/one_id_use_case.dart';
import 'package:atraksion_nazorati/src/features/auth/presentation/manager/auth_bloc.dart';
import 'package:atraksion_nazorati/src/features/home/data/data_source/home_api_service.dart';
import 'package:atraksion_nazorati/src/features/home/data/repository/home_repository_impl.dart';
import 'package:atraksion_nazorati/src/features/home/domain/repository/home_repository.dart';
import 'package:atraksion_nazorati/src/features/home/domain/use_case/faq_use_case.dart';
import 'package:atraksion_nazorati/src/features/home/domain/use_case/create_questionnaire_use_case.dart';
import 'package:atraksion_nazorati/src/features/home/domain/use_case/first_article_use_case.dart';
import 'package:atraksion_nazorati/src/features/home/domain/use_case/leadership_use_case.dart';
import 'package:atraksion_nazorati/src/features/home/domain/use_case/news_use_case.dart';
import 'package:atraksion_nazorati/src/features/home/domain/use_case/notifications_use_case.dart';
import 'package:atraksion_nazorati/src/features/home/domain/use_case/questionnaire_use_case.dart';
import 'package:atraksion_nazorati/src/features/home/domain/use_case/statistic_use_case.dart';
import 'package:atraksion_nazorati/src/features/home/domain/use_case/update_notify_use_case.dart';
import 'package:atraksion_nazorati/src/features/home/presentation/manager/home_bloc.dart';
import 'package:atraksion_nazorati/src/features/reference/data/data_source/appeal_api_service.dart';
import 'package:atraksion_nazorati/src/features/reference/data/repository/appeal_repository_impl.dart';
import 'package:atraksion_nazorati/src/features/reference/domain/repository/appeal_repository.dart';
import 'package:atraksion_nazorati/src/features/reference/domain/use_case/appeal_list_use_case.dart';
import 'package:atraksion_nazorati/src/features/reference/domain/use_case/appeal_types_use_case.dart';
import 'package:atraksion_nazorati/src/features/reference/domain/use_case/requirment_list_use_case.dart';
import 'package:atraksion_nazorati/src/features/reference/domain/use_case/create_appeal_use_case.dart';
import 'package:atraksion_nazorati/src/features/reference/domain/use_case/region_list_use_case.dart';
import 'package:atraksion_nazorati/src/features/reference/presentation/manager/appeal_bloc.dart';

final GetIt locator = GetIt.instance;

Future<void> initializeDependencies() async {
  Dio dio = Dio(
    BaseOptions(
      baseUrl: "https://att.technocorp.uz/",
      contentType: "application/json",
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 60 * 1000),
      receiveTimeout: const Duration(seconds: 60 * 1000),
      listFormat: ListFormat.multiCompatible,
    ),
  );

  dio.interceptors.add(ApiInterceptor());
  locator.registerSingleton<Dio>(dio);

  locator.registerFactory(() => AppCubit());

  // Services
  locator.registerSingleton(AuthApiService(locator()));
  locator.registerSingleton(HomeApiService(locator()));
  locator.registerSingleton(AppealApiService(locator()));

  // Repositories
  locator.registerSingleton<AuthRepository>(AuthRepositoryImpl(locator()));
  locator.registerSingleton<HomeRepository>(HomeRepositoryImpl(locator()));
  locator.registerSingleton<AppealRepository>(AppealRepositoryImpl(locator()));

  // Auth UseCases
  locator.registerSingleton(OneIdUseCase(locator()));

  // Home UseCases
  locator.registerSingleton(FaqUseCase(locator()));
  locator.registerSingleton(LeadershipUseCase(locator()));
  locator.registerSingleton(RegionalMembershipUseCase(locator()));
  locator.registerSingleton(NewsUseCase(locator()));
  locator.registerSingleton(StatisticUseCase(locator()));
  locator.registerSingleton(CentralMembershipUseCase(locator()));
  locator.registerSingleton(FirstArticleUseCase(locator()));
  locator.registerSingleton(QuestionnaireUseCase(locator()));
  locator.registerSingleton(CreateQuestionnaireUseCase(locator()));
  locator.registerSingleton(NotificationsUseCase(locator()));
  locator.registerSingleton(UpdateNotifyUseCase(locator()));
  locator.registerSingleton(AboutUseCase(locator()));

  // Reference UseCase
  locator.registerSingleton(RegionListUseCase(locator()));
  locator.registerSingleton(DistrictListUseCase(locator()));
  locator.registerSingleton(ParkListUseCase(locator()));
  locator.registerSingleton(AttractionListUseCase(locator()));
  locator.registerSingleton(AppealListUseCase(locator()));
  locator.registerSingleton(AppealTypesUseCase(locator()));
  locator.registerSingleton(CreateAppealUseCase(locator()));
  locator.registerSingleton(AppealDetailsUseCase(locator()));
  locator.registerSingleton(RequirmentListUseCase(locator()));

  // Profile UseCase

  // Blocs
  locator.registerFactory<AuthBloc>(
    () => AuthBloc(
      locator(),
    ),
  );

  locator.registerFactory<HomeBloc>(() => HomeBloc(
        locator(),
        locator(),
        locator(),
        locator(),
        locator(),
        locator(),
        locator(),
        locator(),
        locator(),
        locator(),
        locator(),
        locator(),
      ));

  locator.registerFactory<AppealBloc>(
    () => AppealBloc(
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
    ),
  );
}
