import 'package:mobx/mobx.dart';
import 'models/client.dart';
part 'controller.g.dart';

class Controller = _ControllerBase with _$Controller;

abstract class _ControllerBase with Store {
  var client = Client();

  @computed
  bool get isValid {
    return validateName() == null &&
        validateEmail() == null &&
        validateCpf() == null;
  }

  String validateName() {
    if (client.name == null || client.name.isEmpty) {
      return "Campo nome obrigatório ";
    } else if (client.name.length < 3) {
      return "Campo não pode ser menor do que 3";
    }

    return null;
  }

  String validateEmail() {
    if (client.email == null || client.email.isEmpty) {
      return "Campo email obrigatório ";
    } else if (client.email.contains("@")) {
      return "Campo inválido";
    }

    return null;
  }

  String validateCpf() {
    if (client.cpf == null || client.cpf.isEmpty) {
      return "Campo cpf obrigatório ";
    } else if (client.cpf.length < 11) {
      return "Campo não pode ser menor do que 11";
    }

    return null;
  }
}
