import 'package:flutter_bloc/flutter_bloc.dart';

class HomeState {
  final int visitCount;

  const HomeState({
    this.visitCount = 0,
  });

  HomeState copyWith({
    int? visitCount,
  }) {
    return HomeState(
      visitCount: visitCount ?? this.visitCount,
    );
  }
}

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState());

  void incrementVisits() {
    emit(state.copyWith(visitCount: state.visitCount + 1));
  }

  void resetVisits() {
    emit(state.copyWith(visitCount: 0));
  }
}