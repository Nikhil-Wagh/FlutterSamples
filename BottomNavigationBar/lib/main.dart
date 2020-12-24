import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Bottom Navigation Bar'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      // body: Container(
      //   color: Colors.blue[900],
      // ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home', backgroundColor: Colors.blue),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search', backgroundColor: Colors.blue),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add', backgroundColor: Colors.blue),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings', backgroundColor: Colors.blue),
        ],
        onTap: (value) => setState(() {
          _currentIndex = value;
        }),
      ),
    );
  }
}
