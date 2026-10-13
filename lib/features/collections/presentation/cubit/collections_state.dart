part of 'collections_cubit.dart';

sealed class CollectionsState extends Equatable {
  const CollectionsState();

  @override
  List<Object> get props => [];
}

final class CollectionsInitial extends CollectionsState {}

final class CollectionsLoading extends CollectionsState {}

final class CollectionsLoaded extends CollectionsState {
  final List<Collections> collections;
  const CollectionsLoaded({required this.collections});

  @override
  List<Object> get props => [collections];
}

final class CollectionsError extends CollectionsState {
  final String message;
  const CollectionsError({required this.message});

  @override
  List<Object> get props => [message];
}
