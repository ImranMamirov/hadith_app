import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hadith_app/features/chapters/domain/models/chapters.dart';

class ChapterCard extends StatelessWidget {
  final List<Chapters> chapter;
  const ChapterCard({super.key, required this.chapter});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: chapter.length,
      itemBuilder: (context, index) {
        final item = chapter[index];
        return Card(
          margin: EdgeInsets.all(12),
          child: Column(
            children: [
              Text('${item.titleEn}')
            ],
          ),
        );
      },
    );
  }
}