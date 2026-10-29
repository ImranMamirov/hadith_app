import 'package:flutter/material.dart';
import 'package:hadith_app/features/book/domain/models/books.dart';
import 'package:hadith_app/features/hadiths/domain/models/hadiths.dart';

class HadithCard extends StatelessWidget {
  final List<Hadiths> hadith;
  final VoidCallback onTap;
  const HadithCard({super.key, required this.hadith, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: hadith.length,
      itemBuilder: (context, index) {
        final item = hadith[index];
        return InkWell(
          onTap: onTap,
          child: Card(
            margin: EdgeInsets.all(12),
            child: Column(children: [Text('${item.arabic}')]),
          ),
        );
      },
    );
  }
}
