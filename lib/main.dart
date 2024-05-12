import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liwe3/controllers/firebase_controller.dart';
import 'package:liwe3/demo/firebase_options.dart';
import 'package:liwe3/demo/notif_impl.dart';

import 'stores/app.dart';

import 'demo/api.dart';
import 'demo/buttons.dart';
import 'demo/dialogs.dart';
import 'demo/input.dart';
import 'demo/sec_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final firebaseController = Get.put(LiWEFirebaseController());
  await firebaseController.initialize(
    notificationInit: notificationInit,
    showNotification: showNotification,
    options: DefaultFirebaseOptions.currentPlatform,
    topics: ['all', 'test1', 'abc'],
  );
// void main() {
  runApp(const MyApp());
}

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

  final List<Future<Widget>> _children = [
    inputsScreen(),
    buttonsScreen(),
    secureStorageScreen(),
    dialogsScreen(),
    apiScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder<Widget>(
        future: _children[_currentIndex],
        builder: (BuildContext context, AsyncSnapshot<Widget> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator(); // show loading spinner while waiting
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}'); // show error message if there's an error
          } else {
            return snapshot.data!; // show the widget when data is available
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        fixedColor: Colors.blue,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inputs',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Buttons and Texts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'SecStorage',
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
