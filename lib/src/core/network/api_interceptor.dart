import 'package:atraksion_nazorati/src/core/router/app_routes.dart';
import 'package:atraksion_nazorati/src/core/router/route_config.dart';
import 'package:atraksion_nazorati/src/core/services/services.dart';
import 'package:atraksion_nazorati/src/core/util/app_constants.dart';
import 'package:go_router/go_router.dart';
import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    String token = await Prefs.getString(AppConstants.kAccessToken) ?? "";
    String language = await Prefs.getString(AppConstants.kLanguage) ?? "";
    if (token.isNotEmpty) {
      options.headers["Authorization"] = 'Bearer $token';
    }
    options.headers["Accept-Language"]=language;

    LogService.request(options);
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    LogService.response(response);
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      rootNavigator.currentContext?.goNamed(AppRoutes.oneId.name);
    }
    LogService.errorResponse(err);
    super.onError(err, handler);
  }
}
