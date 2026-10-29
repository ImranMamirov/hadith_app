import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hadith_app/features/hadiths/domain/models/hadiths.dart';
import 'package:hadith_app/features/hadiths/domain/repository/hadiths_repo.dart';

part 'hadiths_state.dart';

class HadithsCubit extends Cubit<HadithsState> {
  final HadithsRepo repo;
  HadithsCubit({required this.repo}) : super(HadithsInitial());

  Future<void> fetchHadiths() async {
    emit(HadithsLoading());
    try {
      final result = await repo.getHadiths();
      emit(HadithsLoaded(hadiths: result));
    } catch (e) {
      emit(HadithsError(message: e.toString()));
    }
  }
}
