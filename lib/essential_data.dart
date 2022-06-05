import 'package:flutter/material.dart';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';



class CategoryList{
  static String men = 'productMen';
  static String women = 'product';
  static String children = 'productChildren';
  static String foootwear = 'productFootwear';
  static String jewelry = 'productJewelry';

}

class User{
  static final String userDataSync = '/data_sync';

  final String uid;
  final String userName;
  final String email;
  final String photoLink;

  User({required this.uid, required this.userName, required this.email, required this.photoLink});

  Map <String, String> toJosn() => {
    'uid': uid,
    'userName': userName,
    'email': email,
    'photoLink': photoLink,
  };

  static User fromJson (Map<String, dynamic> json) => User(
    uid: json['uid'],
    userName: json['userName'],
    email: json['email'],
    photoLink: json['photoLink'],
  );

}

//Stream <List<User>> readUsers() => FirebaseFirestore.instance.collection('userCollection').snapshots().map((snapshot)=>snapshot.docs.map((doc)=> User.fromJson(doc.data())).toList());

Future productCategory({required String product}) async {
  final docUser = FirebaseFirestore.instance
      .collection('productCategory')
      .doc(Random().nextInt(9999999).toString());
  final json = {
    'productName': product,
    'price': {
      'decimal': 789,
      'floating': 0.58,
    },
    'quantity': 11,
  };
  await docUser.set(json);
}

Future userLoggedIn({required String name, required String email, required String photoLink, required String userID}) async{
  final randomID = Random().nextInt(9999).toString();
  final userLog = FirebaseFirestore.instance.collection("userLoggedIn").doc(randomID);


  final user = User(uid: userID, userName: name, email: email, photoLink: photoLink);



  final json = user.toJosn();
  await userLog.set(json);
}

class UserDataSync extends StatelessWidget {
  const UserDataSync({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> users = FirebaseFirestore.instance.collection('userCollection').snapshots();

   StreamBuilder<QuerySnapshot> (
     stream: users,
     builder:(BuildContext context, AsyncSnapshot <QuerySnapshot> snapshot,) {
       if (snapshot.hasError) {
         return Text("Has Error");
       }
       if (snapshot.connectionState == ConnectionState.waiting) {
         return Text("Waiting");
       }
       final data = snapshot.requireData;

       return Text("Finally");
     }
   );
    return Scaffold(
      body: Center(
        child: Text("asd"),
      ),
    );
  }
}



