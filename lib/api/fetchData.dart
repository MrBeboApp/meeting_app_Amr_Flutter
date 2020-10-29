import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:metting_app/api/productModel.dart';

class FetchData{


  Future <List<ProductModel>> fetchProducts() async {

    String url = "http://192.168.1.5:1337/products";

    http.Response response =  await http.get(url);

    if(response.statusCode == 200){
      var body = jsonDecode(response.body);
      List  <ProductModel> products = [];
      for(var item in body) {
        products.add(ProductModel.fromJason(item));
      }
      return products;
    }
    return null;


  }



}