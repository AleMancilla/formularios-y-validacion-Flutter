import 'package:flutter/material.dart';
import 'package:validacion_de_formulario/src/bloc/Provider.dart';

class HomePage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("AppBar"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.image), onPressed: (){}),
          IconButton(icon: Icon(Icons.add), onPressed: (){}),
        ],
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: ()=>Navigator.pushNamed(context, "/producto"),
        child: Icon(Icons.add),
      ),
    );
  }
}