//import 'dart:html';

//import 'dart:html';

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:validacion_de_formulario/src/models/Producto_model.dart';
import 'package:validacion_de_formulario/src/providers/productos_provider.dart';
import 'package:validacion_de_formulario/src/utils/utils.dart'as utils;
import 'package:image_picker/image_picker.dart';

class ProductoPage extends StatefulWidget {
  
  

  @override
  _ProductoPageState createState() => _ProductoPageState();
}

class _ProductoPageState extends State<ProductoPage> {
  
  final formkey = GlobalKey<FormState>();
  ProductoModel producto = ProductoModel();
  final productoProvider = ProductosProvider();
  final scafooldkey = GlobalKey<ScaffoldState>() ;
  bool _guardando = false;
  //final _picker = ImagePicker();
  File foto ;
  
  @override
  Widget build(BuildContext context) {

    final ProductoModel prodModel = ModalRoute.of(context).settings.arguments;
    if(prodModel != null){
      producto = prodModel;
    }
    return Scaffold(
      key: scafooldkey,
      appBar: AppBar(title: Text("AppBar"),
      actions: <Widget>[
        IconButton(icon: Icon(Icons.photo_size_select_actual),onPressed: _seleccionarFoto,),
        IconButton(icon: Icon(Icons.camera_alt),onPressed: _tomarFoto,),
      ],),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Form(
            key: formkey,
            child: Column(
              children: <Widget>[
                _mostrarFoto(),
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
      onPressed: _guardando? null : _submit, 
      icon: Icon(Icons.save), 
      textColor: Colors.white,
      label: Text("Guardar"),
      color: Colors.deepPurple,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0)
      ),
      
    );
  }
  _submit()async{
    if(!formkey.currentState.validate()) return;
    formkey.currentState.save();
    print("Todo Ok");
    print(producto.titulo);
    print(producto.valor);
    print(producto.disponible);
    _guardando = true;
    setState(() {    });

    if(foto!=null){
      producto.fotoUrl = await productoProvider.subirImagen(foto);
    }
      print("###################3id#############");
      print(producto.id);
    if(producto.id == null){
      productoProvider.createProducto(producto);
    }else{
      productoProvider.editarProductos(producto);
    }

    mostrarSnackbar("Guardado Exitosamente");
    Navigator.pop(context);
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

  void mostrarSnackbar(String mensaje){
    final snack = SnackBar(
      content: Text(mensaje),
      duration: Duration(seconds: 2),
    );
    scafooldkey.currentState.showSnackBar(snack);
  }

  _mostrarFoto(){
    if(producto.fotoUrl != null){
      //TODO tengo que hacer esto
      return FadeInImage(
        placeholder: AssetImage("images/jar-loading.gif"), 
        image: NetworkImage(producto.fotoUrl),
        fit: BoxFit.cover,
        height: 300,
      );
    }else{
      return Image(
        image: AssetImage(foto?.path ??"images/no-image.png"),
        height: 300.0,
        fit: BoxFit.cover
      );
    }
  }

  _seleccionarFoto() {
    _procesarImagen(ImageSource.gallery);
  }
  _tomarFoto(){
    _procesarImagen(ImageSource.camera);
  }

  _procesarImagen(ImageSource tipo)async{
    
    foto = await ImagePicker.pickImage(source: tipo);
    if(foto != null ){
      //limpiesa
      producto.fotoUrl = null; 
    }
    setState(() { });
  }
}