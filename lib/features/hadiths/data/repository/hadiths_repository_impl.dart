import 'package:hadith_app/features/hadiths/data/datasources/hadiths_remote_data_source.dart';
import 'package:hadith_app/features/hadiths/domain/models/hadiths.dart';
import 'package:hadith_app/features/hadiths/domain/repository/hadiths_repo.dart';

class HadithsRepositoryImpl implements HadithsRepo {
  final HadithsRemoteDataSource remoteDataSource;
  HadithsRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Hadiths>> getHadiths() async {
    final response = await remoteDataSource.getHadiths();
    return response
        .map(
          (e) => Hadiths(
            id: e.id ?? 0,
            collectionId: e.collectionId ?? 0,
            bookId: e.bookId ?? 0,
            chapterId: e.chapterId ?? 0,
            numberInBook: e.numberInBook ?? 0,
            numberInCollection: e.numberInCollection ?? 0,
            numbersInCollection: e.numbersInCollection ?? '',
            grade: e.grade ?? '',
            url: e.url ?? '',
            narratorEn: e.narratorEn ?? '',
            english: e.english ?? '',
            arabicSanad: e.arabicSanad ?? '',
            arabicText: e.arabicText ?? '',
            arabic: e.arabic ?? '',
          ),
        )
        .toList();
  }
}
