import 'package:flutter/material.dart';
import 'package:validacion_de_formulario/src/pages/HomePage.dart';
import 'package:validacion_de_formulario/src/pages/Login_Page.dart';
import 'package:validacion_de_formulario/src/pages/Registro_Page.dart';
import 'package:validacion_de_formulario/src/pages/producto_pages.dart';
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
          "/registro": (BuildContext context) => RegistroPage(),
          "/producto": (BuildContext context) => ProductoPage(),
        },
        theme: ThemeData(
          primaryColor: Colors.deepPurple
        ),
      ),
    );
  }
}