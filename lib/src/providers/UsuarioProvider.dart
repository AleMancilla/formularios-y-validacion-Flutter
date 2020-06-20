import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:validacion_de_formulario/src/preferencias_usuario/Preferencias_usuario.dart';
class UsuarioProvider{

  final String _firebaseToken = 'AIzaSyAUsGYun0_Emv91oW7hG9Ax9ZEA_9dnfO0';
  final _prefs = new PreferenciasUsuario();

  Future<Map<String,dynamic>> nuevoUsuario(String email, String pasword)async{
    final autData ={
      'email': email,
      'password': pasword,
      'returnSecureToken':true
    };
    final resp = await http.post(
      "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$_firebaseToken",
      body: json.encode(autData)
    );

    Map<String, dynamic> decodeResp = json.decode(resp.body);

    print(decodeResp);

    if(decodeResp.containsKey('idToken')){

      _prefs.token = decodeResp['idToken'];
      
      return { 'ok':true , 'token':decodeResp['idToken']};
    }else{
      return { 'ok':false , 'token':decodeResp['error']['message']};
    }
  }

  //#######################################################
  Future<Map<String,dynamic>> login(String email, String pasword)async{
    final autData ={
      'email': email,
      'password': pasword,
      'returnSecureToken':true
    };
    final resp = await http.post(
      "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$_firebaseToken",
      body: json.encode(autData)
    );

    Map<String, dynamic> decodeResp = json.decode(resp.body);

    print(decodeResp);

    if(decodeResp.containsKey('idToken')){

      
      _prefs.token = decodeResp['idToken'];

      return { 'ok':true , 'token':decodeResp['idToken']};
    }else{
      return { 'ok':false , 'token':decodeResp['error']['message']};
    }
  }
}