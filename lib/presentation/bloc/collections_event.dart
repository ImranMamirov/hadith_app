part of 'collections_bloc.dart';

sealed class CollectionsEvent extends Equatable {
  const CollectionsEvent();

  @override
  List<Object> get props => [];
}

class FetchCollectionsRequest extends CollectionsEvent {
  const FetchCollectionsRequest();
}

class RefreshCollectionsRequest extends CollectionsEvent {
  const RefreshCollectionsRequest();
}