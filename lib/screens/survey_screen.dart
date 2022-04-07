import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moody/main.dart';
import 'package:moody/screens/map_screen.dart';
import 'package:moody/screens/survey_screen.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';



//final File jsonFile = File('/Users/himaniraval/moody/lib/screens/data.json');
//List<JsonFileManager> listItems = [];
//late DateTime stamp;

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

  LatLng loc = LatLng(0, 0);

  var selected_build = "";
  late GoogleMapController mapController;

  String store = "";

  //dataStorage inst = dataStorage();
  /*
  ---------------------M Y  V A R I A B L E S-------------------------
   */
  late File DataFile;
  late Directory direct;
  bool isOpen = false;
  String file_name = "userData.txt";
  String hold = "";
  String time_stamp = "";

  /*
  <key>LSSupportsOpeningDocumentsInPlace</key>
    <true/>
    <key>UIFileSharingEnabled</key>
    <true/>
   */

  @override
  void initState() {
    super.initState();
    getApplicationSupportDirectory().then((Directory directory) {
      direct = directory;
      print(direct.toString());
      DataFile = new File(direct.path + "/" + file_name);
      DataFile.createSync();
      DataFile.exists().then((bool something) {
        isOpen = something;
        //hold = DataFile.readAsStringSync();
      });
      if (isOpen) {
        this.setState(() {
          hold = DataFile.readAsStringSync();
        }); //setState
      } //ifStatement
    }); //getapplicationdirectory
  } //InitState


  String readFromDataFile() {
    print("filepath: $DataFile");
    String content_DataFile = DataFile.readAsStringSync();
    print("Content: $content_DataFile");
    return content_DataFile;
  }

  writeToDataFile(String emoji, String loc, String time_stamp) {
    String _append = "{Emoji: $emoji Location: $loc Time: $time_stamp}";
    String old = readFromDataFile();
    String add = "";
    add = "$old\n$_append";
    print("add: $add");
    DataFile.writeAsString(add);
  }

  /*
  -----------------------------------------------------------------------
   */


  final Set<Marker> markers = new Set();

  Set<Marker> getmarkers() {
    //markers to place on map
    setState(() {
      markers.add(Marker( //add first marker
        markerId: MarkerId(CAW.toString()),
        position: CAW,
        //position of marker
        infoWindow: InfoWindow( //popup info
          title: 'CAW Student Centre',
          //snippet: 'My Custom Subtitle',
        ),
        //info window
        onTap: () {
          setState(() {
            selected_build = "CAW Student Center";
            loc = CAW;
            //print(selected_build);
          });
        },
        //onTap
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      )); //line 32 marker-add //CAW

      markers.add(Marker( //add first marker
        markerId: MarkerId(Chrysler.toString()),
        position: Chrysler,
        //position of marker
        infoWindow: InfoWindow( //popup info
          title: 'Chrysler Hall',
          //snippet: 'My Custom Subtitle',
        ),
        //info window
        onTap: () {
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
        position: Dillon,
        //position of marker
        infoWindow: InfoWindow( //popup info
          title: 'Dillon Hall',
          //snippet: 'My Custom Subtitle',
        ),
        //info window
        onTap: () {
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
        position: Education,
        //position of marker
        infoWindow: InfoWindow( //popup info
          title: 'Education Building',
          //snippet: 'My Custom Subtitle',
        ),
        //info window
        onTap: () {
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
        position: Erie,
        //position of marker
        infoWindow: InfoWindow( //popup info
          title: 'Erie Hall',
          //snippet: 'My Custom Subtitle',
        ),
        //info window
        onTap: () {
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
        position: Essex,
        //position of marker
        infoWindow: InfoWindow( //popup info
          title: 'Essex Hall',
          //snippet: 'My Custom Subtitle',
        ),
        //info window
        onTap: () {
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
        position: Leddy,
        //position of marker
        infoWindow: InfoWindow( //popup info
          title: 'Leddy Library',
          //snippet: 'My Custom Subtitle',
        ),
        //info window
        onTap: () {
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
        position: Toldo,
        //position of marker
        infoWindow: InfoWindow( //popup info
          title: 'Toldo Building',
          //snippet: 'My Custom Subtitle',
        ),
        //info window
        onTap: () {
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
        position: Odette,
        //position of marker
        infoWindow: InfoWindow( //popup info
          title: 'Odette School of Business',
          //snippet: 'My Custom Subtitle',
        ),
        //info window
        onTap: () {
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
  } //getmarkers

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

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
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Moody'),
        ), //appbar
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  /**********************************************************************************/

                  const Text(
                    'How Are you Feeling today?',
                    style: TextStyle(fontSize: 25),
                    textAlign: TextAlign.center,
                  ),
                  //how are you feeling text

                  /*------------- e m o j i    b u t t o n --------------*/
                  Text( //to align the uwindsor image below.
                    selected_emoji,
                    style: const TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                  //text corresponding to the selected drop down menu item

                  DropdownButton(
                    value: selected_emoji,
                    onChanged: (String? new_mood) {
                      setState(() {
                        selected_emoji = new_mood!;
                        //get_loc();
                      }); //setstate
                    },
                    //onChanged emoji
                    items: Moods,
                    dropdownColor: Colors.grey.shade100,
                    icon: const Icon(Icons.arrow_drop_down),
                  ),
                  //emoji dropdownbutton
                  /**********************************************************************************/

                  Container(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height - 350, //to make it fit
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    child: GoogleMap(
                      markers: getmarkers().toSet(),
                      zoomGesturesEnabled: false,
                      initialCameraPosition: CameraPosition(
                        target: startLocation,
                        zoom: 17,
                      ),
                      //initial camera position

                      mapType: MapType.normal,
                      //map type
                      // onMapCreated: _onMapCreated,
                      onMapCreated: (
                          controller) { //method called when map is created
                        setState(() {
                          _onMapCreated(controller);
                        });
                      },
                      //markers: markers.values.toSet(),
                    ), //googlemap
                  ),
                  //container

                  Text(
                    //"\n" +
                    selected_build,
                    style: TextStyle(fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[700]),
                    textAlign: TextAlign.center,
                  ),
                  //to guess building

                  /**********************************************************************************/
                  //const Text('\n'),
                  ElevatedButton( /////THIS IS A SUBMIT BUTTON
                    onPressed: () {
                      //readFileData();
                      if (loc == LatLng(0, 0)) {
                        //selected_build = "Please select a valid location";
                      }
                      else {
                        DateTime now = new DateTime.now();
                        time_stamp = now.toString();

                       writeToDataFile(
                           selected_emoji, selected_build, time_stamp);

                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => MapScreen(
                              selected_emoji: selected_emoji, loc: loc)),
                              (route) => false,
                          /*currently goes to the next page regardless. To be edited after connecting with Firebase*/
                        ); //navigator.push
                      }
                    }, //onPressed.
                    child: const Text('Submit Answers'),
                  ),
                  //submit button
                  // /**********************************************************************************/

                ] //children: widget
            ) //child: column
        ) //body
    ); //scaffold
  } //build widget
}//class survey