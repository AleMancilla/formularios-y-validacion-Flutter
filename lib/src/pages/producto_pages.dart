import 'package:flutter/material.dart';
import 'package:validacion_de_formulario/src/models/Producto_model.dart';
import 'package:validacion_de_formulario/src/providers/productos_provider.dart';
import 'package:validacion_de_formulario/src/utils/utils.dart'as utils;

class ProductoPage extends StatefulWidget {
  
  

  @override
  _ProductoPageState createState() => _ProductoPageState();
}

class _ProductoPageState extends State<ProductoPage> {
  
  final formkey = GlobalKey<FormState>();
  ProductoModel producto = ProductoModel();
  final productoProvider = ProductosProvider();

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
                _crearDisponible(),
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
      initialValue: producto.titulo,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Producto'
      ),
      onSaved: (value) => producto.titulo = value,
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
      initialValue: producto.valor.toString(),
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: 'Producto',
        
      ),
      onSaved: (value) => producto.valor = double.parse(value),
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
      onPressed: _submit, 
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
    formkey.currentState.save();
    print("Todo Ok");
    print(producto.titulo);
    print(producto.valor);
    print(producto.disponible);
    productoProvider.createProducto(producto);
    
  }

  _crearDisponible(){
    return SwitchListTile(
      value: producto.disponible, 
      title: Text("Disponible"),
      activeColor: Colors.deepPurple,
      onChanged: (value) => setState((){
        producto.disponible = value;
      })
    );
  }
}