import 'package:flutter/material.dart';
import 'package:hadith_app/features/collections/domain/models/collections.dart';

class CollectionsCard extends StatelessWidget {
  final List<Collections> collections;
  final VoidCallback onTap;
  const CollectionsCard({
    super.key,
    required this.collections,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: collections.length,
      itemBuilder: (context, index) {
        final item = collections[index];
        return InkWell(
          onTap: onTap,
          child: Card(
            margin: EdgeInsets.all(12),
            child: Column(
              children: [Text(item.authorAr), Text('${item.hadithCount}')],
            ),
          ),
        );
      },
    );
  }
}
