import 'package:flutter/material.dart';

class ProductoPage extends StatelessWidget {
  const ProductoPage({Key key}) : super(key: key);

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
    );
  }

  _crearPrecio() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: 'Producto'
      ),
    );
  }

  _crearBoton(){
    return RaisedButton.icon(
      onPressed: (){}, 
      icon: Icon(Icons.save), 
      textColor: Colors.white,
      label: Text("Guardar"),
      color: Colors.deepPurple,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0)
      ),
    );
  }
}