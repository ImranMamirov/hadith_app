import 'package:equatable/equatable.dart';

class Collections extends Equatable {
  final int? id;
  final String? code;
  final String? titleEn;
  final String? titleAr;
  final String? authorEn;
  final String? authorAr;
  final int? totalHadiths;

  const Collections({
    this.id,
    this.code,
    this.titleEn,
    this.titleAr,
    this.authorEn,
    this.authorAr,
    this.totalHadiths,
  });

  factory Collections.fromJson(Map<String, dynamic> json) => Collections(
  id: (json['id'] as num?)?.toInt(),
  code: json['code'] as String?,
  titleEn: json['title_en'] as String?,
  titleAr: json['title_ar'] as String?,
  authorEn: json['author_en'] as String?,
  authorAr: json['author_ar'] as String?,
  totalHadiths: (json['total_hadiths'] as num?)?.toInt(),
);

  Map<String, dynamic> toJson() => {
    'id': id,
    'code': code,
    'title_en': titleEn,
    'title_ar': titleAr,
    'author_en': authorEn,
    'author_ar': authorAr,
    'total_hadiths': totalHadiths,
  };

  @override
  List<Object?> get props {
    return [id, code, titleEn, titleAr, authorEn, authorAr, totalHadiths];
  }
}
