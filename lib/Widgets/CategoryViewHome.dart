import 'package:flutter/material.dart';
import 'package:grooming_essence/Widgets/home_product_gridview.dart';
import 'package:grooming_essence/essential_data.dart';
import 'package:grooming_essence/provider_category_name.dart';
import 'package:provider/provider.dart';

class CategoryViewHome extends StatelessWidget {
  final String categoryName;
  final String imageLink;
  String category='dummy';

  CategoryViewHome(this.categoryName, this.imageLink);



  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: () {
        if(categoryName=='Women'){
          category = CategoryList.women;
        }
        if(categoryName=='Men'){
          category = CategoryList.men;
        }
        if(categoryName=='Jewelry'){
          category = CategoryList.jewelry;
        }
        if(categoryName=='Children'){
          category = CategoryList.children;
        }
        if(categoryName=='Footwears'){
          category = CategoryList.foootwear;
        }

        Provider.of<CategoryProvider>(context, listen: false).changeCategory(category);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 70.0,
            height: 70.0,
            decoration: new BoxDecoration(
              shape: BoxShape.circle,
              image: new DecorationImage(
                fit: BoxFit.cover,
                image: new NetworkImage(imageLink),
              ),
            ),
          ),
          SizedBox(
            height: 2,
          ),
          Container(
            child: Text(
              categoryName,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
