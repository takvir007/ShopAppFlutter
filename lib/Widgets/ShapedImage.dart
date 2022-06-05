import 'package:flutter/material.dart';

class ShapedImage extends StatelessWidget {

  final String link;
  ShapedImage(this.link);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: NetworkImage(link),
        ),
        borderRadius: BorderRadius.circular(30),
      ),
    );
  }
}
