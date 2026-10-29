import 'package:flutter/material.dart';
import 'package:hadith_app/features/chapters/domain/models/chapters.dart';

class ChapterCard extends StatelessWidget {
  final List<Chapters> chapter;
  final VoidCallback onTap;
  const ChapterCard({super.key, required this.chapter, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: chapter.length,
      itemBuilder: (context, index) {
        final item = chapter[index];
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
