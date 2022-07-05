import 'package:ecommerce_int2/app_properties.dart';
import 'package:ecommerce_int2/models/product.dart';
import 'package:flutter/material.dart';

import '../product_page.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  ProductCard(this.product);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: null,
        child: Container(
            height: 250,
            width: MediaQuery.of(context).size.width / 2 - 29,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              // color: lightGrey.withOpacity(0.4)),
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(255, 255, 255, 0.4),
                  offset: Offset(0, 5),
                  blurRadius: 6.0,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    padding: EdgeInsets.all(16.0),
                    width: MediaQuery.of(context).size.width / 2 - 20,
                    height: MediaQuery.of(context).size.width / 2 - 20,
                    child: InkWell(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => ProductPage(product: product))),
                      child: Image.asset(
                        product.image,
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: Align(
                    alignment: Alignment(1, 0.5),
                    child: Container(
                        margin: const EdgeInsets.only(left: 16.0),
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            color: mediumGrey.withOpacity(1),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10))),
                        child: Text(
                          product.name,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.w200),
                        )),
                  ),
                )
              ],
            )));
  }
}

// InkWell(
//       onTap: () => Navigator.of(context).push(
//           MaterialPageRoute(builder: (_) => ProductPage(product: product))),
//       child: Stack(
//         children: <Widget>[
//           Container(
//             margin: const EdgeInsets.only(right: 40),
//             height: height,
//             width: width,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.all(Radius.circular(24)),
//               color: galaxyPurple,
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.end,
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 IconButton(
//                   icon: Icon(Icons.favorite_border),
//                   onPressed: () {},
//                   highlightColor: Colors.red,
//                   color: Color.fromARGB(255, 249, 248, 248),
//                 ),
//                 Column(
//                   children: <Widget>[
//                     Align(
//                         alignment: Alignment.topLeft,
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Text(
//                             product.name,
//                             style:
//                                 TextStyle(color: Colors.white, fontSize: 16.0),
//                           ),
//                         )),
//                     Align(
//                       alignment: Alignment.topRight,
//                       child: Container(
//                         margin: const EdgeInsets.only(bottom: 12.0),
//                         padding: const EdgeInsets.fromLTRB(8.0, 4.0, 12.0, 4.0),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.only(
//                               topLeft: Radius.circular(10),
//                               bottomLeft: Radius.circular(10)),
//                           color: Color.fromARGB(255, 210, 21, 21),
//                         ),
//                         child: Text(
//                           '\$${product.price}',
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                     ),
//                   ],
//                 )
//               ],
//             ),
//           ),
//           Positioned(
//             child: Hero(
//               tag: product.image,
//               child: Image.asset(
//                 product.image,
//                 height: height / 1.4,
//                 width: width / 1.35,
//                 fit: BoxFit.contain,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );