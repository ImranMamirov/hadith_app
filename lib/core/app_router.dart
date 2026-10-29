import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hadith_app/features/book/domain/repository/books_repo.dart';
import 'package:hadith_app/features/book/presentation/cubit/books_cubit.dart';
import 'package:hadith_app/features/book/presentation/pages/books_page.dart';
import 'package:hadith_app/features/chapters/domain/repository/chapters_repo.dart';
import 'package:hadith_app/features/chapters/presentation/cubit/chapters_cubit.dart';
import 'package:hadith_app/features/chapters/presentation/pages/chapters_page.dart';
import 'package:hadith_app/features/collections/domain/repository/collections_repo.dart';
import 'package:hadith_app/features/collections/presentation/cubit/collections_cubit.dart';
import 'package:hadith_app/features/collections/presentation/pages/collections_page.dart';
import 'package:hadith_app/features/hadiths/domain/repository/hadiths_repo.dart';
import 'package:hadith_app/features/hadiths/presentation/cubit/hadiths_cubit.dart';
import 'package:hadith_app/features/hadiths/presentation/pages/hadiths_page.dart';

abstract class AppRouter {
  static const String collections = '/';
  static const String books = '/books';
  static const String chapters = '/chapters';
  static const String hadiths = '/hadiths';
}

final GoRouter appRouter = GoRouter(
  initialLocation: AppRouter.collections,
  routes: [
    GoRoute(
      path: AppRouter.collections,
      builder: (context, state) {
        return BlocProvider(
          create: (context) =>
              CollectionsCubit(repo: context.read<CollectionsRepo>())
                ..fetchCollections(),
          child: const CollectionsPage(),
        );
      },
    ),

    GoRoute(
      path: AppRouter.books,
      builder: (context, state) {
        return BlocProvider(
          create: (context) =>
              BooksCubit(repo: context.read<BooksRepo>())..fetchBooks(),
          child: const BooksPage(),
        );
      },
    ),

    GoRoute(
      path: AppRouter.chapters,
      builder: (context, state) {
        return BlocProvider(
          create: (context) =>
              ChaptersCubit(repo: context.read<ChaptersRepo>())
                ..fetchChapters(),
          child: const ChaptersPage(),
        );
      },
    ),

    GoRoute(
      path: AppRouter.hadiths,
      builder: (context, state) {
        return BlocProvider(
          create: (context) =>
              HadithsCubit(repo: context.read<HadithsRepo>())..fetchHadiths(),
          child: const HadithsPage(),
        );
      },
    ),
  ],
);
