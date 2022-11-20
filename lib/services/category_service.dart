
import 'package:http/http.dart' as http;
import 'package:shop_app/utiils/my_string.dart';

import '../models/category_model.dart';
import '../models/product_model.dart';

//معنى as http استخدمها بشكل مختصر
class CategoryServices{



  static Future <List<String>> getCategory()async{
    var response = await http.get(Uri.parse("$baseUrl/products/categories"));
    if (response.statusCode == 200){

      var jsonData = response.body;
      return categoryModelFromJson(jsonData);

    }else{
      return throw Exception("Failed to load product");
    }

  }

}



class AllCategoryServices{



  static Future <List<ProductModel>> getAllCategory(String categoryName) async{
    var response = await http.get(Uri.parse("$baseUrl/products/category/$categoryName"));
    if (response.statusCode == 200){

      var jsonData = response.body;
      return productModelFromJson(jsonData);

    }else{
      return throw Exception("Failed to load product");
    }

  }

}