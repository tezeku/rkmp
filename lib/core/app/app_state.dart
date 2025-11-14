import 'package:flutter/material.dart';

class AppState extends InheritedWidget {
  final int penguinCount;

  const AppState({
    super.key,
    required this.penguinCount,
    required super.child,
  });

  static AppState of(BuildContext context) {
    final result = context.dependOnInheritedWidgetOfExactType<AppState>();
    assert(result != null, 'No AppState found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(covariant AppState oldWidget) {
    return penguinCount != oldWidget.penguinCount;
  }
}

