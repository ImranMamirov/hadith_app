import 'package:hadith_app/features/book/data/datasources/books_remote_data_source.dart';
import 'package:hadith_app/features/book/domain/models/books.dart';
import 'package:hadith_app/features/book/domain/repository/books_repo.dart';

class BooksRepositoryImpl implements BooksRepo {
  final BooksRemoteDataSource remoteDataSource;
  BooksRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Books>> getBooks() async {
    final response = await remoteDataSource.getBooks();
    return response
        .map(
          (e) => Books(
            id: e.id ?? 0,
            collectionId: e.collectionId ?? 0,
            bookNumber: e.bookNumber ?? 0,
            titleEn: e.titleEn ?? '',
            titleAr: e.titleAr ?? '',
            hadithCount: e.hadithCount ?? 0,
          ),
        )
        .toList();
  }
}
