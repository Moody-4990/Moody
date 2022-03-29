import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:moody/main.dart';
import 'package:moody/screens/map_screen.dart';
import 'package:moody/screens/survey_screen.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';


class SurveyScreen extends StatefulWidget
{
  const SurveyScreen({Key? key}) : super(key: key);
  @override
  _SurveyScreenState createState() => _SurveyScreenState();

} //class SurveyScreen

class _SurveyScreenState extends State<SurveyScreen> {

  String selected_emoji = "Happy";
  String selected_location = "CAW Student Center";

  LatLng startLocation = LatLng(42.30627912998773, -83.0667245381944);
  /*
   Buildings here
  https://www.fluttercampus.com/guide/73/how-to-add-multiple-markers-on-google-map-flutter/
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

  LatLng loc = LatLng(0,0);

  var selected_build = "";
  late GoogleMapController mapController;

  //String err = "";
  final Set<Marker> markers = new Set();
  Set<Marker> getmarkers() { //markers to place on map
    setState(() {
      markers.add(Marker( //add first marker
        markerId: MarkerId(CAW.toString()),
        position: CAW, //position of marker
        infoWindow: InfoWindow( //popup info
          title: 'CAW Student Centre',
          //snippet: 'My Custom Subtitle',
        ), //info window
        onTap: (){
          setState(() {
            selected_build = "CAW Student Center";
            loc = CAW;
            //print(selected_build);
          });
        }, //onTap
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      )); //line 32 marker-add //CAW

      markers.add(Marker( //add first marker
        markerId: MarkerId(Chrysler.toString()),
        position: Chrysler, //position of marker
        infoWindow: InfoWindow( //popup info
          title: 'Chrysler Hall',
          //snippet: 'My Custom Subtitle',
        ), //info window
        onTap: (){
          setState(() {
            selected_build = "Chrysler Hall";
            loc = Chrysler;
            //print(selected_build);
          });
        },
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      )); //Chrysler Hall

      markers.add(Marker( //add first marker
        markerId: MarkerId(Dillon.toString()),
        position: Dillon, //position of marker
        infoWindow: InfoWindow( //popup info
          title: 'Dillon Hall',
          //snippet: 'My Custom Subtitle',
        ), //info window
        onTap: (){
          setState(() {
            selected_build = "Dillon Hall";
            loc = Dillon;
            //print(selected_build);
          });
        },
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      )); //Dillon Hall

      markers.add(Marker( //add first marker
        markerId: MarkerId(Education.toString()),
        position: Education, //position of marker
        infoWindow: InfoWindow( //popup info
          title: 'Education Building',
          //snippet: 'My Custom Subtitle',
        ), //info window
        onTap: (){
          setState(() {
            selected_build = "Education Building";
            loc = Education;
            //print(selected_build);
          });
        },
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      )); //Education Building

      markers.add(Marker( //add first marker
        markerId: MarkerId(Erie.toString()),
        position: Erie, //position of marker
        infoWindow: InfoWindow( //popup info
          title: 'Erie Hall',
          //snippet: 'My Custom Subtitle',
        ), //info window
        onTap: (){
          setState(() {
            selected_build = "Erie Hall";
            loc = Erie;
            //print(selected_build);
          });
        },
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      )); //Erie

      markers.add(Marker( //add first marker
        markerId: MarkerId(Essex.toString()),
        position: Essex, //position of marker
        infoWindow: InfoWindow( //popup info
          title: 'Essex Hall',
          //snippet: 'My Custom Subtitle',
        ), //info window
        onTap: (){
          setState(() {
            selected_build = "Essex Hall";
            loc = Essex;
            //print(selected_build);
          });
        },
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      )); //Essex

      markers.add(Marker( //add first marker
        markerId: MarkerId(Leddy.toString()),
        position: Leddy, //position of marker
        infoWindow: InfoWindow( //popup info
          title: 'Leddy Library',
          //snippet: 'My Custom Subtitle',
        ), //info window
        onTap: (){
          setState(() {
            selected_build = "Leddy Library";
            loc = Leddy;
            //print(selected_build);
          });
        },
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      )); //Leddy

      markers.add(Marker( //add first marker
        markerId: MarkerId(Toldo.toString()),
        position: Toldo, //position of marker
        infoWindow: InfoWindow( //popup info
          title: 'Toldo Building',
          //snippet: 'My Custom Subtitle',
        ), //info window
        onTap: (){
          setState(() {
            selected_build = "Toldo Building";
            loc = Toldo;
            //print(selected_build);
          });
        },
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      )); //Toldo

      markers.add(Marker( //add first marker
        markerId: MarkerId(Odette.toString()),
        position: Odette, //position of marker
        infoWindow: InfoWindow( //popup info
          title: 'Odette School of Business',
          //snippet: 'My Custom Subtitle',
        ), //info window
        onTap: (){
          setState(() {
            selected_build = "Odette School of Business";
            loc = Odette;
            //print(selected_build);
          });
        },
          icon: BitmapDescriptor.defaultMarker,
        //icon: BitmapDescriptor.defaultMarkerWithHue(270.0), //Icon for Marker
      )); //Odette

    }); //setstate

    return markers;
  }//getmarkers

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  /*Map<MarkerId, Marker> markers = <MarkerId, Marker>{

  }; // CLASS MEMBER, MAP OF MARKS
  /**/
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;

    final marker = Marker(
      markerId: MarkerId('place_name'),
      position: LatLng(9.669111, 80.014007),
      // icon: BitmapDescriptor.,
      infoWindow: InfoWindow(
        title: 'title',
        snippet: 'address',
      ),
    );

    setState(() {
      markers[MarkerId('place_name')] = marker;
    });
  }

  void _add() {
    var markerIdVal = MyWayToGenerateId();
    final MarkerId markerId = MarkerId(markerIdVal);

    // creating a new MARKER
    final Marker marker = Marker(
      markerId: markerId,
      position: LatLng(
        center.latitude + sin(_markerIdCounter * pi / 6.0) / 20.0,
        center.longitude + cos(_markerIdCounter * pi / 6.0) / 20.0,
      ),
      infoWindow: InfoWindow(title: markerIdVal, snippet: '*'),
      onTap: () {
        _onMarkerTapped(markerId);
      },
    );

    setState(() {
      // adding a new marker to map
      markers[markerId] = marker;
    });
  }*/ //old code


  /*var location_stored = "";
  var address_stored = "";

  late double latitude;
  late double longitude;

  get_loc() async
  {
      var position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      //var last_pos = await Geolocator.getLastKnownPosition();
      var lat = position.latitude;
      var long = position.longitude;

      latitude = lat;
      longitude = long;
      setState(() {
        location_stored = "Latitude: $lat, Longitude: $long";
      });
      //getAddFromLatLong(position);
      List<Placemark> placemark = await placemarkFromCoordinates(lat, long);
      //print(placemark);
      Placemark place = placemark[0];
      //print(place);
      address_stored = '${place.name}, ${place.street}, ${place.country}';
      print(address_stored);
  }

  get_address() async
  {

  }

  checkValidity(String lat, String long) async
  {
    String def = "Sorry our algorithm indicate that you are off campus";

    if(lat == 42.30672 && long == -83.06846)
      {
        address_stored = "CAW Student Centre";
      }//CAW student centre
    else if(lat == 42.30647 && long == -83.06627)
      {
        address_stored = "Chrysler Hall";
      } //Chrysler Hall

  } */ //the guess location methods.
  /*Future<void> getAddFromLatLong(Position pos) async{
    //var pos = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    List<Placemark> placemark = await placemarkFromCoordinates(pos.latitude, pos.longitude);
    //print(placemark);
    Placemark place = placemark[0];
    //print(place);
    address_stored = '${place.name}, ${place.street}, ${place.country}';
    print(address_stored);
  }*/

  /*
  <key>NSLocationWhenInUseUsageDescription</key>
    <string>Need it for user's location</string>
   */


  /*--------------------------L O C A T I O N S--------------------*/
  List<DropdownMenuItem<String>> get buildings {
    List<DropdownMenuItem<String>> building_names = [
      /*
      -----------------CAW STUDENT CENTRE--------------------
       */
      DropdownMenuItem(child:
      Text("CAW Student Center",
        style: TextStyle(fontSize: 16),
        textAlign: TextAlign.center,),
          value: "CAW Student Center"),
      /*
      -----------------------CHRYSLER HALL-----------------------
       */
      DropdownMenuItem(child:
      Text("Chrysler Hall",
        style: TextStyle(fontSize: 16),
        textAlign: TextAlign.center,),
          value: "Chrysler Hall"),
      /*
      ----------------DILLON HALL----------------
       */
      DropdownMenuItem(child:
      Text("Dillon Hall",
        style: TextStyle(fontSize: 16),
        textAlign: TextAlign.center,),
          value: "Dillon Hall"),
      /*
      ------------------EDUCATION BUILDING------------------
       */
      DropdownMenuItem(child:
      Text("Education Building",
        style: TextStyle(fontSize: 16),
        textAlign: TextAlign.center,),
          value: "Education Building"),
      /*
      ------------------------ERIE HALL--------------
       */
      DropdownMenuItem(child:
      Text("Erie Hall",
        style: TextStyle(fontSize: 16),
        textAlign: TextAlign.center,),
          value: "Erie Hall"),
      /*
      ----------------------ESSEX HALL---------------------
       */
      DropdownMenuItem(child:
      Text("Essex Hall",
        style: TextStyle(fontSize: 16),
        textAlign: TextAlign.center,),
          value: "Essex Hall"),
      /*
      ---------------------LEDDY LIBRARY---------------
       */
      DropdownMenuItem(child:
      Text("Leddy Library",
        style: TextStyle(fontSize: 16),
        textAlign: TextAlign.center,),
          value: "Leddy Library"),
      /*
      ---------------------ODETTE BUILDING---------------------
       */
      DropdownMenuItem(child:
      Text("Odette Building",
        style: TextStyle(fontSize: 16),
        textAlign: TextAlign.center,),
          value: "Odette Building"),
      /*
      ---------------TOLDO BUDILING-------------------
       */
      DropdownMenuItem(child:
      Text("Toldo Building",
        style: TextStyle(fontSize: 16),
        textAlign: TextAlign.center,),
          value: "Toldo Building"),
    ];
    return building_names;
  } //list buildings

  /*----------------------------E M O J I--------------------------*/
  List<DropdownMenuItem<String>> get Moods {
    List<DropdownMenuItem<String>> moodItems = [
      /*
    ------------------------SMILE--------------
     */
      const DropdownMenuItem(child:
      Text("😃",
        style: TextStyle(fontSize: 35),
        textAlign: TextAlign.center,),
          value: "Happy"),
      /*
    ---------------------ANGRY---------------------
     */
      const DropdownMenuItem(child:
      Text("😠",
        style: TextStyle(fontSize: 35),
        textAlign: TextAlign.center,),
          value: "Angry"),
      /*
    ----------------------VOMIT---------------------
     */
      const DropdownMenuItem(child:
      Text("🤮",
        style: TextStyle(fontSize: 35),
        textAlign: TextAlign.center,),
          value: "Ew"),
      /*
    ---------------WINK-------------------
     */
      const DropdownMenuItem(child:
      Text("😉",
        style: TextStyle(fontSize: 35),
        textAlign: TextAlign.center,),
          value: "Flirty"),
      /*
    -----------------------LOVE-----------------------
     */
      const DropdownMenuItem(child:
      Text("❤️",
        style: TextStyle(fontSize: 35),
        textAlign: TextAlign.center,),
          value: "Love"),
      /*
    ----------------JOKE----------------
     */
      const DropdownMenuItem(child:
      Text("🤪",
        style: TextStyle(fontSize: 35),
        textAlign: TextAlign.center,),
          value: "Jokster"),
      /*
    -----------------SAD--------------------
     */
      const DropdownMenuItem(child:
      Text("😞",
        style: TextStyle(fontSize: 35),
        textAlign: TextAlign.center,),
          value: "Sad"),
      /*
    ---------------------NERVOUS---------------
     */
      const DropdownMenuItem(child:
      Text("😬",
        style: TextStyle(fontSize: 35),
        textAlign: TextAlign.center,),
          value: "Nervous"),
      /*
    ---------------------COOL---------------
     */
      const DropdownMenuItem(child:
      Text("😎",
        style: TextStyle(fontSize: 35),
        textAlign: TextAlign.center,),
          value: "Cool"),
    ];
    return moodItems;
  } //list emojis
  /**************************************************************************************/

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Moody'),
      ), //appbar

      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              /**********************************************************************************/
              const Text('\n'),
              /*
                This is for the "BACK TO DASHBOARD BUTTON"
                 */
              ElevatedButton( /////THIS IS A BUTTON
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(10),
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                      /*
                    //source: https://flutterforyou.com/how-to-change-the-color-of-elevatedbutton-in-flutter/
                     */
                      return Colors.grey.shade400;
                    },
                  ), //bg color
                ), //back to dashboard style

                onPressed: () {
                  /*Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => const MyHomePage()),
                        (route) => false); */
                }, //onPressed.
                child: const Text('Back to Dashboard'),
              ), //back to dashboard button
              /**********************************************************************************/

              const Text(
                '\nHow Are you Feeling today?',
                style: TextStyle(fontSize: 25),
                textAlign: TextAlign.center,
              ), //how are you feeling text

              /*------------- e m o j i    b u t t o n --------------*/
              Text( //to align the uwindsor image below.
                    selected_emoji,
                style: const TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ), //text corresponding to the selected drop down menu item

              DropdownButton(
                value: selected_emoji,
                onChanged: (String? new_mood){
                  setState((){
                    selected_emoji = new_mood!;
                    //get_loc();
                  }); //setstate
                },//onChanged emoji
                items: Moods,
                dropdownColor: Colors.grey.shade100,
                icon: const Icon(Icons.arrow_drop_down),
              ), //emoji dropdownbutton
              /**********************************************************************************/


              /*-------------g u e s s    l o c a t i o n --------------*/

              /*ElevatedButton( /////THIS IS A get my location BUTTON
                onPressed: () {
                  get_loc();
                }, //onPressed.
                child: const Text('Get my location ↗'),
              ), //get my location button
              Text(
                //get_loc(),
                "Coordinates: $location_stored\n",
                //'Get my location ↗',
                style: TextStyle(fontSize: 15,color: Colors.blue[700]),
                textAlign: TextAlign.center,

              ),
              Text(
                //get_loc(),
                "Building: $address_stored",
                //'Get my location ↗',
                style: TextStyle(fontSize: 15,color: Colors.blue[700]),
                textAlign: TextAlign.center,
              ),*/ //the button for coordinated

              Container(
                height: MediaQuery.of(context).size.height-500, //to make it fit
                width: MediaQuery.of(context).size.width,
                child: GoogleMap(
                  markers: getmarkers().toSet(),
                  zoomGesturesEnabled: false,
                  initialCameraPosition: CameraPosition(
                    target: startLocation,
                    zoom: 16.4,
                  ), //initial camera position

                  mapType: MapType.normal, //map type
                 // onMapCreated: _onMapCreated,
                  onMapCreated: (controller) { //method called when map is created
                    setState(() {
                      _onMapCreated(controller);
                    });
                  },
                  //markers: markers.values.toSet(),
                ), //googlemap
              ), //container

              Text(
                  "\n" +
                selected_build,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue[700]),
                textAlign: TextAlign.center,
              ), //to guess building


      /**********************************************************************************/

      /*------------- l o c a t i o n    b u t t o n --------------*/
     /* const Text(
      '\n\nInaccurate? Please manually select your location',
      style: TextStyle(fontSize: 23),
      textAlign: TextAlign.center,
      ), //Otherwise please select from list

      DropdownButton(
      value: selected_location,
      onChanged: (String? new_location){
      setState((){
      selected_location = new_location!;
      }); //setstate
      },//onChanged location
      items: buildings,
      dropdownColor: Colors.grey.shade100,
      icon: const Icon(Icons.arrow_drop_down),
      ), */ //location dropdownbutton
      /**********************************************************************************/
      const Text('\n'),
      ElevatedButton( /////THIS IS A SUBMIT BUTTON
        onPressed: () {
          if(loc == LatLng(0,0))
            {
              //selected_build = "Please select a valid location";
            }
          else{
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => MapScreen(selected_emoji: selected_emoji, loc: loc)),
                  (route) => false,
              /*currently goes to the next page regardless. To be edited after connecting with Firebase*/
            ); //navigator.push
          }
        }, //onPressed.
        child: const Text('Submit Answers'),
      ), //submit button
              // /**********************************************************************************/

            ] //children: widget
        ) //child: column
      ) //body
    ); //scaffold
  } //build widget
} //class _SurveyScreenState
