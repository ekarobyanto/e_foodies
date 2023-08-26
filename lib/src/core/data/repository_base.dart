import 'package:dio/dio.dart';
import 'package:e_foodies/src/service/service.dart';

class RepositoryBase {
  Dio dio = Dio();
  final service = APIService();
}
