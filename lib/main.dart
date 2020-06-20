import 'package:flutter/material.dart';
import 'package:validacion_de_formulario/src/pages/HomePage.dart';
import 'package:validacion_de_formulario/src/pages/Login_Page.dart';
import 'package:validacion_de_formulario/src/pages/Registro_Page.dart';
import 'package:validacion_de_formulario/src/pages/producto_pages.dart';
import 'package:validacion_de_formulario/src/bloc/Provider.dart';
import 'package:validacion_de_formulario/src/preferencias_usuario/Preferencias_usuario.dart';
 
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();
  runApp(MyApp());
} 
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final prefs = new PreferenciasUsuario();
    print(prefs.token);

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