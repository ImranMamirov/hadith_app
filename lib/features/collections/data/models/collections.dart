import 'package:equatable/equatable.dart';

class Collections extends Equatable {
  final int? id;
  final String? titleEn;
  final String? titleAr;
  final String? authorEn;
  final String? authorAr;
  final int? hadithCount;

  const Collections({
    this.id,
    this.titleEn,
    this.titleAr,
    this.authorEn,
    this.authorAr,
    this.hadithCount,
  });

  factory Collections.fromJson(Map<String, dynamic> json) => Collections(
    id: (json['id'] as num?)?.toInt(),
    titleEn: json['title_en'] as String?,
    titleAr: json['title_ar'] as String?,
    authorEn: json['author_en'] as String?,
    authorAr: json['author_ar'] as String?,
    hadithCount: (json['hadith_count'] as num?)?.toInt(),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'title_en': titleEn,
    'title_ar': titleAr,
    'author_en': authorEn,
    'author_ar': authorAr,
    'hadith_count': hadithCount,
  };

  @override
  List<Object?> get props {
    return [id, titleEn, titleAr, authorEn, authorAr, hadithCount];
  }
}
