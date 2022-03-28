import 'package:flutter/cupertino.dart';
import 'dart:io';

//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/src/material/material_state.dart';
import 'package:moody/screens/survey_screen.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Moody',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.lime,
      ),
      home: const MyHomePage(title: 'Moody'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.

        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[

            const Text( //to align the uwindsor image below.
              '\n\n\n\n',
            ),

            //uwindsor image
            Image.asset('assets/images/UofW_logo_2.png'),

            /*-----------TO BE EDITED AT A LATER DATE-IF DEEMED UNNECESSARY--------*/
            const Text(
              '\n\nH i m a n i   R a v a l\nA l i n a   N o o r\nCOMP 4990B\n',
                textAlign: TextAlign.center,
              // style: TextStyle(fontSize: 25),
              style: TextStyle (
                  color: Colors.blueGrey,
                  fontSize: 15,
                  fontStyle: FontStyle.italic)
            ),

            /* ADD THE LOGIN TEXT SPACE HERE */

            /*----LOG IN BUTTON HERE----*/
            ElevatedButton(
              style: ButtonStyle (
                elevation: MaterialStateProperty.all(10),
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                    return Colors.blueGrey.shade200;
                  },
                ), //bg color
              ),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const SurveyScreen()),
                    (route) => false,
                /*Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AppPage()), */
                  /*currently goes to the next page regardless. To be edited after connecting with Firebase*/
                );
              }, //onPressed
              child: const Text('     Log In     '),),

            const Text(
              '\n\n\n\n\n\n\n\n',
            ),

            /*----Anonymous Login Button----*/
            ElevatedButton(
              //backgroundColor: const Color(0xFFCDDC39),
              style: ButtonStyle (
                elevation: MaterialStateProperty.all(10),
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                    /*
                    //source: https://flutterforyou.com/how-to-change-the-color-of-elevatedbutton-in-flutter/
                     */
                    return Colors.teal.shade300;
                  },
                ), //bg color
              ),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const SurveyScreen()),
                    (route) => false);
                /*Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AppPage()),
                );*/
              }, //onPressed

              child: const Text('Anonymous Login ->'),
            ),
          ],
        ),

     ),
    );
  }
}


/*
*
* Emojis
*
* Declaring Drop Down List here
*
 */
/*List<DropdownMenuItem<String>> get dropdownItems{
  List<DropdownMenuItem<String>> menuItems = [
    //const DropdownMenuItem(child: Icon(CupertinoIcons.smiley),value: "Smiley"),
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
        value: "Vomit"),

    /*
    ---------------WINK-------------------
     */
    const DropdownMenuItem(child:
    Text("😉",
      style: TextStyle(fontSize: 35),
      textAlign: TextAlign.center,),
        value: "Wink"),

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
        value: "Joke"),

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
        value: "Nervous"),
  ];
  return menuItems;
}
String selectedValue = "Smile"; */

/*------ SECOND SCREEN WHERE ANSWERS WILL BE RECORDED------*/
/*class AppPage extends StatelessWidget {
  const AppPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Moody'),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const Text( //to align the uwindsor image below.
                '\n\n\n\n',
                 // '😀 😃 😄 😁 😆 😅 😂 🤣 🥲 ☺️ 😊 😇 🙂 🙃 😉 😌 😍 🥰 😘 😗 😙 😚 😋 😛 😝 😜 🤪 🤨',
              style: TextStyle(fontSize: 45),
              textAlign: TextAlign.center,
              ),

              DropdownButton(
                  value: selectedValue,
                  dropdownColor: Colors.grey.shade100,
                  icon: const Icon(Icons.arrow_drop_down),
                  onChanged: (String? newValue){
                    setState(newValue!);
                  },
                  items: dropdownItems,
                  //update()
              ),

              Text( //to align the uwindsor image below.
                '\n\n\n\n' +
                selectedValue,
                style: const TextStyle(fontSize: 45),
                textAlign: TextAlign.center,
              ),


              ElevatedButton( /////THIS IS A BUTTON
                onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const End_Page()),
                      /*currently goes to the next page regardless. To be edited after connecting with Firebase*/
                    );
                  }, //onPressed.
                child: const Text('Submit Answers'),
                ),
             ]
        )
      ),
    );
  }

  void setState(String newValue) {
    selectedValue = newValue;

  }*/
//}

/*------ Third SCREEN only string will appear------*/
/*class End_Page extends StatelessWidget {
  const End_Page({Key? key}) : super(key: key);

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
                  'Thanks for your response.\n Please exit the application\n\n',
                  textAlign: TextAlign.center,
            style: TextStyle (
              color: Colors.blueGrey,
              fontSize: 25 ),
                ),
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
                  ),
                  onPressed: () {
                    exit(0);
                    // Navigate back to first route when tapped.
                  },

                  child: const Text(
                      'X',
                      textAlign: TextAlign.center,
                      // style: TextStyle(fontSize: 25),
                      style: TextStyle (
                          color: Colors.white,
                          fontSize: 15),
                         // fontStyle: FontStyle.italic)
                     ),
                ),
              ],
          ),
      ),
    );
  }
}*/