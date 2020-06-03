import 'package:flutter/material.dart';
import 'package:validacion_de_formulario/src/bloc/Logic_bloc.dart';

class Provider extends InheritedWidget{
  final loginBloc = LogicBloc();

  Provider({ Key key,Widget child}):super(key: key,child : child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
  
  static LogicBloc of (BuildContext context) {
    return (context.inheritFromWidgetOfExactType(Provider) as Provider).loginBloc;
  }
  }