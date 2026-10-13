import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hadith_app/features/collections/domain/models/collections.dart';
import 'package:hadith_app/features/collections/domain/repository/collections_repo.dart';

part 'collections_state.dart';

class CollectionsCubit extends Cubit<CollectionsState> {
  final CollectionsRepo repo;
  CollectionsCubit({required this.repo}) : super(CollectionsInitial());

  Future<void> fetchCollections() async {
    emit(CollectionsLoading());
    try {
      final result = await repo.getCollections();
      emit(CollectionsLoaded(collections: result));
    } catch (e) {
      emit(CollectionsError(message: e.toString()));
    }
  }
}
