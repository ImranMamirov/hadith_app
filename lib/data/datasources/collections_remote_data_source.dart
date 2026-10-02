import 'package:dio/dio.dart';
import 'package:hadith_app/core/api_constants.dart';
import 'package:hadith_app/data/models/collections/collections.dart';

abstract class CollectionsRemoteDataSource {
  Future<List<Collections>> getCollections();
}

class CollectionsRemoteDataSourceImpl implements CollectionsRemoteDataSource {
  final Dio dio;

  const CollectionsRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<Collections>> getCollections() async {
    final response = await dio.get(
      ApiConstants.baseUrl,
      queryParameters: {'apiKey': ApiConstants.apiKey}
    );

    if (response.statusCode == 200) {
      return (response.data as List).map((e) => Collections.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load Collections');
    }
  }
}