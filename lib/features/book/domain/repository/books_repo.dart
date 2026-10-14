import 'package:hadith_app/features/book/domain/models/books.dart';

abstract class BooksRepo {
  Future<List<Books>> getBooks();
}
