import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadith_app/features/collections/presentation/cubit/collections_cubit.dart';
import 'package:hadith_app/features/collections/presentation/widgets/collections_card.dart';

class CollectionsPage extends StatelessWidget {
  const CollectionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Collections'), centerTitle: true),

      body: BlocBuilder<CollectionsCubit, CollectionsState>(
        builder: (context, state) {
          if (state is CollectionsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CollectionsLoaded) {
            return CollectionsCard(collections: state.collections);
          } else if (state is CollectionsError) {
            return Center(child: Text(state.message));
          }
          return const Text('Failed to load Collections');
        },
      ),
    );
  }
}
