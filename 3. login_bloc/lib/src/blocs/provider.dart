import 'package:flutter/material.dart';
import 'bloc.dart';

class Provider extends InheritedWidget {
  final bloc = Bloc();

  Provider({required super.child});

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;

  static Bloc of(BuildContext context) {
    final Provider? result = maybeOf(context);
    assert(result != null, "Not found!");
    return result!.bloc;
  }

  static Provider? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Provider>();
  }
}
