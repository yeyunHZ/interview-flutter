import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interview/data/article.dart';
import 'package:interview/data/category.dart';
import 'package:interview/view/detail/detail_page.dart';
import 'package:interview/view/list/list_page.dart';

class ArticleItem extends StatelessWidget{
  final ArticleResponse articleResponse;
  const ArticleItem(this.articleResponse);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
          margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
          height: 120,
          child: DecoratedBox(
            decoration: BoxDecoration(
                color: Colors.white
            ),
            child: Container(
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    child: Text(articleResponse.title
                      ,style: TextStyle(fontSize: 16),
                      maxLines: 3,
                 ),
                  ),
                  Row(
                    children: [
                      Text("${articleResponse.viewNum}",style: TextStyle(fontSize: 12,color: Colors.grey),),
                      Image.asset("images/eye.png",width: 20,height: 20,)
                    ],
                  )
                ],
              ),
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            ),
          )
      ),
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>
            DetailPage(articleId: articleResponse.id,categoryId: articleResponse.categoryId,)));
      },
    );
  }
  
}