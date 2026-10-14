part of 'books_cubit.dart';

sealed class BooksState extends Equatable {
  const BooksState();

  @override
  List<Object> get props => [];
}

final class BooksInitial extends BooksState {}

final class BooksLoading extends BooksState {}

final class BooksLoaded extends BooksState {
  final List<Books> books;
  const BooksLoaded({required this.books});

  @override
  List<Object> get props => [books];
}

final class BooksError extends BooksState {
  final String message;
  const BooksError({required this.message});

  @override
  List<Object> get props => [message];
}
