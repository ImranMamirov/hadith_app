import 'package:equatable/equatable.dart';

class Books extends Equatable {
  final int? id;
  final int? collectionId;
  final int? bookNumber;
  final String? titleEn;
  final String? titleAr;
  final int? hadithCount;

  const Books({
    this.id,
    this.collectionId,
    this.bookNumber,
    this.titleEn,
    this.titleAr,
    this.hadithCount,
  });

  @override
  List<Object?> get props => [
    id,
    collectionId,
    bookNumber,
    titleEn,
    titleEn,
    hadithCount,
  ];
}
