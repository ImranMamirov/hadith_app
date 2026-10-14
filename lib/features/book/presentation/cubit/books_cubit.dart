import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hadith_app/features/book/domain/models/books.dart';
import 'package:hadith_app/features/book/domain/repository/books_repo.dart';

part 'books_state.dart';

class BooksCubit extends Cubit<BooksState> {
  final BooksRepo repo;
  BooksCubit({required this.repo}) : super(BooksInitial());

  Future<void> fetchBooks() async {
    emit(BooksLoading());
    try {
      final result = await repo.getBooks();
      emit(BooksLoaded(books: result));
    } catch (e) {
      emit(BooksError(message: e.toString()));
    }
  }
}
