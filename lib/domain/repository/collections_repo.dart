import 'package:hadith_app/domain/models/collections.dart';

abstract class CollectionsRepo {
  Future<List<Collections>> getCollections();
}