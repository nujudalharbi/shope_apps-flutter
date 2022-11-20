import 'package:http/http.dart' as http;
import 'package:shop_app/utiils/my_string.dart';

import '../models/product_model.dart';
//معنى as http استخدمها بشكل مختصر
class ProductServices{
  
  
  
 static Future <List<ProductModel>> getProduct()async{
   var response = await http.get(Uri.parse("$baseUrl/products"));
     if (response.statusCode == 200){

       var jsonData = response.body;
       return productModelFromJson(jsonData);

   }else{
       return throw Exception("Failed to load product");
   }

  }

}


