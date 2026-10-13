import 'package:equatable/equatable.dart';

class Collections extends Equatable {
  final int id;
  final String titleEn;
  final String titleAr;
  final String authorEn;
  final String authorAr;
  final int hadithCount;

  const Collections({
    required this.id,
    required this.titleEn,
    required this.titleAr,
    required this.authorEn,
    required this.authorAr,
    required this.hadithCount,
  });

  @override
  List<Object?> get props => [
    id,
    titleEn,
    titleAr,
    authorEn,
    authorAr,
    hadithCount,
  ];
}
