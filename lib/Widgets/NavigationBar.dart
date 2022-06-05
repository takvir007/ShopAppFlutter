import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grooming_essence/Pages/cart_page.dart';
import 'package:grooming_essence/Pages/favorite_page.dart';
import 'package:grooming_essence/Pages/offers_page.dart';
import 'package:grooming_essence/googleSignIn.dart';
import 'package:provider/provider.dart';

class NavBar extends StatelessWidget {
  final String photo;
  final String userName;
  final String email;

  NavBar(this.userName, this.email, this.photo);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(photo),
              radius: 40,
            ),
            accountName: Text(userName, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
            accountEmail: Text("Email : $email"),
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage('https://img.freepik.com/free-vector/hand-painted-watercolor-abstract-watercolor-background_52683-68881.jpg?t=st=1654194484~exp=1654195084~hmac=82d426d4d6a39702e3fcfac6b621f881e6fbc949647e7bb65819db5d94a6ea68&w=1380'),
              ),
            ),
          ),
          ListTile(
            leading: Icon(CupertinoIcons.news),
            title: Text("Offers"),
            onTap: (){
              Navigator.of(context).pushNamed(Offers.routeName);
            },
          ),
          ListTile(
            leading: Icon(CupertinoIcons.heart),
            title: Text("Favorites"),
            onTap: (){
              Navigator.of(context).pushNamed(Favorite.routeName);
            },
          ),
          ListTile(
            leading: Icon(CupertinoIcons.cart),
            title: Text("Cart"),
            onTap: (){
              Navigator.of(context).pushNamed(Cart.routeName);
            },
          ),
          ListTile(leading: Icon(CupertinoIcons.settings), title: Text("Settings"), onTap: (){}, ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Log out"),
            onTap: () {
              final provider = Provider.of<GoogleSignInProvide>(context, listen: false);
              provider.logout();
            },
          ),
        ],
      ),
    );
  }
}
