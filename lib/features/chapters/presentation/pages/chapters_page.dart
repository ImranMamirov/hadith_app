import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hadith_app/core/app_router.dart';
import 'package:hadith_app/features/chapters/presentation/cubit/chapters_cubit.dart';
import 'package:hadith_app/features/chapters/presentation/widgets/chapter_card.dart';

class ChaptersPage extends StatelessWidget {
  const ChaptersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chapters'),
      ),
      body: BlocBuilder<ChaptersCubit, ChaptersState>(
        builder: (context, state) {
          if (state is ChaptersLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ChaptersLoaded) {
            return ChapterCard(
              chapter: state.chapters,
              onTap: () => context.push(AppRouter.hadiths),
            );
          } else if (state is ChaptersError) {
            return Text(state.message);
          }
          return Text('Failed to load Chapters');
        },
      ),
    );
  }
}
