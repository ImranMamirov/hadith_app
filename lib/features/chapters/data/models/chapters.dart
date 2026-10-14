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

  factory Chapters.fromJson(Map<String, dynamic> json) => Chapters(
    id: json['id'] as int?,
    collectionId: json['collection_id'] as int?,
    bookId: json['book_id'] as int?,
    sectionIndex: json['section_index'] as int?,
    sectionType: json['section_type'] as String?,
    chapterNumber: json['chapter_number'] as String?,
    titleEn: json['title_en'] as String?,
    titleAr: json['title_ar'] as String?,
    introEn: json['intro_en'] as String?,
    introAr: json['intro_ar'] as String?,
    hadithCount: json['hadith_count'] as int?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'collection_id': collectionId,
    'book_id': bookId,
    'section_index': sectionIndex,
    'section_type': sectionType,
    'chapter_number': chapterNumber,
    'title_en': titleEn,
    'title_ar': titleAr,
    'intro_en': introEn,
    'intro_ar': introAr,
    'hadith_count': hadithCount,
  };

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
