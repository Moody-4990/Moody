import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:moody/main.dart';
import 'package:moody/screens/survey_screen.dart';
//https://github.com/iampawan/FlutterGoogleMaps
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget
{
  //const MapScreen({Key? key}) : super(key: key);

  String selected_emoji;
  LatLng loc;
  MapScreen({required this.selected_emoji, required this.loc});
  @override
  _MapScreenLaunch createState() => _MapScreenLaunch(selected_emoji, loc);
}

class _MapScreenLaunch extends State <MapScreen>
{

  late GoogleMapController mapController;
  LatLng startLocation = LatLng(42.30627912998773, -83.0667245381944);

  LatLng loc;
  var selected_emoji;
  _MapScreenLaunch(this.selected_emoji, this.loc);
  //LatLng chosenLocation = LatLng(42.306646541099276, -83.06853511164111);

  late BitmapDescriptor custom_icon;
  Set<Marker> markers = new Set();

  @override
  void initState()
  {
    super.initState();
    setCustomMarker();
  }

  /*
  -------------- C U S T O M   M A R K E R ----------
   */
  void setCustomMarker() async
  {
    //print(selected_emoji);
    if(selected_emoji == "Happy")
      {
        custom_icon = await BitmapDescriptor.fromAssetImage(ImageConfiguration(), 'assets/markers/smile.png');
      } //smile
    else if(selected_emoji == "Angry")
    {
      custom_icon = await BitmapDescriptor.fromAssetImage(ImageConfiguration(), 'assets/markers/angry.png');
    } //angry
    else if(selected_emoji == "Ew")
    {
      custom_icon = await BitmapDescriptor.fromAssetImage(ImageConfiguration(), 'assets/markers/vomit.png');
    } //Ew
    else if(selected_emoji == "Flirty")
    {
      custom_icon = await BitmapDescriptor.fromAssetImage(ImageConfiguration(), 'assets/markers/wink.png');
    } //wink
    else if(selected_emoji == "Love")
    {
      custom_icon = await BitmapDescriptor.fromAssetImage(ImageConfiguration(), 'assets/markers/heart.png');
    } //love
    else if(selected_emoji == "Jokster")
    {
      custom_icon = await BitmapDescriptor.fromAssetImage(ImageConfiguration(), 'assets/markers/goofy.png');
    } //goofy
    else if(selected_emoji == "Sad")
    {
      custom_icon = await BitmapDescriptor.fromAssetImage(ImageConfiguration(), 'assets/markers/sad.png');
    } //sad
    else if(selected_emoji == "Nervous")
    {
      custom_icon = await BitmapDescriptor.fromAssetImage(ImageConfiguration(), 'assets/markers/nervous.png');
    } //nervous
    else if(selected_emoji == "Cool")
    {
      custom_icon = await BitmapDescriptor.fromAssetImage(ImageConfiguration(), 'assets/markers/cool.png');
    } //cool
  }
  /*
  ----------------------------------------------------
   */


  /*
  --------------O N   M A P   C R E A T E D ----------
   */
  void _onMapCreated(GoogleMapController controller)
  {
    mapController = controller;
    setState((){
        markers.add(
          Marker(
              markerId: MarkerId('Smile'),
              position: loc, //to be fixed
              icon: custom_icon,
        ));
    });
  }
  /*
  ----------------------------------------------------
   */

  LatLng CAW = LatLng(42.306646541099276, -83.06853511164111);
  LatLng Chrysler = LatLng(42.306797978474, -83.06633849834193);
  LatLng Dillon = LatLng(42.30627482963498, -83.06763226634442);
  LatLng Education = LatLng(42.30716968684932, -83.06599411405351);
  LatLng Erie = LatLng(42.30531800669573, -83.06527742242625);
  LatLng Essex = LatLng(42.30538684336386, -83.0668969593502);
  LatLng Leddy = LatLng(42.30787179668103, -83.06780911233038);
  LatLng Odette = LatLng(42.305290472007385, -83.06434665407915);
  LatLng Toldo = LatLng(42.306659281881785, -83.0648152919935);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Moody'),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
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
        /*---------------------M-A-P----H-E-R-E-----------------------------------*/
            const Text("\n"),
            Container(
              height: MediaQuery.of(context).size.height-373,
              width: MediaQuery.of(context).size.width,
              child: GoogleMap(
                markers: markers,
                zoomGesturesEnabled: false,
                initialCameraPosition: CameraPosition(
                  target: startLocation,
                  zoom: 17, //to change to new loc after we figure out how
                  //to get strings across pages
                ), //initial camera position

                mapType: MapType.normal, //map type
                onMapCreated: (controller) { //method called when map is created
                  setState(() {
                    _onMapCreated(controller);
                  });
                },
              ), //googlemap
            ),//container
          ], //children widget
        ), //child column
      ), //body center
    ); //scaffold
  } //widget build
}