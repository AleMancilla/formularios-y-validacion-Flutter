import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:validacion_de_formulario/src/bloc/Validators.dart';

class LogicBloc with Validators {
  final _emailController = BehaviorSubject<String>();
  final _passController  = BehaviorSubject<String>();

  String get email => _emailController.value;
  String get pass => _passController.value; 

  Stream<String> get emailStream => _emailController.stream.transform(validarEmail);
  Stream<String> get passStream  => _passController.stream.transform(validarPassword);

  Stream<bool> get formValidStream => Observable.combineLatest2(emailStream, passStream, (e,p)=>true);

  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePass => _passController.sink.add;

  dispose(){
    _emailController?.close();
    _passController?.close();
  }
  
}