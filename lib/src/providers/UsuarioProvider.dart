import 'dart:convert';

import 'package:http/http.dart'as http;
class UsuarioProvider{

  final String _firebaseToken = 'AIzaSyAUsGYun0_Emv91oW7hG9Ax9ZEA_9dnfO0';

  Future nuevoUsuario(String email, String pasword)async{
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
      return { 'ok':true , 'token':decodeResp['idToken']};
    }else{
      return { 'ok':false , 'token':decodeResp['error']['message']};
    }
  }
}