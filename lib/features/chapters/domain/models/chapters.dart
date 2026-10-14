import 'package:equatable/equatable.dart';

class Chapters extends Equatable {
  final int? id;
  final int? collectionId;
  final int? bookId;
  final int? sectionIndex;
  final String? sectionType;
  final String? chapterNumber;
  final String? titleEn;
  final String? titleAr;
  final String? introEn;
  final String? introAr;
  final int? hadithCount;

  const Chapters({
    this.id,
    this.collectionId,
    this.bookId,
    this.sectionIndex,
    this.sectionType,
    this.chapterNumber,
    this.titleEn,
    this.titleAr,
    this.introEn,
    this.introAr,
    this.hadithCount,
  });

  @override
  List<Object?> get props {
    return [
      id,
      collectionId,
      bookId,
      sectionIndex,
      sectionType,
      chapterNumber,
      titleEn,
      titleAr,
      introEn,
      introAr,
      hadithCount,
    ];
  }
}
