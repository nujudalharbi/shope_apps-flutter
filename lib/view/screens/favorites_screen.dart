import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: ListView.separated(
          itemBuilder: (context , index){
            return buildFavItems();
          },
          separatorBuilder: (context ,index){
            return Divider(
              color: Colors.grey,
              thickness: 1,
            );
          },
          itemCount: 10),
    );
  }
  Widget buildFavItems(){

    return Padding(padding: EdgeInsets.all(10));
    
  }
}