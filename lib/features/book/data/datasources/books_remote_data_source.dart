import 'package:dio/dio.dart';
import 'package:hadith_app/core/api_constants.dart';
import 'package:hadith_app/features/book/data/models/books.dart';

abstract class BooksRemoteDataSource {
  Future<List<Books>> getBooks();
}

class BooksRemoteDataSourceImpl implements BooksRemoteDataSource {
  final Dio dio;
  BooksRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<Books>> getBooks() async {
    final response = await dio.get(ApiConstants.books);

    if (response.statusCode == 200) {
      return (response.data as List).map((e) => Books.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load Books');
    }
  }
}
