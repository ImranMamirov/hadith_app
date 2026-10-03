part of 'collections_bloc.dart';

sealed class CollectionsState extends Equatable {
  const CollectionsState();
  
  @override
  List<Object> get props => [];
}

final class CollectionsInitial extends CollectionsState {
  const CollectionsInitial();
}
final class CollectionsLoading extends CollectionsState {
  const CollectionsLoading();
}
final class CollectionsSuccess extends CollectionsState {
  final List<Collections> collections;

  const CollectionsSuccess(this.collections);

  @override
  List<Object> get props => [collections];
}
final class CollectionsFailure extends CollectionsState {
  final String message;

  const CollectionsFailure(this.message);

  @override
  List<Object> get props => [message];
}