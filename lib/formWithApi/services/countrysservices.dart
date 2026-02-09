import 'package:StoreLink/formWithApi/services/countrys.dart';
import 'package:dio/dio.dart';

class Countrysservices {
  final Dio dio = Dio();

  Future<List<Countrys>> getcountrys() async {
    try {
      final response = await dio.get(
        'https://gist.github.com/devhammed/78cfbee0c36dfdaa4fce7e79c0d39208#file-countries-json',
      );
      return (response.data as List).map((e) => Countrys.fromJson(e)).toList();
    } on DioException catch (e) {
      throw Exception('API Error: ${e.response?.statusCode}');
    }
  }
}
