import 'package:ecommerce_int2/app_properties.dart';
import 'package:ecommerce_int2/custom_background.dart';
import 'package:ecommerce_int2/models/product.dart';
import 'package:ecommerce_int2/screens/category/category_list_page.dart';
import 'package:ecommerce_int2/screens/notifications_page.dart';
import 'package:ecommerce_int2/screens/profile_page.dart';
import 'package:ecommerce_int2/screens/search_page.dart';
import 'package:ecommerce_int2/screens/shop/check_out_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'components/custom_bottom_bar.dart';
import 'components/product_list.dart';
import 'components/tab_view.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

List<String> timelines = ['Hot deal', 'Hot knifes', 'Hot guns'];
String selectedTimeline = 'Hot deal';

List<Product> gun = [
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
      899)
];

List<Product> knife = [
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
      559)
];

List<Product> productsInCart = [];
List<Cart> cart = [];
List<Product> products = [knife[1], gun[0], gun[1]];
var totalPrice = 0.0;

double cartPrice() {
  if (productsInCart.length != 0)
    totalPrice = productsInCart.fold(0, (sum, item) => sum + item.price);
  else
    totalPrice = 0;
  return totalPrice;
}

double cartTotalPrice() {
  if (cart.length != 0)
    totalPrice =
        cart.fold(0, (sum, item) => sum + item.prod.price * item.quantity);
  else
    totalPrice = 0;
  return totalPrice;
}

class _MainPageState extends State<MainPage>
    with TickerProviderStateMixin<MainPage> {
  late TabController tabController;
  late TabController bottomTabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    bottomTabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    Widget appBar = Container(
      height: kToolbarHeight + MediaQuery.of(context).padding.top,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          // IconButton(
          //     onPressed: () => Navigator.of(context)
          //         .push(MaterialPageRoute(builder: (_) => NotificationsPage())),
          //     icon: Icon(Icons.notifications)),
          IconButton(
              alignment: Alignment.topRight,
              color: Colors.white,
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => SearchPage())),
              icon: SvgPicture.asset('assets/icons/search_icon.svg'))
        ],
      ),
    );

    Widget topHeader = Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Flexible(
              child: InkWell(
                onTap: () {
                  setState(() {
                    selectedTimeline = timelines[0];
                    products = [knife[1], gun[0], gun[1]];
                  });
                },
                child: Text(
                  timelines[0],
                  style: TextStyle(
                      fontSize: timelines[0] == selectedTimeline ? 20 : 14,
                      color: mediumGrey),
                ),
              ),
            ),
            Flexible(
              child: InkWell(
                onTap: () {
                  setState(() {
                    selectedTimeline = timelines[1];
                    products = [
                      Product(
                          'assets/bowie_fade.png',
                          'Bowie Fade',
                          'This full-tang sawback Bowie knife is designed for heavy use in brutal survival situations.',
                          419),
                      Product(
                          'assets/butter_red.png',
                          'Butterfly Bloodbad',
                          'This is a custom-designed balisong, commonly known as a butterfly knife. The defining characteristic of this weapon is the fan-like opening of a freely pivoting blade, allowing rapid deployment or concealment. As a result, butterfly knives are outlawed in many countries.',
                          559),
                      Product(
                          'assets/m9_fade.png',
                          'M9 Bayonet Fade',
                          'The M9 Bayonet is based off of the Smith and Wesson SW3B, a knife designed after the original real-life M9 Bayonet and features a serrated blade, and is only named after the M9 Bayonet. Originally intended to be mounted on a rifle, it is also well suited to close-quarters combat.',
                          699),
                    ];
                  });
                },
                child: Text(timelines[1],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: timelines[1] == selectedTimeline ? 20 : 14,
                        color: mediumGrey)),
              ),
            ),
            Flexible(
              child: InkWell(
                onTap: () {
                  setState(() {
                    selectedTimeline = timelines[2];
                    products = [gun[0], gun[1], gun[2]];
                  });
                },
                child: Text(timelines[2],
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        fontSize: timelines[2] == selectedTimeline ? 20 : 14,
                        color: mediumGrey)),
              ),
            ),
          ],
        ));

    Widget tabBar = TabBar(
      tabs: [
        Tab(text: 'Gun'),
        Tab(text: 'Knife'),
      ],
      labelStyle: TextStyle(fontSize: 16.0),
      unselectedLabelStyle: TextStyle(
        fontSize: 14.0,
      ),
      labelColor: mediumGrey,
      unselectedLabelColor: Color.fromRGBO(0, 0, 0, 0.5),
      isScrollable: true,
      controller: tabController,
    );

    return Scaffold(
      bottomNavigationBar: CustomBottomBar(controller: bottomTabController),
      body: CustomPaint(
        painter: MainBackground(),
        child: TabBarView(
          controller: bottomTabController,
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            SafeArea(
              child: NestedScrollView(
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  // These are the slivers that show up in the "outer" scroll view.
                  return <Widget>[
                    SliverToBoxAdapter(
                      child: appBar,
                    ),
                    SliverToBoxAdapter(
                      child: topHeader,
                    ),
                    SliverToBoxAdapter(
                      child: ProductList(
                        products: products,
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: tabBar,
                    )
                  ];
                },
                body: TabView(
                  tabController: tabController,
                ),
              ),
            ),
            // CategoryListPage(),
            CheckOutPage(),
            ProfilePage()
          ],
        ),
      ),
    );
  }
}
