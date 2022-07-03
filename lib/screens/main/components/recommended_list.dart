import 'package:ecommerce_int2/app_properties.dart';
import 'package:ecommerce_int2/models/product.dart';
import 'package:ecommerce_int2/screens/product/product_page.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter/material.dart';

class RecommendedList extends StatelessWidget {
  List<Product> products = [
    Product(
        'assets/m4a4_purple.png',
        'M4A4 Neo-Noir',
        'The M4A4 is based on the Mk. 18 Mod 0 carbine, fitted with an ARMS#40 flip-up rear iron sight and KAC free-float RAS handguard. In-game, the weapon holds 30 rounds and has 90 rounds in reserve.',
        2199),
    Product(
        'assets/ak47_blue.png',
        'AK47 Blue Crystal',
        'The AK-47 is a select-fire, gas-operated 7.62×39mm assault rifle developed in the Soviet Union by Mikhail Kalashnikov. The first weapon in the AK (Avtomat Kalashnikova, Russian: Автомат Калашникова, Kalashnikov assault rifle) family of weapons, the AK-47 is succeeded by the modernized AKM in 1959, and the AK-74 in 1974. AK variants were adopted by many forces around the world and saw use in almost every conflict since its development. The AK-47 in Global Offensive is modeled after the AKM.',
        1899),
    Product(
        'assets/m4a4_gold.png',
        'M4A4 Golden',
        'The M4A4 is based on the Mk. 18 Mod 0 carbine, fitted with an ARMS#40 flip-up rear iron sight and KAC free-float RAS handguard. In-game, the weapon holds 30 rounds and has 90 rounds in reserve.',
        2499),
    Product(
        'assets/ak47_red.png',
        'AK47 The Empress',
        'The AK-47 is a select-fire, gas-operated 7.62×39mm assault rifle developed in the Soviet Union by Mikhail Kalashnikov. The first weapon in the AK (Avtomat Kalashnikova, Russian: Автомат Калашникова, Kalashnikov assault rifle) family of weapons, the AK-47 is succeeded by the modernized AKM in 1959, and the AK-74 in 1974. AK variants were adopted by many forces around the world and saw use in almost every conflict since its development. The AK-47 in Global Offensive is modeled after the AKM.',
        2099),
    Product(
        'assets/m4a4_red.png',
        'M4A4 Bloodbath',
        'The M4A4 is based on the Mk. 18 Mod 0 carbine, fitted with an ARMS#40 flip-up rear iron sight and KAC free-float RAS handguard. In-game, the weapon holds 30 rounds and has 90 rounds in reserve.',
        899),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 20,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              IntrinsicHeight(
                child: Container(
                  margin: const EdgeInsets.only(left: 16.0, right: 8.0),
                  width: 4,
                  color: darkGrey,
                ),
              ),
              Center(
                  child: Text(
                'Recommended Guns',
                style: TextStyle(
                    color: darkGrey,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              )),
            ],
          ),
        ),
        Flexible(
          child: Container(
            padding: EdgeInsets.only(top: 16.0, right: 16.0, left: 16.0),
            child: StaggeredGridView.countBuilder(
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              crossAxisCount: 4,
              itemCount: products.length,
              itemBuilder: (BuildContext context, int index) => new ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: InkWell(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => ProductPage(product: products[index]))),
                  child: Container(
                      decoration: BoxDecoration(
                        gradient: RadialGradient(
                            colors: [
                              Color.fromARGB(66, 92, 88, 88).withOpacity(0.3),
                              Color.fromARGB(255, 133, 129, 129)
                                  .withOpacity(0.7),
                            ],
                            center: Alignment(0, 0),
                            radius: 0.6,
                            focal: Alignment(-1, 0),
                            focalRadius: 0.1),
                      ),
                      child: Hero(
                          tag: products[index].image,
                          child: Image.asset(products[index].image))),
                ),
              ),
              staggeredTileBuilder: (int index) =>
                  StaggeredTile.count(2, index.isEven ? 3 : 2),
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
            ),
          ),
        ),
      ],
    );
  }
}

class secondRecommendedList extends StatelessWidget {
  List<Product> products = [
    Product(
        'assets/bowie_fade.png',
        'Bowie Fade',
        'This full-tang sawback Bowie knife is designed for heavy use in brutal survival situations.',
        419),
    Product(
        'assets/m9_green.png',
        'M9 Nature',
        'The M9 Bayonet is based off of the Smith and Wesson SW3B, a knife designed after the original real-life M9 Bayonet and features a serrated blade, and is only named after the M9 Bayonet. Originally intended to be mounted on a rifle, it is also well suited to close-quarters combat.',
        389),
    Product(
        'assets/karambit_red.png',
        'Karambit Bloodyhell',
        'With its curved blade mimicking a tiger'
            's claw, the karambit was developed as part of the southeast Asian martial discipline of silat. The knife is typically used with a reverse grip, with the finger ring on the index finger.',
        499),
    Product(
        'assets/karambit_purple.png',
        'Karambit Galaxy',
        'With its curved blade mimicking a tiger'
            's claw, the karambit was developed as part of the southeast Asian martial discipline of silat. The knife is typically used with a reverse grip, with the finger ring on the index finger.',
        699),
    Product(
        'assets/m9_gold.png',
        'M9 Bayonet Golden',
        'The M9 Bayonet is based off of the Smith and Wesson SW3B, a knife designed after the original real-life M9 Bayonet and features a serrated blade, and is only named after the M9 Bayonet. Originally intended to be mounted on a rifle, it is also well suited to close-quarters combat.',
        819),
    Product(
        'assets/butter_red.png',
        'Butterfly Bloodbad',
        'This is a custom-designed balisong, commonly known as a butterfly knife. The defining characteristic of this weapon is the fan-like opening of a freely pivoting blade, allowing rapid deployment or concealment. As a result, butterfly knives are outlawed in many countries.',
        559),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 20,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              IntrinsicHeight(
                child: Container(
                  margin: const EdgeInsets.only(left: 16.0, right: 8.0),
                  width: 4,
                  color: darkGrey,
                ),
              ),
              Center(
                  child: Text(
                'Recommended Knifes',
                style: TextStyle(
                    color: darkGrey,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              )),
            ],
          ),
        ),
        Flexible(
          child: Container(
            padding: EdgeInsets.only(top: 16.0, right: 16.0, left: 16.0),
            child: StaggeredGridView.countBuilder(
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              crossAxisCount: 4,
              itemCount: products.length,
              itemBuilder: (BuildContext context, int index) => new ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: InkWell(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => ProductPage(product: products[index]))),
                  child: Container(
                      decoration: BoxDecoration(
                        gradient: RadialGradient(
                            colors: [
                              Color.fromARGB(66, 92, 88, 88).withOpacity(0.3),
                              Color.fromARGB(255, 133, 129, 129)
                                  .withOpacity(0.7),
                            ],
                            center: Alignment(0, 0),
                            radius: 0.6,
                            focal: Alignment(-1, 0),
                            focalRadius: 0.1),
                      ),
                      child: Hero(
                          tag: products[index].image,
                          child: Image.asset(products[index].image))),
                ),
              ),
              staggeredTileBuilder: (int index) =>
                  StaggeredTile.count(2, index.isEven ? 3 : 2),
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
            ),
          ),
        ),
      ],
    );
  }
}
