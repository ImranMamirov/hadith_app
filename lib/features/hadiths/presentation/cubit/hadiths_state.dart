part of 'hadiths_cubit.dart';

sealed class HadithsState extends Equatable {
  const HadithsState();

  @override
  List<Object> get props => [];
}

final class HadithsInitial extends HadithsState {}

final class HadithsLoading extends HadithsState {}

final class HadithsLoaded extends HadithsState {
  final List<Hadiths> hadiths;
  const HadithsLoaded({required this.hadiths});

  @override
  List<Object> get props => [hadiths];
}

final class HadithsError extends HadithsState {
  final String message;
  const HadithsError({required this.message});

  @override
  List<Object> get props => [message];
}
