import 'package:flutter/material.dart';
import 'package:validacion_de_formulario/src/bloc/Provider.dart';
import 'package:validacion_de_formulario/src/models/Producto_model.dart';
import 'package:validacion_de_formulario/src/providers/productos_provider.dart';

class HomePage extends StatelessWidget {

  final productosProvider = ProductosProvider();
  @override
  Widget build(BuildContext context) {
    //final bloc = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("AppBar"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.image), onPressed: (){}),
          IconButton(icon: Icon(Icons.camera_alt), onPressed: (){}),
        ],
      ),
      body: _cargarProductos(),
//      body: Center(
//        child: Column(
//          crossAxisAlignment: CrossAxisAlignment.center,
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            Text("Email: ${bloc.email}"),
//            Divider(),
//            Text("Pass: ${bloc.pass}")
//          ],
//        ),
//      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: ()=>Navigator.pushNamed(context, "/producto"),
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _cargarProductos() {
    return FutureBuilder(
      future: productosProvider.cargarProductos(),
      builder: (BuildContext context, AsyncSnapshot<List<ProductoModel>> lista){
        return Container(
          child: Column(
            children: <Widget>[
              Text(lista.data[0].id)
            ],
          ),
        );
      }
    );
  }
}