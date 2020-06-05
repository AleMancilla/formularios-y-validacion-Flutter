import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:validacion_de_formulario/src/models/Producto_model.dart';

class ProductosProvider{
  final String _url = 'https://fir-sstorage-ca3d8.firebaseio.com';

  Future<bool> createProducto(ProductoModel producto)async{
    final url = '$_url/productos.json';
    final resp = await http.post(url,body: productoModelToJson(producto));
    final decodedData = json.decode(resp.body);
    print(decodedData);
    return true;

  }
}