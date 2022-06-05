import 'package:flutter/material.dart';
import 'package:grooming_essence/Pages/offers_page.dart';
import 'package:unicons/unicons.dart';


class CategoryProvider extends ChangeNotifier{
  String categoryType = 'product';
  Icon changeIcon = Icon(UniconsLine.heart);
  Color iconColors = Colors.white;
  int counter =0;
  int totalPrice =0;



  void changeCategory(String newCategory){
    categoryType=newCategory;
    notifyListeners();
  }

  void changeIconFunction(Color colorData){
    if(colorData == Colors.white){
      iconColors=Colors.red;
      changeIcon = Icon(Icons.favorite);
    }
    else if(colorData == Colors.red){
      iconColors= Colors.white;
      changeIcon = Icon(UniconsLine.heart);
    }
    notifyListeners();
  }

  void addProduct(int count, int proPrice){
    counter++;
    totalPrice+=proPrice;
    notifyListeners();
  }

  void removeProduct(int count, int proPrice){
    if(counter!=0){
      counter--;
      totalPrice-=proPrice;
      notifyListeners();
    }
  }

}