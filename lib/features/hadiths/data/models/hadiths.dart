import 'package:equatable/equatable.dart';

class Hadiths extends Equatable {
  final int? id;
  final int? collectionId;
  final int? bookId;
  final int? chapterId;
  final int? numberInBook;
  final int? numberInCollection;
  final String? numbersInCollection;
  final dynamic grade;
  final String? url;
  final String? narratorEn;
  final String? english;
  final String? arabicSanad;
  final String? arabicText;
  final String? arabic;

  const Hadiths({
    this.id,
    this.collectionId,
    this.bookId,
    this.chapterId,
    this.numberInBook,
    this.numberInCollection,
    this.numbersInCollection,
    this.grade,
    this.url,
    this.narratorEn,
    this.english,
    this.arabicSanad,
    this.arabicText,
    this.arabic,
  });

  factory Hadiths.fromJson(Map<String, dynamic> json) => Hadiths(
    id: json['id'] as int?,
    collectionId: json['collection_id'] as int?,
    bookId: json['book_id'] as int?,
    chapterId: json['chapter_id'] as int?,
    numberInBook: json['number_in_book'] as int?,
    numberInCollection: json['number_in_collection'] as int?,
    numbersInCollection: json['numbers_in_collection'] as String?,
    grade: json['grade'] as dynamic,
    url: json['url'] as String?,
    narratorEn: json['narrator_en'] as String?,
    english: json['english'] as String?,
    arabicSanad: json['arabic_sanad'] as String?,
    arabicText: json['arabic_text'] as String?,
    arabic: json['arabic'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'collection_id': collectionId,
    'book_id': bookId,
    'chapter_id': chapterId,
    'number_in_book': numberInBook,
    'number_in_collection': numberInCollection,
    'numbers_in_collection': numbersInCollection,
    'grade': grade,
    'url': url,
    'narrator_en': narratorEn,
    'english': english,
    'arabic_sanad': arabicSanad,
    'arabic_text': arabicText,
    'arabic': arabic,
  };

  @override
  List<Object?> get props {
    return [
      id,
      collectionId,
      bookId,
      chapterId,
      numberInBook,
      numberInCollection,
      numbersInCollection,
      grade,
      url,
      narratorEn,
      english,
      arabicSanad,
      arabicText,
      arabic,
    ];
  }
}
