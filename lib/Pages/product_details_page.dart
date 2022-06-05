import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grooming_essence/provider_category_name.dart';
import 'package:provider/provider.dart';
import 'package:unicons/unicons.dart';
import 'package:material_segmented_control/material_segmented_control.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductFullView extends StatefulWidget {
  static final String routeName = '/product_full_view';

  @override
  State<ProductFullView> createState() => _ProductFullViewState();
}

class _ProductFullViewState extends State<ProductFullView> {
  @override
  Widget build(BuildContext context) {
    Color iColor = Provider.of<CategoryProvider>(context).iconColors;
    Icon favIcon = Provider.of<CategoryProvider>(context).changeIcon;
    int counter = Provider.of<CategoryProvider>(context).counter;
    int totalPrice = Provider.of<CategoryProvider>(context).totalPrice;

    Map<int, Widget> _sizes = {
      0: Text('S'),
      1: Text('M'),
      2: Text('L'),
      3: Text('XL'),
      4: Text("XXL"),
    };
    int? currentSelection = 0;
    final route =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    int price = route['price'];
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                //clipBehavior: Clip.hardEdge,
                alignment: Alignment.topLeft,
                children: [
                  Image.network(
                    route['imageLink']!,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 7, left: 7, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: Icon(UniconsLine.arrow_left),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          color: Colors.white,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: favIcon,
                              onPressed: () {
                                Provider.of<CategoryProvider>(context,
                                        listen: false)
                                    .changeIconFunction(iColor);
                              },
                              color: iColor,
                            ),
                            IconButton(
                              icon: Icon(UniconsLine.shopping_bag),
                              onPressed: () {},
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: route['title'],
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blueGrey[800]),
                          ),
                          TextSpan(
                            text: ' ',
                          ),
                          TextSpan(
                            text: route['subtitle'],
                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ),

                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "BDT. ",
                            style: TextStyle(fontSize: 16),
                          ),
                          TextSpan(
                            text: "$price",
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text('Color Options: ', style: TextStyle(
                              fontSize: 15,
                            ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 3),
                              width: 25.0,
                              height: 25.0,
                              decoration: new BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.amber,
                                border: Border.all(color: Colors.white60, width: 2),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 3),
                              width: 25.0,
                              height: 25.0,
                              decoration: new BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.pinkAccent,
                                border: Border.all(color: Colors.white60, width: 2),
                              ),
                            ),
                            Container(
                              width: 25.0,
                              height: 25.0,
                              decoration: new BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.deepPurple,
                                border: Border.all(color: Colors.white60, width: 2),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              height: 25,
                              width: 25,
                              child: FloatingActionButton(
                                heroTag: 'removebtn',
                                elevation: 0,
                                onPressed: () {
                                  Provider.of<CategoryProvider>(context,
                                      listen: false).removeProduct(counter, route['price']);
                                },
                                backgroundColor: Colors.pink,
                                child: Icon(
                                  Icons.remove,
                                  size: 20,
                                ),
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.all(10),
                                child: Text('$counter', style: TextStyle(
                                  fontSize: 15,
                                ),),),
                            SizedBox(
                              height: 25,
                              width: 25,
                              child: FloatingActionButton(
                                heroTag: 'addButton',
                                elevation: 0,
                                onPressed: () {
                                  Provider.of<CategoryProvider>(context,
                                      listen: false).addProduct(counter, route['price']);
                                },
                                backgroundColor: Colors.pink,
                                child: Icon(
                                  Icons.add,
                                  size: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Size: ",
                        style: TextStyle(fontSize: 15),),
                        Container(
                          height: 50,
                          width: 200,
                          child: MaterialSegmentedControl(
                            children: _sizes,
                            selectedColor: Colors.pink,
                            unselectedColor: Colors.white,
                            borderColor: Colors.black38,
                            borderRadius: 10,
                            selectionIndex: currentSelection,
                            onSegmentChosen: (index){
                              setState(() {
                                currentSelection!= index;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          height: 60,
          child: BottomAppBar(
            elevation: 50,
            child: Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'BDT. $totalPrice',
                    style: TextStyle(fontSize: 18),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        onPrimary: Colors.white, primary: Colors.pink),
                    onPressed: () {},
                    child: Text("Place Order"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
