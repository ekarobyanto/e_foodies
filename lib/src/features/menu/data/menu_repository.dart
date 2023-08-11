import 'package:dio/dio.dart';
import 'package:e_foodies/src/service/service.dart';

class MenuRepository {
  final api = APIService();
  final dio = Dio();

  Future allMenu(String token) async {
    return await api.call(
      request: () async {
        return await dio.getUri(
          api.buildUri(endpoints: '/recipe/'),
          options: Options(
            headers: {'Authorization': 'Bearer $token'},
          ),
        );
      },
      parse: (data) => data,
    );
  }
}
