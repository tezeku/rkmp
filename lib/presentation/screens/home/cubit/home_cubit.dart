import 'package:flutter_bloc/flutter_bloc.dart';

class HomeState {
  final int visitCount;
  final String welcomeMessage;

  const HomeState({
    this.visitCount = 0,
    this.welcomeMessage = 'Добро пожаловать в мир пингвинов!',
  });

  HomeState copyWith({
    int? visitCount,
    String? welcomeMessage,
  }) {
    return HomeState(
      visitCount: visitCount ?? this.visitCount,
      welcomeMessage: welcomeMessage ?? this.welcomeMessage,
    );
  }
}

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState());

  void incrementVisits() {
    emit(state.copyWith(visitCount: state.visitCount + 1));
  }

  void updateWelcomeMessage(String newMessage) {
    if (newMessage.isNotEmpty) {
      emit(state.copyWith(welcomeMessage: newMessage));
    }
  }

  void resetVisits() {
    emit(state.copyWith(visitCount: 0));
  }
}