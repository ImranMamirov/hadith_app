import 'package:hadith_app/features/collections/data/datasources/collections_remote_data_source.dart';
import 'package:hadith_app/features/collections/domain/models/collections.dart';
import 'package:hadith_app/features/collections/domain/repository/collections_repo.dart';

class CollectionsRepositoryImpl implements CollectionsRepo {
  final CollectionsRemoteDataSource dataSource;

  const CollectionsRepositoryImpl({required this.dataSource});

  @override
  Future<List<Collections>> getCollections() async {
    final response = await dataSource.getCollections();
    return response
        .map(
          (e) => Collections(
            id: e.id ?? 0,
            titleEn: e.titleEn ?? '',
            titleAr: e.titleAr ?? '',
            authorEn: e.authorEn ?? '',
            authorAr: e.authorAr ?? '',
            hadithCount: e.hadithCount ?? 0,
          ),
        )
        .toList();
  }
}
