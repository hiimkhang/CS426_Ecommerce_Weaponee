import 'package:ecommerce_int2/app_properties.dart';
import 'package:ecommerce_int2/screens/map/mapScreen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ecommerce_int2/screens/map/address.dart';
import 'package:ecommerce_int2/screens/map/mapScreen.dart';

class TrackingPage extends StatefulWidget {
  @override
  _TrackingPageState createState() => _TrackingPageState();
}

class _TrackingPageState extends State<TrackingPage> {
  final List<Location> locations = [
    Location('Nhà của Khang', DateTime(2022, 7, 3, 5, 23, 4),
        showHour: false, isHere: false, passed: true),
    Location('Nhà của Quốc', DateTime(2022, 7, 4, 5, 23, 4),
        showHour: false, isHere: false, passed: true),
    Location(
      'VNUHCM US',
      DateTime(2022, 7, 5, 5, 23, 4),
      showHour: false,
      isHere: true,
    ),
    Location(
      'Nhà của bạn',
      DateTime(2022, 7, 8, 5, 23, 4),
      showHour: false,
      isHere: false,
    ),
  ];

  String selectedProduct = 'M9 Bayonet Tiger Tooth';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[100],
          image: DecorationImage(
              image: AssetImage('assets/Group 444.png'), fit: BoxFit.contain)),
      child: Container(
        color: Colors.white54,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              brightness: Brightness.light,
              iconTheme: IconThemeData(color: Colors.grey),
              title: Text(
                'Ship and Map',
                style: TextStyle(
                  color: darkGrey,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              leading: SizedBox(),
              actions: <Widget>[CloseButton()],
            ),
            body: SafeArea(
              child: LayoutBuilder(
                builder: (_, constraints) => Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16.0),
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      decoration: BoxDecoration(
                          color: lightGrey,
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          items: <String>['M9 Bayonet Tiger Tooth'].map((val) {
                            return DropdownMenuItem<String>(
                              value: val,
                              child: Container(
                                  color: lightGrey,
                                  child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        val,
                                        maxLines: 1,
                                        semanticsLabel: '...',
                                        overflow: TextOverflow.ellipsis,
                                      ))),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              selectedProduct = newValue as String;
                            });
                          },
                          value: selectedProduct,
                          isExpanded: false,
                          icon: Icon(Icons.keyboard_arrow_down),
                          elevation: 0,
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxHeight: constraints.maxHeight - 48,
                        ),
                        child: Theme(
                          data: ThemeData(
                              primaryColor: yellow, fontFamily: 'Montserrat'),
                          child: Stepper(
//                          physics: NeverScrollableScrollPhysics(),
                            steps: [
                              ...locations
                                  .map(
                                    (location) => Step(
                                      isActive:
                                          location.isHere || location.passed,
                                      title: Text(location.city),
                                      subtitle: Text(location.getDate()),
                                      content: Align(
                                        child: Image.asset(
                                            'assets/icons/truck.png'),
                                        alignment: Alignment.centerLeft,
                                      ),
                                      state: location.passed
                                          ? StepState.complete
                                          : location.isHere
                                              ? StepState.editing
                                              : StepState.indexed,
                                    ),
                                  )
                                  .toList()
                            ],
                            currentStep: locations.indexOf(
                                locations.firstWhere((loc) => loc.isHere)),
                          ),
                        ),
                      ),
                    ),
                    Align(
                        alignment: Alignment.center,
                        child: InkWell(
                            onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (_) => MapScreen(
                                        add1: listAddresses[0],
                                        add2: listAddresses[1],
                                        add3: listAddresses[2],
                                        add4: listAddresses[3]))),
                            child: Container(
                              alignment: Alignment.bottomRight,
                              height: 80,
                              width: MediaQuery.of(context).size.width / 1.5,
                              decoration: BoxDecoration(
                                  gradient: lightButton,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color.fromRGBO(0, 0, 0, 0.16),
                                      offset: Offset(0, 5),
                                      blurRadius: 10.0,
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(9.0)),
                              child: Center(
                                child: Text("View shop locations",
                                    style: const TextStyle(
                                        color: const Color(0xfffefefe),
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 20.0)),
                              ),
                            ))),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}

class Location {
  String city;
  DateTime date;
  bool showHour;
  bool isHere;
  bool passed;

  Location(this.city, this.date,
      {this.showHour = false, this.isHere = false, this.passed = false});

  String getDate() {
    if (showHour) {
      return DateFormat("K:mm aaa, d MMMM y").format(date);
    } else {
      return DateFormat('d MMMM y').format(date);
    }
  }
}
