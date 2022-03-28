import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:moody/main.dart';
import 'package:moody/screens/survey_screen.dart';
//import 'package:map_view/map_view.dart';

//https://github.com/iampawan/FlutterGoogleMaps

//import 'package:flutter_map/plugin_api.dart' show MapState, LayerOptions;
//import 'package:latlong2/latlong.dart' as ll;
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget
{
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenLaunch createState() => _MapScreenLaunch();
}

class _MapScreenLaunch extends State <MapScreen>
{
  /*static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);*/

  /*var buildings = new List(9); //list of pins
  buildings.add('Caw Student Centre');
  buildings[1] = 'Chrysler Hall';*/

  //CameraPosition _initialPosition = CameraPosition(target: LatLng(26.8206, 30.8025));
  //Completer<GoogleMapController> _controller = Completer();

 // MapView.setApiKey(AIzaSyBin6DqxbPqLkwzqyZ2zk7j8LqXP3SPsk4);
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  //late GoogleMapController tryController;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }
  LatLng startLocation = LatLng(27.6602292, 85.308027);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Moody'),
      ),
      /*floatingActionButton: FloatingActionButton(
        child: Text("Move"),
        onPressed: (){
          LatLng newlatlang = LatLng(27.7149298,85.2903343);
          tryController.animateCamera(
              CameraUpdate.newCameraPosition(
                  CameraPosition(target: newlatlang, zoom: 17)
                //17 is new zoom level
              )
          );
          //move position of map camera to new location
        },
      ),*/
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            /*const Text(
              'Thanks for your response.\n Please exit the application\n',
              textAlign: TextAlign.center,
              style: TextStyle (
                  color: Colors.blueGrey,
                  fontSize: 20 ), //text style
            ), //text thanks for response
            ElevatedButton( /////THIS IS AN EXIT BUTTON
              style: ButtonStyle (
                elevation: MaterialStateProperty.all(10),
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                    /*
                    //source: https://flutterforyou.com/how-to-change-the-color-of-elevatedbutton-in-flutter/
                     */
                    return Colors.red.shade900;
                  },
                ), //bg color
              ), //button style
              onPressed: () {
                exit(0);
                // Navigate back to first route when tapped.
              }, //on pressed

              child: const Text(
                'X',
                textAlign: TextAlign.center,
                // style: TextStyle(fontSize: 25),
                style: TextStyle (
                    color: Colors.white,
                    fontSize: 15),
                // fontStyle: FontStyle.italic)
              ), //text for X
            ), //elevated button for exiting
            */
        /*---------------------M-A-P----H-E-R-E-----------------------------------*/
            Container(
              height: MediaQuery.of(context).size.height-103,
              width: MediaQuery.of(context).size.width,
              child: GoogleMap(
                zoomGesturesEnabled: true,

                initialCameraPosition: CameraPosition(
                  //target: LatLng(37.4219999, -122.0862462),
                  target: startLocation,
                  zoom: 116,
                ), //initial camera position

                mapType: MapType.normal, //map type
                onMapCreated: (controller) { //method called when map is created
                  setState(() {
                    _onMapCreated(controller);
                  });
                },

                /*onMapCreated: (GoogleMapController controller) {
                  controller.showMarkerInfoWindow(MarkerId("0"));
                },*/
                /*circles: Set.from([
                  Circle(
                    circleId: CircleId("0"),
                    //center: LatLng(...),
                    radius: 1000,
                  )
                ]), */
               /* markers: {
                  Marker(
                      markerId: MarkerId("0"),
                      //position: LatLng(..),
                      //infoWindow: InfoWindow(title: ...)
                  )
                },*/


               // options: GoogleMapOptions(

                //),
              ), //googlemap
            ),//container




        /*-----------B-A-C-K---T-O---D-A-S-H-B-O-A-R-D---B-U-T-T-O-N------------------*/
           /* const Text('\n\n'),
            ElevatedButton( /////THIS IS A BACK TO DASHBOARD BUTTON BUTTON
              style: ButtonStyle (
                elevation: MaterialStateProperty.all(10),
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                    /*
                    //source: https://flutterforyou.com/how-to-change-the-color-of-elevatedbutton-in-flutter/
                     */
                    return Colors.lime;
                  },
                ), //bg color
              ), //button style
              onPressed: () {
                // Navigate back to first route when tapped.
              }, //on pressed

              child: const Text(
                'Back to Dashboard',
                textAlign: TextAlign.center,
                // style: TextStyle(fontSize: 25),
                style: TextStyle (
                    color: Colors.black,
                    fontSize: 15),
                // fontStyle: FontStyle.italic)
              ), //text for X
            ), //elevated button for exiting */
          ], //children widget
        ), //child column
      ), //body center
    ); //scaffold
  } //widget build
}