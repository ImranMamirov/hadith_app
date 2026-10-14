import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hadith_app/features/book/domain/models/books.dart';

class BookCard extends StatelessWidget {
  final List<Books> books;
  const BookCard({super.key, required this.books});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: books.length,
      itemBuilder: (context, index) {
        final item = books[index];
        return Card(
          margin: EdgeInsets.all(12),
          child: Column(children: [Text('${item.titleEn}')]),
        );
      },
    );
  }
}
