import 'package:flutter/material.dart';
import 'package:grooming_essence/essential_data.dart';
import 'CategoryViewHome.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ListViewCategoryTop extends StatelessWidget {
  final CollectionReference category =
      FirebaseFirestore.instance.collection('productCategory');

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('productCategory')
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Text('Loading');
          }
          return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data?.size,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: CategoryViewHome(
                    snapshot.data?.docs[index]['categoryName'],
                    snapshot.data?.docs[index]['imageLink'],
                  ),
                );
              });
        });
  }
}
