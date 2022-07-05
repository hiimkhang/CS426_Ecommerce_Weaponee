import 'package:ecommerce_int2/app_properties.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ecommerce_int2/screens/map/address.dart';

class MapScreen extends StatefulWidget {
  final AddressModel add1, add2, add3, add4;
  // final List<AddressModel> chain;

  MapScreen({
    required this.add1,
    required this.add2,
    required this.add3,
    required this.add4,
    // required this.chain,
  });

  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<MapScreen> {
  CameraPosition _cameraPosition =
      CameraPosition(target: LatLng(45, 125), zoom: 17);

  @override
  void initState() {
    super.initState();

    _cameraPosition = CameraPosition(
        target: LatLng(double.parse(widget.add1.latitude),
            double.parse(widget.add1.longtitude)),
        zoom: 17);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: mediumGrey,
        elevation: 0,
        title: Text('Shop locations',
            style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600)),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
            size: 25,
          ),
        ),
      ),
      body: GoogleMap(
          initialCameraPosition: _cameraPosition,
          compassEnabled: false,
          indoorViewEnabled: true,
          myLocationButtonEnabled: true,
          // ignore: prefer_collection_literals
          markers: {
            Marker(
              markerId: MarkerId(widget.add1.address),
              position: _cameraPosition.target,
            ),
            Marker(
                markerId: MarkerId(widget.add2.address),
                position: LatLng(double.parse(widget.add2.latitude),
                    double.parse(widget.add2.longtitude))),
            Marker(
                markerId: MarkerId(widget.add3.address),
                position: LatLng(double.parse(widget.add3.latitude),
                    double.parse(widget.add3.longtitude))),
            Marker(
                markerId: MarkerId(widget.add4.address),
                position: LatLng(double.parse(widget.add4.latitude),
                    double.parse(widget.add4.longtitude))),
          }),
    );
  }
}
