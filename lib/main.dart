import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadith_app/core/api_constants.dart';
import 'package:hadith_app/data/datasources/collections_remote_data_source.dart';
import 'package:hadith_app/data/repository/collections_repository_impl.dart';
import 'package:hadith_app/domain/repository/collections_repo.dart';
import 'package:hadith_app/presentation/bloc/collections_bloc.dart';

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
        child: const CollectionsPage(),
      ),
    );
  }
}

class CollectionsPage extends StatelessWidget {
  const CollectionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CollectionsBloc(repo: context.read<CollectionsRepo>())
            ..add(const FetchCollectionsRequest()),
      child: Scaffold(
        appBar: AppBar(title: Text('Collections')),
        body: BlocBuilder<CollectionsBloc, CollectionsState>(
          builder: (context, state) {
            return switch (state) {
              CollectionsInitial() || CollectionsLoading() => const Center(
                child: CircularProgressIndicator(),
              ),
              CollectionsSuccess(collections: final collections) =>
                RefreshIndicator(
                  onRefresh: () async {
                    final bloc = context.read<CollectionsBloc>();
                    final done = bloc.stream.firstWhere(
                      (s) => s is CollectionsSuccess || s is CollectionsFailure,
                    );
                    bloc.add(const RefreshCollectionsRequest());
                    await done.timeout(const Duration(seconds: 15));
                  },
                  child: ListView.builder(
                    itemCount: collections.length,
                    itemBuilder: (context, index) {
                      final collection = collections[index];
                      return ListTile(
                        title: Text(
                          collection.titleAr,
                          textDirection: TextDirection.rtl,
                        ),
                        subtitle: Text(collection.titleEn),
                      );
                    },
                  ),
                ),

              CollectionsFailure(message: final msg) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Error: $msg'),
                    ElevatedButton(
                      onPressed: () {
                        context.read<CollectionsBloc>().add(
                          const FetchCollectionsRequest(),
                        );
                      },
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              ),
            };
          },
        ),
      ),
    );
  }
}
