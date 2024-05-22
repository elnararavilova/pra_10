import 'package:mobx/mobx.dart';

part 'mobx.g.dart';

class EditString = _EditString with _$EditString;

abstract class _EditString with Store {
  @observable
  String text3 = '';

  @action
  void edit(String text) {
    text3 = text;
  }
}