import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late int index;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    index = 0;
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Flutter에서 화면 이동하기"),
        ),
        body: homeBody(),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "Search",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "User",
            ),
          ],
          currentIndex: index,
          onTap: (newIndex) {
            setState(() {
              index = newIndex;
            });
          },
        ),
      ),
    );
  }

  Widget homeBody() {
    switch (index) {
      case 1:
        return const Center(
          child: Icon(
            Icons.search,
            size: 100,
          ),
        );
      case 2:
        return const Center(
          child: Icon(
            Icons.person,
            size: 100,
          ),
        );
      case 0:
      default:
        return const Center(
          child: Icon(Icons.home, size: 100),
        );
    }
  }
}
