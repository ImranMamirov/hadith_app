
import 'package:hadith_app/features/hadiths/domain/models/hadiths.dart';

abstract class HadithsRepo {
  Future<List<Hadiths>> getHadiths();
}
