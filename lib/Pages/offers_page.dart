import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:grooming_essence/Pages/offer_details.dart';
import 'package:unicons/unicons.dart';


class Offers extends StatefulWidget {
  static final routeName = "/offers";

  @override
  State<Offers> createState() => _OffersState();

}

class _OffersState extends State<Offers> {

  void changePage(String imageLink, String offerDetail, Timestamp date){
    Navigator.of(context).pushNamed(OfferDetails.routeName, arguments: {'imageLink': imageLink, 'offerDetail' : offerDetail, 'date': date});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        title: Text("Offers"),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('offerList').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(color: Colors.pink,),);
          }
          if(snapshot.hasError){
            return Center(child: Text("Connection Error"),);
          }
          if (!snapshot.hasData) {
            return Text('Loading');
          }
          return ListView.builder(
              itemCount: snapshot.data?.size,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index){
                return Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5, bottom: 5),
                  child: InkWell(
                    onTap: () => changePage(snapshot.data?.docs[index]['imageLink'], snapshot.data?.docs[index]['offerDetail'], snapshot.data?.docs[index]['date']),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(snapshot.data?.docs[index]['imageLink']),
                    ),
                  ),
                );
              }
          );
        },
      ),
    );
  }
}
