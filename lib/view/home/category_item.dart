import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interview/data/category.dart';
import 'package:interview/view/list/list_page.dart';

class CategoryItem extends StatelessWidget{
  final CategoryResponse categoryResponse;
  const CategoryItem(this.categoryResponse);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
          margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
          height: 60,
          child: DecoratedBox(
            decoration: BoxDecoration(
                color: Colors.white
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                  child: Text(
                    categoryResponse.name,
                    style: TextStyle(fontSize: 16),
                  ),
                ),Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 15, 0),
                  child: CachedNetworkImage(width: 30,height: 30,imageUrl: categoryResponse.iconUrl,),
                )
              ],
            ),
          )
      ),
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>
            ListPage(categoryId:categoryResponse.id,category: categoryResponse.name)));
      },
    );
  }
  
}