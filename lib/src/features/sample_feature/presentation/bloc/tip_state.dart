part of 'tip_bloc.dart';

enum TipStatus { initial, loading, success, failure }

class TipState extends Equatable {
  const TipState({
    required this.tips,
    required this.status,
  });

  factory TipState.initial() => const TipState(
        tips: [],
        status: TipStatus.initial,
      );

  final List<Tip> tips;
  final TipStatus status;

  @override
  List<Object> get props => [tips, status];

  TipState copyWith({
    List<Tip>? tips,
    TipStatus? status,
  }) {
    return TipState(
      tips: tips ?? this.tips,
      status: status ?? this.status,
    );
  }
}
