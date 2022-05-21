import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';



class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
 late GoogleMapController _controller ;

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);
  Marker? _origin ;
  Marker? _destination;

late  GoogleMapController _googleMapController;

  @override
  void dispose(){
      _googleMapController.dispose();
      super.dispose();
  }

 List<Marker> _markers = [];
 void getData(){
  //   _markers.add(
  //     Marker(
  //     markerId: MarkerId('SomeId'),
  //     position: LatLng(37.43296265331129,-122.08832357078792),
  //     infoWindow: InfoWindow(
  //     title: 'The title of the marker'
  //     )
  //    )
  //  );
   _markers.add(
      Marker(
      markerId: MarkerId('SomeIds'),
      position: LatLng(37.43296265331150,-122.08832357078792),
      infoWindow: InfoWindow(
      title: 'The title of the marker'
      )
     )
   );
   _markers.add(
      Marker(
      markerId: MarkerId('SomeIds'),
      position: LatLng(37.43296265331129,-122.08832357078792),
      infoWindow: InfoWindow(
      title: 'The title of the marker'
      )
     )
   );
   setState(() {
     
   });

 }
  @override
 void initState(){
   getData();
   super.initState();
 }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor:Color(0xff017e00),
        title: Text('Maps'),
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
       markers: Set<Marker>.of(_markers),
        onLongPress:_addMarker,
        onMapCreated: (controller) {
          _googleMapController = controller;
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
        _googleMapController.animateCamera(CameraUpdate.newCameraPosition(_kLake));
        },
        label: Text('To the lake!'),
        icon: Icon(Icons.directions_boat),
      ),
    );
  }

  // Future<void> _goToTheLake() async {
  //   print("okay");
  //   final GoogleMapController controller = await _controller.future;
  //   controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  // }
  void _addMarker(LatLng pos){
    if(_origin == null || (_origin !=null && _destination !=null)){
      setState(() {
        _origin = Marker(
          markerId: const MarkerId('origin'),
          infoWindow: const InfoWindow(title: 'Origin'),
          icon:BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
          position: pos
        );
        _destination = null!;
      });
    }
    else{
       setState(() {
        _origin = Marker(
          markerId: const MarkerId('origin'),
          infoWindow: const InfoWindow(title: 'Origin'),
          icon:BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
          position: pos
        );

      });

    }
  }
}