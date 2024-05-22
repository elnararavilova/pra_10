// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EditString on _EditString, Store {
  late final _$text3Atom = Atom(name: '_EditString.text3', context: context);

  @override
  String get text3 {
    _$text3Atom.reportRead();
    return super.text3;
  }

  @override
  set text3(String value) {
    _$text3Atom.reportWrite(value, super.text3, () {
      super.text3 = value;
    });
  }

  late final _$_EditStringActionController =
      ActionController(name: '_EditString', context: context);

  @override
  void edit(String text) {
    final _$actionInfo =
        _$_EditStringActionController.startAction(name: '_EditString.edit');
    try {
      return super.edit(text);
    } finally {
      _$_EditStringActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
text3: ${text3}
    ''';
  }
}
