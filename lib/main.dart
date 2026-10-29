import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadith_app/core/api_constants.dart';
import 'package:hadith_app/core/app_router.dart';
import 'package:hadith_app/features/book/data/datasources/books_remote_data_source.dart';
import 'package:hadith_app/features/book/data/repository/books_repository_impl.dart';
import 'package:hadith_app/features/book/domain/repository/books_repo.dart';
import 'package:hadith_app/features/chapters/data/datasources/chapters_remote_data_source.dart';
import 'package:hadith_app/features/chapters/data/repository/chapters_repository_impl.dart';
import 'package:hadith_app/features/chapters/domain/repository/chapters_repo.dart';
import 'package:hadith_app/features/collections/data/datasources/collections_remote_data_source.dart';
import 'package:hadith_app/features/collections/data/repository/collections_repository_impl.dart';
import 'package:hadith_app/features/collections/domain/repository/collections_repo.dart';
import 'package:hadith_app/features/hadiths/data/datasources/hadiths_remote_data_source.dart';
import 'package:hadith_app/features/hadiths/data/repository/hadiths_repository_impl.dart';
import 'package:hadith_app/features/hadiths/domain/repository/hadiths_repo.dart';

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
    return MultiRepositoryProvider(
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
            dataSource: ChaptersRemoteDataSourceImpl(dio: context.read<Dio>()),
          ),
        ),

        RepositoryProvider<HadithsRepo>(
          create: (context) => HadithsRepositoryImpl(
            remoteDataSource: HadithsRemoteDataSourceImpl(
              dio: context.read<Dio>(),
            ),
          ),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: appRouter,
        debugShowCheckedModeBanner: false,
        title: 'Hadith App',
      ),
    );
  }
}
