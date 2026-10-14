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

  factory Books.fromJson(Map<String, dynamic> json) => Books(
    id: json['id'] as int?,
    collectionId: json['collection_id'] as int?,
    bookNumber: json['book_number'] as int?,
    titleEn: json['title_en'] as String?,
    titleAr: json['title_ar'] as String?,
    hadithCount: json['hadith_count'] as int?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'collection_id': collectionId,
    'book_number': bookNumber,
    'title_en': titleEn,
    'title_ar': titleAr,
    'hadith_count': hadithCount,
  };

  @override
  List<Object?> get props {
    return [id, collectionId, bookNumber, titleEn, titleAr, hadithCount];
  }
}
