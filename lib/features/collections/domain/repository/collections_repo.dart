import 'package:hadith_app/features/collections/domain/models/collections.dart';

abstract class CollectionsRepo {
  Future<List<Collections>> getCollections();
}
