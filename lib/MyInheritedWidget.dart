import 'package:flutter/material.dart';

class MyInheritedWidget extends InheritedWidget {

  const MyInheritedWidget({Key? key,
    required this.child,
  }) : super(key: key, child: child);

  @override
  final Widget child;

  // Переменные, которые будут передаваться
  final String text1 = 'Перейти к другой реализации';

// Поиск объекта класса InheritedWidget
  static MyInheritedWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>()!;
  }

  // Автоматическое оповещение о изменении состояния виджета
  @override
  bool updateShouldNotify(MyInheritedWidget oldWidget) {
    return true;
  }
}
