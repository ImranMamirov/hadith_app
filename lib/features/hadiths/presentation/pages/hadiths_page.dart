import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hadith_app/core/app_router.dart';
import 'package:hadith_app/features/hadiths/presentation/cubit/hadiths_cubit.dart';

import '../widgets/hadith_card.dart';

class HadithsPage extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hadiths')),
      body: BlocBuilder<HadithsCubit, HadithsState>(
        builder: (context, state) {
          if (state is HadithsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is HadithsLoaded) {
            return HadithCard(
              hadith: state.hadiths,
              onTap: () => context.push(AppRouter.chapters),
            );
          } else if (state is HadithsError) {
            return Text(state.message);
          }
          return Text('Failed to load Books');
        },
      ),
    );
  }
}
