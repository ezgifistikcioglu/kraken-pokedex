import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kraken_pokedex/src/features/sample_feature/data/repository/tip_repository.dart';
import 'package:kraken_pokedex/src/features/sample_feature/domain/models/tip.dart';

part 'tip_event.dart';
part 'tip_state.dart';

class TipBloc extends Bloc<TipEvent, TipState> {
  TipBloc() : super(TipState.initial()) {
    on<TipFetched>(_onTipFetched);
  }

  Future<void> _onTipFetched(TipFetched event, Emitter<TipState> emit) async {
    emit(state.copyWith(status: TipStatus.loading));

    final tips = await FakeTipRepository.getTips();

    emit(state.copyWith(tips: tips, status: TipStatus.success));
  }
}
