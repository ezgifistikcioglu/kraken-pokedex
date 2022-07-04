import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kraken_pokedex/src/features/sample_feature/presentation/bloc/tip_bloc.dart';
import 'package:kraken_pokedex/src/features/sample_feature/presentation/view/sample_tip_list_view.dart';

class SampleScreen extends StatelessWidget {
  const SampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TipBloc()..add(TipFetched()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Sample Screen'),
        ),
        body: const SampleTipListView(),
      ),
    );
  }
}
