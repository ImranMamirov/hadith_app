import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadith_app/core/api_constants.dart';
import 'package:hadith_app/features/collections/data/datasources/collections_remote_data_source.dart';
import 'package:hadith_app/features/collections/data/repository/collections_repository_impl.dart';
import 'package:hadith_app/features/collections/domain/repository/collections_repo.dart';
import 'package:hadith_app/features/collections/presentation/cubit/collections_cubit.dart';
import 'package:hadith_app/features/collections/presentation/pages/collections_page.dart';

void main() {
  runApp(MainApp(dio: _createDio()));
}

Dio _createDio() => Dio(
  BaseOptions(
    baseUrl: ApiConstants.baseUrl,
    headers: {
      'apikey': ApiConstants.apiKey,
      'Authorization': 'Bearer ${ApiConstants.apiKey}',
    },
  ),
);

class MainApp extends StatelessWidget {
  final Dio dio;
  const MainApp({super.key, required this.dio});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiRepositoryProvider(
        providers: [
          RepositoryProvider<Dio>.value(value: dio),
          RepositoryProvider<CollectionsRepo>(
            create: (context) => CollectionsRepositoryImpl(
              dataSource: CollectionsRemoteDataSourceImpl(
                dio: context.read<Dio>(),
              ),
            ),
          ),
        ],
        child: BlocProvider(
          create: (context) =>
              CollectionsCubit(repo: context.read<CollectionsRepo>())
                ..fetchCollections(),
          child: const CollectionsPage(),
        ),
      ),
    );
  }
}
