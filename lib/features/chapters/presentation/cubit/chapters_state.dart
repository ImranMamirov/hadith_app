part of 'chapters_cubit.dart';

sealed class ChaptersState extends Equatable {
  const ChaptersState();

  @override
  List<Object> get props => [];
}

final class ChaptersInitial extends ChaptersState {}

final class ChaptersLoading extends ChaptersState {}

final class ChaptersLoaded extends ChaptersState {
  final List<Chapters> chapters;

  const ChaptersLoaded({required this.chapters});

  @override
  List<Object> get props => [chapters];
}

final class ChaptersError extends ChaptersState {
  final String message;

  const ChaptersError({required this.message});

  @override
  List<Object> get props => [message];
}
