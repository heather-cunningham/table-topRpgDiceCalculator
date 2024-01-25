import 'package:flutter/material.dart';


void main() {
  runApp(const TableTopRPGDiceCalculatorApp());
}

class TableTopRPGDiceCalculatorApp extends StatelessWidget {
  const TableTopRPGDiceCalculatorApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Table-Top RPG Dice Calculator',
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
        primarySwatch: Colors.blue,
      ),
      home: const TTRPGDiceCalculatorHomePage(title: 'TT-RPG Dice Calculator Home'),
    );
  }
}

class TTRPGDiceCalculatorHomePage extends StatefulWidget {
  // constructor
  const TTRPGDiceCalculatorHomePage({super.key, required this.title});

  final String title;

  @override
  State<TTRPGDiceCalculatorHomePage> createState() => _TTRPGDiceCalculatorHomePageState();
}

class _TTRPGDiceCalculatorHomePageState extends State<TTRPGDiceCalculatorHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: const FloatingActionButton(
        onPressed: null,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
