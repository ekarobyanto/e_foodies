import 'package:dio/dio.dart';
import 'package:e_foodies/src/features/dashboard/domain/dashboard.dart';
import 'package:e_foodies/src/service/service.dart';

import '../../../core/domain/failure.dart';

class DashboardRepository {
  APIService api = APIService();
  Dio dio = Dio();

  Future<Dashboard> fetchDashboard(String token) async {
    try {
      return api.call(
        request: () async {
          return await dio.getUri(
            api.buildUri(endpoints: '/dashboard/'),
            options: Options(
              headers: {'Authorization': 'Bearer $token'},
            ),
          );
        },
        parse: (data) => Dashboard.fromJson(data),
      );
    } on Failure catch (e) {
      throw Failure(message: e.message, code: 0);
    }
  }
}
