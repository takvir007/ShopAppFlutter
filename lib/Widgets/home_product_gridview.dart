import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:grooming_essence/Widgets/productView.dart';
import 'package:grooming_essence/provider_category_name.dart';
import 'package:provider/provider.dart';



class ProductGridView extends StatefulWidget {

  static String collectionType = 'product';

  @override
  State<ProductGridView> createState() => _ProductGridViewState();
}

class _ProductGridViewState extends State<ProductGridView> {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection(Provider.of<CategoryProvider>(context).categoryType).snapshots() ,
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){
          if(!snapshot.hasData){
            return Center(child: CircularProgressIndicator(color: Colors.pink,),);
          }
          if (snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(color: Colors.pink,),);
          }
          final gridData = snapshot.data;
          return GridView.builder(
            itemCount: snapshot.data!.size,
            itemBuilder: (context, index){
              return ProductView(gridData?.docs[index]['pid'],gridData?.docs[index]['productTitle'], gridData?.docs[index]['productSubtitle'], gridData?.docs[index]['imageLink'], gridData?.docs[index]['price']);
            },
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 5.5,
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
            ),
          );
        }
    );
  }
}

