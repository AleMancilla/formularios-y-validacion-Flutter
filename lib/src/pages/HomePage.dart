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
      builder: (BuildContext context, AsyncSnapshot<List<ProductoModel>> snapshot){
        if(snapshot.hasData){
          final productos = snapshot.data;
          return ListView.builder(
            itemCount: productos.length,
            itemBuilder: (context,i)=>_crearItem(context,productos[i])
          );
        }else{
          return CircularProgressIndicator();
        }
      }
    );
  }

  _crearItem(BuildContext context, ProductoModel producto) {
    return Dismissible(
      key: UniqueKey(),
      background: Container(color: Colors.redAccent,),
      child: Column(
        children: <Widget>[
          FadeInImage(fit: BoxFit.cover,height: 300.0, placeholder: AssetImage("images/jar-loading.gif"), image: producto.fotoUrl==null?AssetImage("images/no-image.png") : NetworkImage(producto.fotoUrl)),
          ListTile(
            title: Text("${producto.titulo} - ${producto.valor}"),
            subtitle: Text(producto.id),
            onTap: ()=>Navigator.pushNamed(context, '/producto',arguments: producto),

          ),
        ],
      ),
      //child: ListTile(
      //  title: Text("${producto.titulo} - ${producto.valor}"),
      //  subtitle: Text(producto.id),
      //  onTap: ()=>Navigator.pushNamed(context, '/producto',arguments: producto),
      //  
      //),
      onDismissed: (direccion){
        productosProvider.borrarProducto(producto.id);
      },
    );   
  }
}