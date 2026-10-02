import 'package:equatable/equatable.dart';

class Collections extends Equatable{
  final int id;
  final String code;
  final String titleEn;
  final String titleAr;
  final String authorEn;
  final String authorAr;
  final int totalHadiths;

  const Collections({
    required this.id,
    required this.code,
    required this.titleEn,
    required this.titleAr,
    required this.authorEn,
    required this.authorAr,
    required this.totalHadiths,
  });

  @override
  List<Object?> get props => [id, code, titleEn, titleAr, authorEn, authorAr, totalHadiths];
}