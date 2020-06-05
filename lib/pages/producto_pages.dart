import 'package:flutter/material.dart';
import 'package:validacion_de_formulario/utils/utils.dart'as utils;

class ProductoPage extends StatefulWidget {
  
  

  @override
  _ProductoPageState createState() => _ProductoPageState();
}

class _ProductoPageState extends State<ProductoPage> {
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("AppBar"),
      actions: <Widget>[
        IconButton(icon: Icon(Icons.photo_size_select_actual),onPressed: (){},),
        IconButton(icon: Icon(Icons.camera_alt),onPressed: (){},),
      ],),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Form(
            key: formkey,
            child: Column(
              children: <Widget>[
                _crearNombre(),
                _crearPrecio(),
                _crearBoton(),
              ],
            )
          ),
        ),
      ),
    );
  }

  _crearNombre() {
    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Producto'
      ),
      validator: (value){
        if(value.length <3){
          return 'Ingrese el nombre del producto';
        }else{
          return null;
        }
      },
    );
  }

  _crearPrecio() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: 'Producto'
      ),
      validator: (value){
        if(utils.isNumeric(value)){
          return null;
        }else{
          return "Solo Numeros";
        }
      },
    );
  }

  _crearBoton(){
    return RaisedButton.icon(
      onPressed: _submit(), 
      icon: Icon(Icons.save), 
      textColor: Colors.white,
      label: Text("Guardar"),
      color: Colors.deepPurple,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0)
      ),
      
    );
  }
  _submit(){
    if(!formkey.currentState.validate()) return;

    print("Todo Ok");
  }
}