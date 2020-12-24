import 'dart:io';

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
      home: MyAppPage(title: 'Bottom Navigation Bar'),
    );
  }
}

class MyAppPage extends StatefulWidget {
  MyAppPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyAppPageState createState() => _MyAppPageState();
}

const _backgroundColor = Colors.blue;

const _homeIcon = Icon(Icons.home);
const _searchIcon = Icon(Icons.search);
const _addIcon = Icon(Icons.add);
const _settingsIcon = Icon(Icons.settings);

class _MyAppPageState extends State<MyAppPage> {
  int _currentIndex = 0;

  final List<Widget> _screens = <Widget>[
    Home(),
    Search(),
    Add(),
    Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Container(
        color: Colors.blue[900],
        child: _screens[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: _homeIcon, label: 'Home', backgroundColor: _backgroundColor),
          BottomNavigationBarItem(icon: _searchIcon, label: 'Search', backgroundColor: _backgroundColor),
          BottomNavigationBarItem(icon: _addIcon, label: 'Add', backgroundColor: _backgroundColor),
          BottomNavigationBarItem(icon: _settingsIcon, label: 'Settings', backgroundColor: _backgroundColor),
        ],
        onTap: (value) => setState(() {
          _currentIndex = value;
        }),
      ),
    );
  }
}

const Duration _duration = Duration(seconds: 2);

const TextStyle _textStyle = TextStyle(color: Colors.white, fontSize: 20);

class Home extends StatefulWidget {
  // Maintains state when switched between screens
  int _counter = 0;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void _incrementCounter() {
    setState(() {
      widget._counter += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    // _incrementCounter();

    return Container(
      child: InkWell(
        onTap: _incrementCounter,
        child: Center(
          child: Text(
            'Home: ${widget._counter}',
            style: _textStyle,
          ),
        ),
      ),
    );
  }
}

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  // DOESN'T maintains state when switching between screens
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    // sleep(_duration);

    return Container(
      child: InkWell(
        onTap: _incrementCounter,
        child: Center(
          child: Text(
            'Search: $_counter',
            style: _textStyle,
          ),
        ),
      ),
    );
  }
}

class Add extends StatefulWidget {
  // Takes time to build the widget everytime switched between screens
  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {
  @override
  Widget build(BuildContext context) {
    // Simulating a network call
    sleep(_duration);

    return Container(
      child: Center(
        child: Text(
          'Add',
          style: _textStyle,
        ),
      ),
    );
  }
}

class Settings extends StatefulWidget {
  // You would think it will take time to build the first time the widget is
  // created. But it's not the case as the createState is called multiple
  // times by the framework. And state doesn't mean that the widget is stored,
  // just some information about the widget
  // So this takes time to build everytime the
  // screen is changed
  @override
  _SettingsState createState() {
    sleep(_duration);
    return _SettingsState();
  }
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          'Settings',
          style: _textStyle,
        ),
      ),
    );
  }
}
