import 'package:flutter/material.dart';
import 'package:hadith_app/features/book/domain/models/books.dart';

class BookCard extends StatelessWidget {
  final List<Books> books;
  final VoidCallback onTap;
  const BookCard({super.key, required this.books, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: books.length,
      itemBuilder: (context, index) {
        final item = books[index];
        return InkWell(
          onTap: onTap,
          child: Card(
            margin: EdgeInsets.all(12),
            child: Column(children: [Text('${item.titleEn}')]),
          ),
        );
      },
    );
  }
}
