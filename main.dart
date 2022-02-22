//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/src/material/material_state.dart';

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
  //int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
     // _counter++;
    });
  }

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

        child:

         Column(
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

            const Text(
              '\n\n\n\n',
            ),

            Image.asset('assets/images/UofW_logo_3.jpeg'),
            
            const Text(
              'H i m a n i   R a v a l\nA l i n a   N o o r\nCOMP 4990B\n',
                textAlign: TextAlign.center,
              // style: TextStyle(fontSize: 25),
              style: TextStyle (
                  color: Colors.blueGrey,
                  fontSize: 15,
                  fontStyle: FontStyle.italic)
            ),
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AppPage()),
                );
              },
              child: const Text('     Log In     '),),

            const Text(
              '\n\n\n\n\n\n\n\n',
            ),

            ElevatedButton(
              //backgroundColor: const Color(0xFFCDDC39),
              style: ButtonStyle (
                elevation: MaterialStateProperty.all(10),
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                    /* if (states.contains(MaterialState.pressed)) {
                      return Colors.teal.shade100;
                    }
                    //source: https://flutterforyou.com/how-to-change-the-color-of-elevatedbutton-in-flutter/
                    else {*/
                    return Colors.teal.shade300;
                    //}
                  },
                ), //bg color
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AppPage()),
                );
              }, //onPressed

              child: const Text('Anonymous Login ->'),
            ),
          ],
        ),
       /* child: ElevatedButton(
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AppPage()),
            ); },
          //const Text('Launch App'),
        ),*/

     ),
      /*floatingActionButton: FloatingActionButton(
        /*onPressed: _incrementCounter, /******* INSERT NEW SCREEN HERE ******/
        tooltip: 'Increment',*/
          elevation: 0.0,
          child: const Icon(Icons.double_arrow_outlined),
          backgroundColor: const Color(0xFFCDDC39),
          onPressed: () {
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AppPage()),
            ); }
        //child: const Icon(Icons.check),
     ), */// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class AppPage extends StatelessWidget {
  const AppPage({Key? key}) : super(key: key);

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
              ElevatedButton( /////THIS IS A BUTTON
                onPressed: () {
                  // Navigate back to first route when tapped.
                },
                child: const Text('Submit Answers'),
                ),
             ]
        )
      ),
    );
  }
}
