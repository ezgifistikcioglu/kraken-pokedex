import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kraken_pokedex/src/features/sample_feature/presentation/bloc/tip_bloc.dart';
import 'package:kraken_pokedex/src/features/sample_feature/presentation/view/sample_tip_card.dart';

class SampleTipListView extends StatelessWidget {
  const SampleTipListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TipBloc, TipState>(
      builder: (context, state) {
        if (state.status == TipStatus.success) {
          return ListView.builder(
            itemCount: state.tips.length,
            itemBuilder: (context, index) {
              final tip = state.tips[index];
              return SampleTipCard(tip: tip);
            },
            padding: const EdgeInsets.all(8),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
