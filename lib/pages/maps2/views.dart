// import 'dart:convert';

// import 'package:flutter_polyline_points/flutter_polyline_points.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:location/location.dart';
// import 'package:flutter/material.dart';
// import 'dart:async';



// const double CAMERA_ZOOM = 16;
// const double CAMERA_TILT = 80;
// const double CAMERA_BEARING = 30;
// const LatLng SOURCE_LOCATION = LatLng(42.747932,-71.167889);
// const LatLng DEST_LOCATION = LatLng(37.335685,-122.0605916);


// class MapPage extends StatefulWidget {
//    @override
//    State<StatefulWidget> createState() => MapPageState();
// }

// class MapPageState extends State<MapPage> {
//    final Set<Polyline> _polyline = {};
//     List<LatLng> latlngSegment1 = [];
//   Map<PolylineId, Polyline> polylines = {};
//         Completer<GoogleMapController> _controller = Completer();
//       Set<Marker> _markers = Set<Marker>();
//       // for my drawn routes on the map
//       Set<Polyline> _polylines = Set<Polyline>();
//       List<LatLng> polylineCoordinates = [];
//    late   PolylinePoints polylinePoints;
//       String googleAPIKey = "AIzaSyBF-Wtun3Oqsj5-z7v99Pq6lbtCJGicXpc";
//       // for my custom marker pins
//    late   BitmapDescriptor sourceIcon;
//    late   BitmapDescriptor destinationIcon;
//       // the user's initial location and current location
//       // as it moves
//       LocationData? currentLocation;
//       // a reference to the destination location
//       LocationData? destinationLocation;
//       // wrapper around the location API
//     late  Location location;

//     @override
// void initState() {
//    super.initState();
     
//    // create an instance of Location
//    location = new Location();
//    polylinePoints = PolylinePoints();
  
//    // subscribe to changes in the user's location
//    // by "listening" to the location's onLocationChanged event
//    location.onLocationChanged().listen((LocationData cLoc) {
//        List<LatLng> latlngSegment1 = [];
//            setState(() {
       
//      });
//       // cLoc contains the lat and long of the
//       // current user's position in real time,
//       // so we're holding on to it
//       currentLocation = cLoc;
//     latlngSegment1.add(LatLng(currentLocation!.latitude, currentLocation!.longitude));
//      latlngSegment1.add(LatLng(DEST_LOCATION.latitude, DEST_LOCATION.longitude));
//       //  _getPolyline();
//       _polyline.add(Polyline(
//         polylineId: PolylineId('line1'),
//         visible: true,
//         //latlng is List<LatLng>
//         points: latlngSegment1,
//         width: 6,
//         color: Colors.blue,
//       ));
//           setState(() {
       
//      });
//       updatePinOnMap();
//    });
//    // set custom marker pins
//    setSourceAndDestinationIcons();
//    // set the initial location
//    setInitialLocation();
// }
// void setSourceAndDestinationIcons() async {
//    sourceIcon = await BitmapDescriptor.fromAssetImage(
//       ImageConfiguration(devicePixelRatio: 2.5),
//          'assets/driving_pin.png');
  
//    destinationIcon = await BitmapDescriptor.fromAssetImage(
//       ImageConfiguration(devicePixelRatio: 2.5),
//          'assets/destination_map_marker.png');
// }
// void setInitialLocation() async {
//    // set the initial location by pulling the user's 
//    // current location from the location's getLocation()
//    currentLocation = await location.getLocation();
   
//    // hard-coded destination for this example
//    destinationLocation = LocationData.fromMap({
//       "latitude": DEST_LOCATION.latitude,
//       "longitude": DEST_LOCATION.longitude
//    });
// }
// @override
// Widget build(BuildContext context) {
//    CameraPosition initialCameraPosition = CameraPosition(
//       zoom: CAMERA_ZOOM,
//       tilt: CAMERA_TILT,
//       bearing: CAMERA_BEARING,
//       target: SOURCE_LOCATION
//    );
// if (currentLocation != null) {
//       initialCameraPosition = CameraPosition(
//          target: LatLng(currentLocation!.latitude,
//             currentLocation!.longitude),
//          zoom: CAMERA_ZOOM,
//          tilt: CAMERA_TILT,
//          bearing: CAMERA_BEARING
//       );
//    }
// return Scaffold(
//       body: Stack(
//       children: <Widget>[
//          GoogleMap(
//          myLocationEnabled: true,
//          compassEnabled: true,
//          tiltGesturesEnabled: false,
//          markers: _markers,
//         polylines: _polyline,
//          mapType: MapType.normal,
//          initialCameraPosition: initialCameraPosition,
//          onMapCreated: (GoogleMapController controller) {
//             _controller.complete(controller);
//             // my map has completed being created;
//             // i'm ready to show the pins on the map
//             showPinsOnMap();
//          })
//       ],
//     ),
//   );
// }
// void showPinsOnMap() {
//    // get a LatLng for the source location
//    // from the LocationData currentLocation object
//    var pinPosition = LatLng(currentLocation!.latitude,
//    currentLocation!.longitude);
//    // get a LatLng out of the LocationData object
//    var destPosition = LatLng(destinationLocation!.latitude,
//    destinationLocation!.longitude);
//    // add the initial source location pin
//    _markers.add(Marker(
//       markerId: MarkerId('sourcePin'),
//       position: pinPosition,
//       // icon: sourceIcon
//    ));
//    // destination pin
//    _markers.add(Marker(
//       markerId: MarkerId('destPin'),
//       position: destPosition,
//       // icon: destinationIcon
//    ));
//    // set the route lines on the map from source to destination
//    // for more info follow this tutorial
//   //  setPolylines();
// }

// // void setPolylines() async {
// // // List<PointLatLng> result = polylinePoints.decodePolyline("_p~iF~ps|U_ulLnnqC_mqNvxq`@");
// // // print(result);
// //    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates('AIzaSyBF-Wtun3Oqsj5-z7v99Pq6lbtCJGicXpc',PointLatLng(currentLocation!.latitude,currentLocation!.longitude),PointLatLng(destinationLocation!.latitude,destinationLocation!.longitude));
// //     print(result.status);
// //     print("OKAYYYYY");
// //    if(result.status=='OK'){
// //       result.points.forEach((PointLatLng point){
// //          polylineCoordinates.add(
// //             LatLng(point.latitude,point.longitude)
// //          );
// //       });
// //      setState(() {
// //       _polylines.add(Polyline(
// //         width: 5, // set the width of the polylines
// //         polylineId: PolylineId("poly"),
// //         color: Color.fromARGB(255, 40, 122, 198), 
// //         points: polylineCoordinates
// //         ));
// //     });
// //   }
// // }
// void updatePinOnMap() async {
   
//    // create a new CameraPosition instance
//    // every time the location changes, so the camera
//    // follows the pin as it moves with an animation
//    CameraPosition cPosition = CameraPosition(
//    zoom: CAMERA_ZOOM,
//    tilt: CAMERA_TILT,
//    bearing: CAMERA_BEARING,
//    target: LatLng(currentLocation!.latitude,
//       currentLocation!.longitude),
//    );
// final GoogleMapController controller = await _controller.future;
// controller.animateCamera(CameraUpdate.newCameraPosition(cPosition));


//  _polyline.add(Polyline(
//         polylineId: PolylineId('line1'),
//         visible: true,
//         //latlng is List<LatLng>
//         points: latlngSegment1,
//         width: 6,
//         color: Colors.blue,
//       ));
//    // do this inside the setState() so Flutter gets notified
//    // that a widget update is due
//    setState(() {
//       // updated position
//       var pinPosition = LatLng(currentLocation!.latitude,
//       currentLocation!.longitude);
      
//       // the trick is to remove the marker (by id)
//       // and add it again at the updated location
//       _markers.removeWhere(
//       (m) => m.markerId.value == "sourcePin");
//       _markers.add(Marker(
//          markerId: MarkerId("sourcePin"),
//          position: pinPosition, // updated position
//         //  icon: sourceIcon
//       ));
//    });
// }
// _getPolyline() async {
//     PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
//        'AIzaSyBF-Wtun3Oqsj5-z7v99Pq6lbtCJGicXpc' ,
//         PointLatLng(currentLocation!.latitude, currentLocation!.longitude),
//         PointLatLng(destinationLocation!.latitude, destinationLocation!.longitude),
//         travelMode: TravelMode.driving,);
//     if (result.points.isNotEmpty) {
//       result.points.forEach((PointLatLng point) {
//         polylineCoordinates.add(LatLng(point.latitude, point.longitude));
//       });
//     }
//     setState(() {
//       _polylines.add(
//         Polyline(polylineId: PolylineId('polyLine'),
//         color:Color(0xFF08A5CB),
//         points: polylineCoordinates
//         )

//       );
//     });
//     _addPolyLine();
//   }
//   _addPolyLine() {
//     PolylineId id = PolylineId("poly");
//     Polyline polyline = Polyline(
//         polylineId: id, color: Colors.red, points: polylineCoordinates);
//     polylines[id] = polyline;
//     setState(() {});
//   }
// }