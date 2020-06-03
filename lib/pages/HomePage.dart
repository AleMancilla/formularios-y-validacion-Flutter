import 'package:flutter/material.dart';
import 'package:validacion_de_formulario/src/bloc/Provider.dart';

class HomePage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("AppBar"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Email: ${bloc.email}"),
            Divider(),
            Text("Pass: ${bloc.pass}")
          ],
        ),
      ),
    );
  }
}