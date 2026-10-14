import 'package:hadith_app/features/chapters/data/datasources/chapters_remote_data_source.dart';
import 'package:hadith_app/features/chapters/domain/models/chapters.dart';
import 'package:hadith_app/features/chapters/domain/repository/chapters_repo.dart';

class ChaptersRepositoryImpl implements ChaptersRepo {
  final ChaptersRemoteDataSource dataSource;

  ChaptersRepositoryImpl({required this.dataSource});

  @override
  Future<List<Chapters>> getChapters() async {
    final response = await dataSource.getChapters();
    return response
        .map(
          (e) => Chapters(
            id: e.id ?? 0,
            collectionId: e.collectionId ?? 0,
            bookId: e.bookId ?? 0,
            sectionIndex: e.sectionIndex ?? 0,
            sectionType: e.sectionType ?? '',
            chapterNumber: e.chapterNumber ?? '',
            titleEn: e.titleEn ?? '',
            titleAr: e.titleAr ?? '',
            introEn: e.introEn ?? '',
            introAr: e.introAr ?? '',
            hadithCount: e.hadithCount ?? 0,
          ),
        )
        .toList();
  }
}
