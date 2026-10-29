import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hadith_app/core/app_router.dart';
import 'package:hadith_app/features/book/presentation/cubit/books_cubit.dart';
import 'package:hadith_app/features/book/presentation/widgets/book_card.dart';

class BooksPage extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Books')),
      body: BlocBuilder<BooksCubit, BooksState>(
        builder: (context, state) {
          if (state is BooksLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is BooksLoaded) {
            return BookCard(
              books: state.books,
              onTap: () => context.push(AppRouter.chapters),
            );
          } else if (state is BooksError) {
            return Text(state.message);
          }
          return Text('Failed to load Books');
        },
      ),
    );
  }
}
