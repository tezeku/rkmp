import 'package:flutter_bloc/flutter_bloc.dart';

class FactsState {
  final List<Map<String, String>> facts;

  const FactsState({this.facts = const []});

  FactsState copyWith({List<Map<String, String>>? facts}) {
    return FactsState(
      facts: facts ?? this.facts,
    );
  }
}

class FactsCubit extends Cubit<FactsState> {
  FactsCubit() : super(const FactsState(facts: [
    {'id': '1', 'text': 'Пингвины не умеют летать, но отлично плавают'},
    {'id': '2', 'text': 'Самый крупный вид - императорский пингвин'},
    {'id': '3', 'text': 'Пингвины живут только в Южном полушарии'},
    {'id': '4', 'text': 'Они могут пить морскую воду'},
    {'id': '5', 'text': 'Пингвины моногамны и образуют пары на всю жизнь'},
  ]));

  void addFact(String text) {
    final newFacts = List<Map<String, String>>.from(state.facts);
    final newId = (state.facts.length + 1).toString();
    newFacts.add({
      'id': newId,
      'text': text,
    });
    emit(state.copyWith(facts: newFacts));
  }

  void removeFact(int index) {
    final newFacts = List<Map<String, String>>.from(state.facts);
    newFacts.removeAt(index);
    emit(state.copyWith(facts: newFacts));
  }

  void clearAllFacts() {
    emit(const FactsState(facts: []));
  }
}

