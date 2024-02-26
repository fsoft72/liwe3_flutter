import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'stores/app.dart';
import 'demo/api.dart';
import 'demo/buttons.dart';
import 'demo/dialogs.dart';
import 'demo/input.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    appStore.baseURL = "http://10.179.1.155:12000";

    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final List<Widget> _children = [
    inputsScreen(),
    buttonsScreen(),
    dialogsScreen(),
    apiScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inputs',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Buttons',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Dialogs',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'APIs',
          ),
        ],
      ),
    );
  }
}
