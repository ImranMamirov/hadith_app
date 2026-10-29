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
