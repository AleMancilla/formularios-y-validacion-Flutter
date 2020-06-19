import 'dart:convert';
import 'dart:io';
//import 'dart:html';

import 'package:http/http.dart' as http;
import 'package:validacion_de_formulario/src/models/Producto_model.dart';
import 'package:mime_type/mime_type.dart';
import 'package:http_parser/http_parser.dart';


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
  Future<bool> editarProductos(ProductoModel producto)async{
    final url = '$_url/productos/${producto.id}.json';
    final resp = await http.put(url,body: productoModelToJson(producto));
    final decodedData = json.decode(resp.body);
    print(decodedData);
    return true;

  }

  Future<int> borrarProducto(String id)async{
    final url = "$_url/productos/$id.json";
    final resp = await http.delete(url);
    print(resp.body);
    return 1;
  }

  Future<String> subirImagen(File imagen) async {
    final url = Uri.parse("https://api.cloudinary.com/v1_1/alemancilla/image/upload?upload_preset=hhavzkgi");
    final mineType = mime(imagen.path).split('/');
    print("############## mime ###############");
    print(mineType);
    print("############## mime ###############");
    
    final imageUploadRequest = http.MultipartRequest(
      'POST',
      url
    );

    final file = await http.MultipartFile.fromPath(
      'file', 
      imagen.path,
      contentType: MediaType(mineType[0],mineType[1]),
    );

    imageUploadRequest.files.add(file);

    final streamResponse = await imageUploadRequest.send();

    final res = await http.Response.fromStream(streamResponse);

    if(res.statusCode != 200 && res.statusCode != 201){
      print("ALGO SALIO MUUUUUUY MAL");
      print(res.body);
      return null;
    }
    final respData = json.decode(res.body);

    print(respData);

    return respData['secure_url'];

  }
}