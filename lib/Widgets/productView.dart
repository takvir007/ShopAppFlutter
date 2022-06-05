import 'package:flutter/material.dart';
import 'package:grooming_essence/Pages/product_details_page.dart';

class ProductView extends StatelessWidget {
  final String pid;
  final String title;
  final String subTitle;
  final String imageLink;
  final num price;

  //final String id;

  ProductView(this.pid,this.title, this.subTitle, this.imageLink, this.price);

  void changePage(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(ProductFullView.routeName, arguments: {'pid': pid,'title': title, 'subtitle': subTitle, 'imageLink': imageLink, 'price': price});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() => changePage(context)),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Stack(
              //clipBehavior: Clip.hardEdge,
              alignment: Alignment.bottomLeft,
              children: [
                Image.network(imageLink),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    child: Flex(direction: Axis.horizontal, children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 6),
                            child: Text(
                              "4.5",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            width: 1,
                          ),
                          Icon(
                            Icons.star,
                            size: 15,
                            color: Colors.amber,
                          ),
                          VerticalDivider(
                            thickness: 1,
                            color: Colors.black,
                            indent: 5,
                            endIndent: 5,
                          ),
                          Text("25"),
                        ],
                      ),
                    ]),
                    height: 20,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 2,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 3, right: 3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(Icons.favorite_outline_outlined, color: Colors.red, size: 20),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 3.0, right: 3.0),
            child: Text(
              subTitle,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 3.0, right: 3.0),
            child: RichText(
              text: TextSpan(text: "৳",
                  style: DefaultTextStyle.of(context).style,
                  children: [
                TextSpan(
                  text: "$price",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
