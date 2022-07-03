import 'package:ecommerce_int2/app_properties.dart';
import 'package:ecommerce_int2/models/product.dart';
import 'package:ecommerce_int2/screens/product/view_product_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rubber/rubber.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage>
    with SingleTickerProviderStateMixin {
  String selectedPeriod = "";
  String selectedCategory = "";
  String selectedPrice = "";

  List<Product> products = [
    Product(
        'assets/m9_black2.png',
        'M9 Bayonet Blackhole',
        'The M9 Bayonet is based off of the Smith and Wesson SW3B, a knife designed after the original real-life M9 Bayonet and features a serrated blade, and is only named after the M9 Bayonet. Originally intended to be mounted on a rifle, it is also well suited to close-quarters combat.',
        649),
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

  List<String> timeFilter = [
    'Brand',
    'New',
    'Latest',
    'Trending',
    'Discount',
  ];

  List<String> categoryFilter = [
    'Gun',
    'Knife',
  ];

  List<String> priceFilter = [
    '\$0-500',
    '\$501-1000',
    '\$1001-2500',
    '\$2501-5000',
  ];

  List<Product> searchResults = [];

  TextEditingController searchController = TextEditingController();

  late RubberAnimationController _controller;

  @override
  void initState() {
    _controller = RubberAnimationController(
        vsync: this,
        halfBoundValue: AnimationControllerValue(percentage: 0.4),
        upperBoundValue: AnimationControllerValue(percentage: 0.4),
        lowerBoundValue: AnimationControllerValue(pixel: 50),
        duration: Duration(milliseconds: 200));
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _expand() {
    _controller.expand();
  }

  Widget _getLowerLayer() {
    return Container(
      margin: const EdgeInsets.only(top: kToolbarHeight),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Search',
                  style: TextStyle(
                    color: darkGrey,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                CloseButton()
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.0),
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: darkGrey, width: 1))),
            child: TextField(
              controller: searchController,
              onChanged: (value) {
                if (value.isNotEmpty) {
                  List<Product> tempList = [];
                  products.forEach((product) {
                    if (product.name.toLowerCase().contains(value)) {
                      tempList.add(product);
                    }
                  });
                  setState(() {
                    searchResults.clear();
                    searchResults.addAll(tempList);
                  });
                  return;
                } else {
                  setState(() {
                    searchResults.clear();
                    searchResults.addAll(products);
                  });
                }
              },
              cursorColor: darkGrey,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                border: InputBorder.none,
                prefixIcon: SvgPicture.asset(
                  'assets/icons/search_icon.svg',
                  fit: BoxFit.scaleDown,
                ),
                suffix: FlatButton(
                  onPressed: () {
                    searchController.clear();
                    searchResults.clear();
                  },
                  child: Text(
                    'Clear',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            child: Container(
              color: Color.fromARGB(255, 209, 207, 205),
              child: ListView.builder(
                  itemCount: searchResults.length,
                  itemBuilder: (_, index) => Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: ListTile(
                        onTap: () =>
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => ViewProductPage(
                                      product: searchResults[index],
                                    ))),
                        title: Text(searchResults[index].name),
                      ))),
            ),
          )
        ],
      ),
    );
  }

  Widget _getUpperLayer() {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.05),
                offset: Offset(0, -3),
                blurRadius: 10)
          ],
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(24), topLeft: Radius.circular(24)),
          color: Colors.white),
      child: ListView(
        physics: NeverScrollableScrollPhysics(),
//          controller: _scrollController,
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Filters',
                style: TextStyle(color: Colors.grey[300]),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 32.0, top: 16.0, bottom: 16.0),
              child: Text(
                'Sort By',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            height: 50,
            child: ListView.builder(
              itemBuilder: (_, index) => Center(
                  child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 8.0,
                ),
                child: InkWell(
                    onTap: () {
                      setState(() {
                        selectedPeriod = timeFilter[index];
                      });
                    },
                    child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 4.0, horizontal: 20.0),
                        decoration: selectedPeriod == timeFilter[index]
                            ? BoxDecoration(
                                color: Color(0xffFDB846),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(45)))
                            : BoxDecoration(),
                        child: Text(
                          timeFilter[index],
                          style: TextStyle(fontSize: 16.0),
                        ))),
              )),
              itemCount: timeFilter.length,
              scrollDirection: Axis.horizontal,
            ),
          ),
          Container(
            height: 50,
            child: ListView.builder(
              itemBuilder: (_, index) => Center(
                  child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 8.0,
                ),
                child: InkWell(
                    onTap: () {
                      setState(() {
                        selectedCategory = categoryFilter[index];
                      });
                    },
                    child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 4.0, horizontal: 20.0),
                        decoration: selectedCategory == categoryFilter[index]
                            ? BoxDecoration(
                                color: Color(0xffFDB846),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(45)))
                            : BoxDecoration(),
                        child: Text(
                          categoryFilter[index],
                          style: TextStyle(fontSize: 16.0),
                        ))),
              )),
              itemCount: categoryFilter.length,
              scrollDirection: Axis.horizontal,
            ),
          ),
          Container(
            height: 50,
            child: ListView.builder(
              itemBuilder: (_, index) => Center(
                  child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 8.0,
                ),
                child: InkWell(
                    onTap: () {
                      setState(() {
                        selectedPrice = priceFilter[index];
                      });
                    },
                    child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 4.0, horizontal: 20.0),
                        decoration: selectedPrice == priceFilter[index]
                            ? BoxDecoration(
                                color: Color(0xffFDB846),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(45)))
                            : BoxDecoration(),
                        child: Text(
                          priceFilter[index],
                          style: TextStyle(fontSize: 16.0),
                        ))),
              )),
              itemCount: priceFilter.length,
              scrollDirection: Axis.horizontal,
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SafeArea(
        top: true,
        bottom: false,
        child: Scaffold(
//          bottomSheet: ClipRRect(
//            borderRadius: BorderRadius.only(
//                topRight: Radius.circular(25), topLeft: Radius.circular(25)),
//            child: BottomSheet(
//                onClosing: () {},
//                builder: (_) => Container(
//                      padding: EdgeInsets.all(16.0),
//                      child: Row(
//                          mainAxisAlignment: MainAxisAlignment.center,
//                          children: <Widget>[Text('Filters')]),
//                      color: Colors.white,
//                      width: MediaQuery.of(context).size.height,
//                    )),
//          ),
            body: RubberBottomSheet(
          lowerLayer: _getLowerLayer(), // The underlying page (Widget)
          upperLayer: _getUpperLayer(), // The bottomsheet content (Widget)
          animationController: _controller, // The one we created earlier
        )),
      ),
    );
  }
}
