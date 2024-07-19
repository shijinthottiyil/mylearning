import 'package:dio/dio.dart';
import 'package:mylearning/utils/logic/networking/constants/app_url.dart';
import 'package:mylearning/utils/logic/networking/logger.dart';

class AppRepository {
  // Normal Dio Instance.
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: AppUrl.kBaseUrl,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
      responseType: ResponseType.json,
      contentType: "application/json",
    ),
  );

  static Future<Response> get() async {
    final Response response = await _dio.get(AppUrl.kUsers);
    logger.i(response.data, error: 'AppRepository get response');
    return response;
  }
}
