import 'package:dio/dio.dart';
import 'package:hadith_app/core/api_constants.dart';
import 'package:hadith_app/features/chapters/data/models/chapters.dart';

abstract class ChaptersRemoteDataSource {
  Future<List<Chapters>> getChapters();
}

class ChaptersRemoteDataSourceImpl implements ChaptersRemoteDataSource {
  final Dio dio;
  ChaptersRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<Chapters>> getChapters() async {
    final response = await dio.get(
      ApiConstants.chapters
    );

    if (response.statusCode == 200) {
      return (response.data as List).map((e) => Chapters.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load Chapters');
    }
  }
}