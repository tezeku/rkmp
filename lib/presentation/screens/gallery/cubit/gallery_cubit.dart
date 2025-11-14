import 'package:flutter_bloc/flutter_bloc.dart';

class GalleryState {
  final int currentPenguinIndex;
  final List<Map<String, String>> penguins;

  const GalleryState({
    this.currentPenguinIndex = 0,
    this.penguins = const [
      {
        'name': 'Императорский пингвин',
        'image': 'https://i.pinimg.com/736x/40/fd/82/40fd825f86f35d3034344b21c6a40aba.jpg',
      },
      {
        'name': 'Королевский пингвин',
        'image': 'https://i.pinimg.com/736x/e4/45/95/e44595eacfb5900ed00396eeeb09721d.jpg',
      },
      {
        'name': 'Пингвин Адели',
        'image': 'https://i.pinimg.com/736x/9a/46/13/9a4613c615a64ba3cb08452aa621fd6d.jpg',
      },
    ],
  });

  GalleryState copyWith({
    int? currentPenguinIndex,
    List<Map<String, String>>? penguins,
  }) {
    return GalleryState(
      currentPenguinIndex: currentPenguinIndex ?? this.currentPenguinIndex,
      penguins: penguins ?? this.penguins,
    );
  }
}

class GalleryCubit extends Cubit<GalleryState> {
  GalleryCubit() : super(const GalleryState());

  void nextPenguin() {
    final nextIndex = (state.currentPenguinIndex + 1) % state.penguins.length;
    emit(state.copyWith(currentPenguinIndex: nextIndex));
  }

  void previousPenguin() {
    final previousIndex = (state.currentPenguinIndex - 1) % state.penguins.length;
    emit(state.copyWith(
      currentPenguinIndex: previousIndex >= 0 ? previousIndex : state.penguins.length - 1,
    ));
  }

  void setPenguinIndex(int index) {
    if (index >= 0 && index < state.penguins.length) {
      emit(state.copyWith(currentPenguinIndex: index));
    }
  }
}