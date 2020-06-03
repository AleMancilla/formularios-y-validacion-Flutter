import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _cuerpo(context),
    );
  }

  _cuerpo(BuildContext context) {
    return Stack(
      children: <Widget>[
        _crearFondo(context),
        
        _cabezaFormLogin(context)
      ],
    );
  }

  Widget _crearFondo(BuildContext context){
    final size = MediaQuery.of(context).size;
    return Stack(
      children:<Widget>[
        Container(
        height: size.height*0.4,
        color: Colors.cyan[900],),
        _circulo(10, 25),
        _circulo(250, 125),
        _circulo(200, -10),
        _circulo(25, 110),
        _circulo(150, 80),
      ] 
    );
  }

  Widget _circulo( double x, double y){
    return Positioned(
      left: x,
      top: y,
      child: Container(
        //color: Color.fromRGBO(225, 225, 225, 0.05),
        width: 100.0,
        height: 100.0,
        decoration: BoxDecoration(
          color: Color.fromRGBO(225, 225, 225, 0.05),
          borderRadius: BorderRadius.circular(100.0) 
        ),
      )
    );
  }

  _cabezaFormLogin(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      padding: EdgeInsets.only(top: 60.0),
          child: Column(
            children: <Widget>[

              Icon(Icons.person_pin_circle,color: Colors.white,size: 70.0,),
              SizedBox(height: 10.0,width: double.infinity,),
              Text("Alejandro Mancilla",style: TextStyle(color: Colors.white,fontSize: 20.0),)
            ],
          ),

        );
  }
}