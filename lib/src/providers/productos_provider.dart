import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:validacion_de_formulario/src/models/Producto_model.dart';

class ProductosProvider{
  final String _url = 'https://flutter-81e76.firebaseio.com';
  List<ProductoModel> productos = new List() ;
  Future<bool> createProducto(ProductoModel producto)async{
    final url = '$_url/productos.json';
    final resp = await http.post(url,body: productoModelToJson(producto));
    final decodedData = json.decode(resp.body);
    print(decodedData);
    return true;

  }

  Future<List<ProductoModel>> cargarProductos()async {
    final url = '$_url/productos.json';
    final resp = await http.get(url);
    final decodedata = json.decode(resp.body);
    
    if (decodedata == null) return [];
    
    decodedata.forEach((id, prod){
      final prodTemp = ProductoModel.fromJson(prod);
      prodTemp.id = id;
      productos.add(prodTemp);
    });
    return productos;
  }
}