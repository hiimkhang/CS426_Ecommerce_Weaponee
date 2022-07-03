import 'package:ecommerce_int2/app_properties.dart';
import 'package:ecommerce_int2/models/product.dart';
import 'package:ecommerce_int2/screens/product/components/product_card.dart';
import 'package:flutter/material.dart';

class MoreProducts extends StatelessWidget {
  final List<Product> products = [
    Product(
        'assets/m9_golden.png',
        'M9 Bayonet Tiger Tooth',
        'The M9 Bayonet is based off of the Smith and Wesson SW3B, a knife designed after the original real-life M9 Bayonet and features a serrated blade, and is only named after the M9 Bayonet. Originally intended to be mounted on a rifle, it is also well suited to close-quarters combat.',
        819),
    Product(
        'assets/flip_red.png',
        'Flip Knife Hellfire',
        'Flip knives sport a Persian-style back-swept blade with an acute point. While the point itself may be fragile, the overall design of the flip knife'
            's design is surprisingly durable.',
        399),
    Product(
        'assets/karambit_purple.png',
        'Karambit Fade',
        'With its curved blade mimicking a tiger'
            's claw, the karambit was developed as part of the southeast Asian martial discipline of silat. The knife is typically used with a reverse grip, with the finger ring on the index finger.',
        699),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 24.0, bottom: 8.0),
          child: Text(
            'More products',
            style: TextStyle(color: Colors.white, shadows: shadow),
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 20.0),
          height: 250,
          child: ListView.builder(
            itemCount: products.length,
            itemBuilder: (_, index) {
              return Padding(

                  ///calculates the left and right margins
                  ///to be even with the screen margin
                  padding: index == 0
                      ? EdgeInsets.only(left: 24.0, right: 8.0)
                      : index == 4
                          ? EdgeInsets.only(right: 24.0, left: 8.0)
                          : EdgeInsets.symmetric(horizontal: 8.0),
                  child: ProductCard(products[index]));
            },
            scrollDirection: Axis.horizontal,
          ),
        )
      ],
    );
  }
}
