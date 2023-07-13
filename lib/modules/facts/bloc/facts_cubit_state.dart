import 'dart:ui';

import '/modules/facts/models/factmodel.dart';

enum FactsCubitStateStatus { loading, loaded, error }

class FactsCubitState {
  final FactsCubitStateStatus status;
  final List<FactModel> facts;
  final String? error;
  final VoidCallback? onBothPressed;
  final VoidCallback? onCatsPressed;
  final VoidCallback? onDogsPressed;

  const FactsCubitState({
    required this.status,
    this.facts = const [],
    this.error,
    this.onBothPressed,
    this.onCatsPressed,
    this.onDogsPressed,
  });

  FactsCubitState copyWith({
    FactsCubitStateStatus? status,
    List<FactModel>? facts,
    String? error,
    VoidCallback? onBothPressed,
    VoidCallback? onCatsPressed,
    VoidCallback? onDogsPressed,
  }) {
    return FactsCubitState(
      status: status ?? this.status,
      facts: facts ?? this.facts,
      error: error ?? this.error,
      onBothPressed: onBothPressed ?? this.onBothPressed,
      onCatsPressed: onCatsPressed ?? this.onCatsPressed,
      onDogsPressed: onDogsPressed ?? this.onDogsPressed,
    );
  }
}
