import 'package:get_it/get_it.dart';

final GetIt locator = GetIt.instance;

class AppStateService {
  int penguinCount = 18;

  void setPenguinCount(int newPenguinCount) { penguinCount = newPenguinCount; }
}

void setupLocator() {
  locator.registerSingleton<AppStateService>(AppStateService());
}

