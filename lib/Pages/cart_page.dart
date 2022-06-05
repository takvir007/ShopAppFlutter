import 'package:flutter/material.dart';

class Cart extends StatelessWidget {

  static final String routeName = "/cart";
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        elevation: 0,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        title: Text("My Cart"),
      ),
    );
  }
}
