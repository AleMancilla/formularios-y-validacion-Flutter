import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:validacion_de_formulario/pages/HomePage.dart';
import 'package:validacion_de_formulario/pages/LoginPage.dart';
import 'package:validacion_de_formulario/pages/producto_pages.dart';
import 'package:validacion_de_formulario/src/bloc/Provider.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        initialRoute: "/login",
        routes: {
          "/home" : (BuildContext context) => HomePage(),
          "/login": (BuildContext context) => LoginPage(),
          "/producto": (BuildContext context) => ProductoPage(),
        },
        theme: ThemeData(
          primaryColor: Colors.deepPurple
        ),
      ),
    );
  }
}