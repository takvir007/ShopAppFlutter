import 'package:flutter/material.dart';

class Favorite extends StatelessWidget {

  static final String routeName = "/favorite";
  const Favorite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        elevation: 0,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        title: Text("Favorites"),
      ),
    );
  }
}
