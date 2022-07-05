import 'package:ecommerce_int2/app_properties.dart';
import 'package:ecommerce_int2/models/product.dart';
import 'package:ecommerce_int2/screens/product/components/more_products.dart';
import 'package:ecommerce_int2/screens/rating/rating_page.dart';
import 'package:flutter/material.dart';

class ProductDisplay extends StatelessWidget {
  final Product product;

  const ProductDisplay({
    required this.product,
  });
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
            top: 230,
            right: 0,
            child: Container(
                width: MediaQuery.of(context).size.width / 2.2,
                height: 65,
                padding: EdgeInsets.only(right: 24),
                decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8.0),
                        bottomLeft: Radius.circular(8.0)),
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromARGB(255, 255, 255, 255),
                          offset: Offset(0, 6),
                          blurRadius: 10.0),
                    ]),
                child: Align(
                  alignment: Alignment(1, 0),
                  child: RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: '\$ ${product.price}',
                        style: const TextStyle(
                            color: darkGrey,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Montserrat",
                            fontSize: 32.0)),
                    TextSpan(
                        text: '',
                        style: const TextStyle(
                            color: const Color(0xFFFFFFFF),
                            fontWeight: FontWeight.w400,
                            fontFamily: "Montserrat",
                            fontSize: 18.0))
                  ])),
                ))),
        Align(
          alignment: Alignment(-1, 0),
          child: Padding(
            padding: const EdgeInsets.only(right: 20.0, left: 20.0),
            child: Container(
              height: screenAwareSize(300, context),
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 150.0,
                    ),
                    child: Container(
                      child: Hero(
                        tag: product.image,
                        child: Image.asset(
                          product.image,
                          fit: BoxFit.contain,
                          height: isGun(product) ? 400 : 500,
                          width: isGun(product) ? 400 : 900,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
          left: 20.0,
          bottom: 60.0,
          child: RawMaterialButton(
            onPressed: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => RatingPage())),
            constraints: const BoxConstraints(minWidth: 45, minHeight: 45),
            child:
                Icon(Icons.favorite, color: Color.fromARGB(255, 207, 78, 89)),
            elevation: 0.0,
            shape: CircleBorder(),
            fillColor: Color.fromARGB(175, 255, 255, 255),
          ),
        )
      ],
    );
  }
}
