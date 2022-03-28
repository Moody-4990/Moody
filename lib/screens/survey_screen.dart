import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:moody/main.dart';
import 'package:moody/screens/map_screen.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SurveyScreen extends StatefulWidget
{
  const SurveyScreen({Key? key}) : super(key: key);
  @override
  _SurveyScreenState createState() => _SurveyScreenState();
}

class _SurveyScreenState extends State<SurveyScreen> {

  String selected_emoji = "Smile";
  String selected_location = "CAW Student Center";

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
          value: "Smile"),
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
                '\n\nHow Are you Feeling today?',
                style: TextStyle(fontSize: 25),
                textAlign: TextAlign.center,
              ), //how are you feeling text

              /*------------- e m o j i    b u t t o n --------------*/
              Text( //to align the uwindsor image below.
                '\n' +
                    selected_emoji,
                style: const TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ), //text corresponding to the selected drop down menu item

              DropdownButton(
                value: selected_emoji,
                onChanged: (String? new_mood){
                  setState((){
                    selected_emoji = new_mood!;
                  }); //setstate
                },//onChanged emoji
                items: Moods,
                dropdownColor: Colors.grey.shade100,
                icon: const Icon(Icons.arrow_drop_down),
              ), //emoji dropdownbutton
              /**********************************************************************************/

              /*------------- l o c a t i o n    b u t t o n --------------*/
              const Text(
                '\n\nWhere are you?',
                style: TextStyle(fontSize: 25),
                textAlign: TextAlign.center,
              ), //Where are you text

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
              ), //location dropdownbutton
              /**********************************************************************************/

              const Text('\n\n\n'),
              ElevatedButton( /////THIS IS A SUBMIT BUTTON
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const MapScreen()),
                    (route) => false,
                    /*currently goes to the next page regardless. To be edited after connecting with Firebase*/
                  ); //navigator.push
                }, //onPressed.
                child: const Text('Submit Answers'),
              ), //submit button
              /**********************************************************************************/

            ] //children: widget
        ) //child: column
      ) //body

    ); //scaffold
  } //build widget
} //class _SurveyScreenState
