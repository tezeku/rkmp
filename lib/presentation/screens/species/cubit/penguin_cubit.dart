import 'package:flutter_bloc/flutter_bloc.dart';

class PenguinSpeciesState {
  final List<Map<String, String>> species;

  const PenguinSpeciesState({
    this.species = const [
      {
        'name': 'Императорский пингвин',
        'description': 'Самый крупный вид, обитает в Антарктиде',
        'image': 'https://i.pinimg.com/736x/40/fd/82/40fd825f86f35d3034344b21c6a40aba.jpg',
      },
      {
        'name': 'Королевский пингвин',
        'description': 'Второй по величине, яркие оранжевые пятна',
        'image': 'https://i.pinimg.com/736x/e4/45/95/e44595eacfb5900ed00396eeeb09721d.jpg',
      },
      {
        'name': 'Пингвин Адели',
        'description': 'Небольшие пингвины с белым кольцом вокруг глаз',
        'image': 'https://i.pinimg.com/736x/9a/46/13/9a4613c615a64ba3cb08452aa621fd6d.jpg',
      },
    ],
  });

  PenguinSpeciesState copyWith({
    List<Map<String, String>>? species,
  }) {
    return PenguinSpeciesState(
      species: species ?? this.species,
    );
  }
}

class PenguinCubit extends Cubit<PenguinSpeciesState> {
  PenguinCubit() : super(const PenguinSpeciesState());

  void addSpecies(String name, String description, String imageUrl) {
    final newSpecies = List<Map<String, String>>.from(state.species);
    newSpecies.add({
      'name': name,
      'description': description,
      'image': imageUrl,
    });
    emit(state.copyWith(species: newSpecies));
  }

  void removeSpecies(int index) {
    final newSpecies = List<Map<String, String>>.from(state.species);
    newSpecies.removeAt(index);
    emit(state.copyWith(species: newSpecies));
  }
}