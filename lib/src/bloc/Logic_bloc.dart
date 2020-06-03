import 'dart:async';

class LogicBloc{
  final _emailController = StreamController<String>.broadcast();
  final _passController  = StreamController<String>.broadcast();

  Stream<String> get emailStream => _emailController.stream;
  Stream<String> get passStream  => _passController.stream;

  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePass => _passController.sink.add;

  dispose(){
    _emailController?.close();
    _passController?.close();
  }
  
}