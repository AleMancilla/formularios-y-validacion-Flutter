import 'package:flutter/material.dart';
import 'package:validacion_de_formulario/src/bloc/Provider.dart';

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
        _cabezaFormLogin(context),
        _loginArea(context),
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
    return Container(
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

  _loginArea(BuildContext context) {
    final bloc = Provider.of(context);
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 50.0),
      child: Column(
        children: <Widget>[
          SafeArea(child: Container(height: 100.0,)),
          Container(
            width: size.width * 0.9,
            margin: EdgeInsets.symmetric(vertical: 15.0),
            padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 30.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 3.0,
                  offset: Offset(0.0, 5.0),
                  spreadRadius: 3.0
                )
              ]
            ),
            child: Column(
              children: <Widget>[
                Text("Ingreso",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w600),),
                _crearCorreo(bloc),
                _crearPass(bloc),
                _boton(bloc),
                
              ],
            ),
          ),
          Text("Olvido su contraseña?")
        ],
      ),
    );
  }

  _crearCorreo(LogicBloc bloc) {

    return StreamBuilder(
      stream: bloc.emailStream,
      builder: (BuildContext context,AsyncSnapshot snapshot){
        return Container(
          padding: EdgeInsets.only(top: 10.0),
          child: TextField(
            obscureText: false,
            decoration: InputDecoration(
              icon: Icon(Icons.alternate_email,color: Colors.deepPurple,),
              labelText: "Correo Electronico",
              counterText: snapshot.data,
              hintText: "ejemplo@correo.com",
              errorText: snapshot.error
            ),
            onChanged: (value) => bloc.changeEmail(value),
          ),
        );
      },

    );

    
  }
  
  _crearPass(LogicBloc bloc) {

    return StreamBuilder(
      stream: bloc.passStream,      
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return Container(
          margin: EdgeInsets.only(bottom: 10.0),
          padding: EdgeInsets.only(top: 10.0),
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
              icon: Icon(Icons.lock_outline,color: Colors.deepPurple,),
              labelText: "Contraseña",
              counterText: snapshot.data,
              errorText: snapshot.error
            ),
            onChanged: bloc.changePass,
          ),
        );

      }
    );

  }

  _boton(bloc) {

    return StreamBuilder(
      stream: bloc.formValidStream,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return RaisedButton(
          onPressed: snapshot.hasData?(){}:null,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 80.0,vertical: 15.0),
            child: Text("Ingresar"),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0)
          ),
          elevation: 0.0,
          color: Colors.deepPurple,
          textColor: Colors.white,

        );
      }
    );

    
  }
}