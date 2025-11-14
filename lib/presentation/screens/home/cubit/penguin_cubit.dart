import 'package:flutter_bloc/flutter_bloc.dart';

class PenguinState {
  final int penguinCount;

  const PenguinState({this.penguinCount = 18});

  PenguinState copyWith({int? penguinCount}) {
    return PenguinState(
      penguinCount: penguinCount ?? this.penguinCount,
    );
  }
}

class PenguinCubit extends Cubit<PenguinState> {
  PenguinCubit() : super(const PenguinState());

  void setPenguinCount(int newCount) {
    emit(state.copyWith(penguinCount: newCount));
  }

  void increment() {
    emit(state.copyWith(penguinCount: state.penguinCount + 1));
  }

  void decrement() {
    emit(state.copyWith(penguinCount: state.penguinCount - 1));
  }
}

