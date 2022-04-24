import 'package:flutter/material.dart';

void main() {
  //macam public static void in java; entre/starting point
  runApp(const MyApp()); //class MyApp
}

class MyApp extends StatelessWidget {
  //StatelessWidget - another class that handle UI (no state widget) static yg luar frame dia
  const MyApp({Key? key})
      : super(key: key); //constructor; class name; parameter key

  // This widget is the root of your application.
  @override //widget build method build context passing context object;
  Widget build(BuildContext context) {
    //build method give instruction to return class/widget/ui
    return MaterialApp(
      //MaterialApp as base design
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple, //primary color of app
      ),
      home: const MyHomePage(
          title: 'Flutter Demo Home Page'), //MyHomePage is another class
    );
  }
}

class MyHomePage extends StatefulWidget {
  //Stateful - non static; section tengah putih tu
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      //tell UI Update
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //entire layout consist App Bar atas while body white section
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        //widget center
        child: Column(
          //column for multiple interface elememnts
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Anda telah tekan butang sebanyak:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        //button tambah
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
