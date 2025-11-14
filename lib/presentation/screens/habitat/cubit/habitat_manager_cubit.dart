import 'package:flutter_bloc/flutter_bloc.dart';

class HabitatManagerState {
  final List<Map<String, String>> habitats;

  const HabitatManagerState({this.habitats = const []});

  HabitatManagerState copyWith({List<Map<String, String>>? habitats}) {
    return HabitatManagerState(
      habitats: habitats ?? this.habitats,
    );
  }
}

class HabitatManagerCubit extends Cubit<HabitatManagerState> {
  HabitatManagerCubit() : super(const HabitatManagerState(habitats: [
    {
      'name': 'Антарктида',
      'description': 'Основное место обитания императорских пингвинов',
      'image': 'https://png.klev.club/uploads/posts/2024-05/png-klev-club-mpai-p-antarktida-png-24.png',
    },
    {
      'name': 'Субантарктические острова',
      'description': 'Обитают королевские и хохлатые пингвины',
      'image': 'https://upload.wikimedia.org/wikipedia/commons/0/0b/Joinville-Stub-Picture.png',
    },
    {
      'name': 'Южная Америка',
      'description': 'Магеллановы и галапагосские пингвины',
      'image': 'https://www.clipartmax.com/png/middle/175-1754158_south-america-comments-flecha-para-adentro.png',
    },
  ]));

  void addHabitat(String name, String description, {String? imageUrl}) {
    final newHabitats = List<Map<String, String>>.from(state.habitats);
    newHabitats.add({
      'name': name,
      'description': description,
      'image': imageUrl ?? '',
    });
    emit(state.copyWith(habitats: newHabitats));
  }

  void updateHabitat(int index, String name, String description, {String? imageUrl}) {
    final newHabitats = List<Map<String, String>>.from(state.habitats);
    newHabitats[index] = {
      'name': name,
      'description': description,
      'image': imageUrl ?? newHabitats[index]['image'] ?? '',
    };
    emit(state.copyWith(habitats: newHabitats));
  }

  void removeHabitat(int index) {
    final newHabitats = List<Map<String, String>>.from(state.habitats);
    newHabitats.removeAt(index);
    emit(state.copyWith(habitats: newHabitats));
  }

  void clearAllHabitats() {
    emit(const HabitatManagerState(habitats: []));
  }

  void restoreDefaultHabitats() {
    emit(const HabitatManagerState(habitats: [
      {
        'name': 'Антарктида',
        'description': 'Основное место обитания императорских пингвинов',
        'image': 'https://png.klev.club/uploads/posts/2024-05/png-klev-club-mpai-p-antarktida-png-24.png',
      },
      {
        'name': 'Субантарктические острова',
        'description': 'Обитают королевские и хохлатые пингвины',
        'image': 'https://upload.wikimedia.org/wikipedia/commons/0/0b/Joinville-Stub-Picture.png',
      },
      {
        'name': 'Южная Америка',
        'description': 'Магеллановы и галапагосские пингвины',
        'image': 'https://www.clipartmax.com/png/middle/175-1754158_south-america-comments-flecha-para-adentro.png',
      },
    ]));
  }
}