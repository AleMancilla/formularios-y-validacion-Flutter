import 'dart:async';

import 'package:validacion_de_formulario/src/bloc/Validators.dart';

class LogicBloc with Validators {
  final _emailController = StreamController<String>.broadcast();
  final _passController  = StreamController<String>.broadcast();

  Stream<String> get emailStream => _emailController.stream.transform(validarEmail);
  Stream<String> get passStream  => _passController.stream.transform(validarPassword);

  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePass => _passController.sink.add;

  dispose(){
    _emailController?.close();
    _passController?.close();
  }
  
}