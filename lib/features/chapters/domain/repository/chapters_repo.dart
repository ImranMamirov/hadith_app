import 'package:hadith_app/features/chapters/domain/models/chapters.dart';

abstract class ChaptersRepo {
  Future<List<Chapters>> getChapters();
}