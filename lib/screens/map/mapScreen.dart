import 'package:ecommerce_int2/app_properties.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ecommerce_int2/screens/map/address.dart';

class MapScreen extends StatefulWidget {
  final AddressModel address;

  MapScreen({
    required this.address,
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
        target: LatLng(double.parse(widget.address.latitude),
            double.parse(widget.address.longtitude)),
        zoom: 17);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: lightGrey,
        elevation: 0,
        title: Text('Address page',
            style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w600)),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
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
              markerId: MarkerId(widget.address.address),
              position: _cameraPosition.target,
            )
          }),
    );
  }
}
