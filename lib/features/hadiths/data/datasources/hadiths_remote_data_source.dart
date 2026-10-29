import 'package:dio/dio.dart';
import 'package:hadith_app/core/api_constants.dart';
import 'package:hadith_app/features/hadiths/data/models/hadiths.dart';

abstract class HadithsRemoteDataSource {
  Future<List<Hadiths>> getHadiths();
}

class HadithsRemoteDataSourceImpl implements HadithsRemoteDataSource {
  final Dio dio;
  HadithsRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<Hadiths>> getHadiths() async {
    final response = await dio.get(ApiConstants.hadiths);

    if (response.statusCode == 200) {
      return (response.data as List).map((e) => Hadiths.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load Books');
    }
  }
}
