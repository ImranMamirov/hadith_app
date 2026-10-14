import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadith_app/core/api_constants.dart';
import 'package:hadith_app/features/book/data/datasources/books_remote_data_source.dart';
import 'package:hadith_app/features/book/data/repository/books_repository_impl.dart';
import 'package:hadith_app/features/book/domain/repository/books_repo.dart';
import 'package:hadith_app/features/book/presentation/cubit/books_cubit.dart';
import 'package:hadith_app/features/book/presentation/pages/books_page.dart';
import 'package:hadith_app/features/chapters/data/datasources/chapters_remote_data_source.dart';
import 'package:hadith_app/features/chapters/data/repository/chapters_repository_impl.dart';
import 'package:hadith_app/features/chapters/domain/repository/chapters_repo.dart';
import 'package:hadith_app/features/chapters/presentation/cubit/chapters_cubit.dart';
import 'package:hadith_app/features/chapters/presentation/pages/chapters_page.dart';
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

          RepositoryProvider<BooksRepo>(
            create: (context) => BooksRepositoryImpl(
              remoteDataSource: BooksRemoteDataSourceImpl(
                dio: context.read<Dio>(),
              ),
            ),
          ),

          RepositoryProvider<ChaptersRepo>(
            create: (context) => ChaptersRepositoryImpl(
              dataSource: ChaptersRemoteDataSourceImpl(
                dio: context.read<Dio>()
              )
            ),
          )
        ],
        child: BlocProvider(
          create: (context) =>
              ChaptersCubit(repo: context.read<ChaptersRepo>())..fetchChapters(),
          child: const ChaptersPage(),
        ),
      ),
    );
  }
}
