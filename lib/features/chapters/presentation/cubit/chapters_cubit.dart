import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hadith_app/features/chapters/domain/models/chapters.dart';
import 'package:hadith_app/features/chapters/domain/repository/chapters_repo.dart';

part 'chapters_state.dart';

class ChaptersCubit extends Cubit<ChaptersState> {
  final ChaptersRepo repo;
  ChaptersCubit({required this.repo}) : super(ChaptersInitial());

  Future<void> fetchChapters() async {
    emit(ChaptersLoading());
    try {
      final result = await repo.getChapters();
      emit(ChaptersLoaded(chapters: result));
    } catch (e) {
      emit(ChaptersError(message: e.toString()));
    }
  }
}
