import 'package:flutter/material.dart';
import 'package:validacion_de_formulario/src/bloc/Logic_bloc.dart';
export 'package:validacion_de_formulario/src/bloc/Logic_bloc.dart';

class Provider extends InheritedWidget{

  static Provider _instancia;

  factory Provider ({Key key, Widget child}){
    if( _instancia == null){
      _instancia = new Provider._internal(key:key, child:child);
    }
    return _instancia;
  }


  final loginBloc = LogicBloc();

  Provider._internal({ Key key,Widget child}):super(key: key,child : child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
  
  static LogicBloc of (BuildContext context) {
    return (context.inheritFromWidgetOfExactType(Provider) as Provider).loginBloc;
  }
  }