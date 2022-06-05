import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:grooming_essence/Pages/favorite_page.dart';
import 'package:grooming_essence/Pages/offers_page.dart';
import 'package:grooming_essence/Pages/user_profile.dart';
import 'package:grooming_essence/Widgets/NavigationBar.dart';
import 'package:grooming_essence/Widgets/home_product_gridview.dart';
import 'package:grooming_essence/Widgets/top_category_listview.dart';
import 'package:unicons/unicons.dart';

import 'cart_page.dart';


class HomePage extends StatefulWidget {
  static const String homepage = '/home_page';
  static String collectionName='productMen';
  static const String titleName = "Grooming Esscence";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser;
  int colorIndex = 0;

  @override
  Widget build(BuildContext context) {
    final photo = user?.photoURL;
    final userName = user?.displayName;
    final email = user?.email;
    //final userID = user?.uid;



    return Scaffold(
      drawer: SizedBox(
        width: MediaQuery.of(context).size.width / 1.4,
        child: NavBar(userName!, email!, photo!),
      ),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(Cart.routeName);
            },
            icon: Icon(UniconsLine.shopping_bag,
            color: Colors.black87,),
          )
        ],
        elevation: 0,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        title: Text(HomePage.titleName),

      ),
      bottomNavigationBar:
      BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: colorIndex,
        selectedItemColor: Colors.pink,
        unselectedItemColor: Colors.black45,
        onTap: (val)=>{
          setState(()=>{
            colorIndex=val,
            if(val==1){
              Navigator.of(context).pushNamed(Offers.routeName),
            },
            if(val==2){
              Navigator.of(context).pushNamed(Favorite.routeName),
            },
            if(val==3){
              Navigator.of(context).pushNamed(UserProfile.routeName, arguments: {'name': userName, 'imageLink' : photo, 'email' : email }),
            }

          }),
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.news),
            label: 'Offers',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.heart),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.profile_circled),
            label: 'Profile',
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 100,
            child: ListViewCategoryTop(),),
          Divider(),
          SizedBox(height: 8,),
          Expanded(child: ProductGridView(),),
        ],
      ),
    );
  }
}
