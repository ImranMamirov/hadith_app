import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:hadith_app/domain/models/collections.dart';
import 'package:hadith_app/domain/repository/collections_repo.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';

part 'collections_event.dart';
part 'collections_state.dart';

class CollectionsBloc extends Bloc<CollectionsEvent, CollectionsState> {
  CollectionsBloc({required CollectionsRepo repo})
    : _repo = repo,
      super(CollectionsInitial()) {
    
    on<FetchCollectionsRequest>(_onFetched, transformer: restartable());

    on<RefreshCollectionsRequest>(onRefreshed, transformer: droppable());
  }

  final CollectionsRepo _repo;

  Future<void> _onFetched(
    FetchCollectionsRequest event,
    Emitter<CollectionsState> emit,
  ) async {
    emit(const CollectionsLoading());

    try {
      final collections = await _repo.getCollections();
      emit(CollectionsSuccess(collections));
    } catch (e) {
      emit(CollectionsFailure(e.toString()));
    }
  }

  Future<void> onRefreshed(
    RefreshCollectionsRequest event,
    Emitter<CollectionsState> emit,
  ) async {
    try {
      final collections = await _repo.getCollections();
      emit(CollectionsSuccess(collections));
    } catch (e) {
      emit(CollectionsFailure(e.toString()));
    }
  }
}
