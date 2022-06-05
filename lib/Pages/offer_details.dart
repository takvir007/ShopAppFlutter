import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class OfferDetails extends StatelessWidget {
  static final String routeName = "/offerDetail";

  @override
  Widget build(BuildContext context) {

    final route = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final String imageLink= route['imageLink'];
    final String offerDetail = route['offerDetail'];
    final Timestamp date=route['date'];

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        title: Text("Offers Description"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(imageLink),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(offerDetail,
            style: TextStyle(
              fontSize: 16,
            ),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text.rich(TextSpan(
              children: [
                TextSpan(text: "Offer Ends On: ",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),),
                TextSpan(text: date.toDate().toString(),
                  style: TextStyle(
                    fontSize: 18,
                  ),

                ),

              ],
            )),
          ),
        ],
      ),
    );
  }
}
