import 'package:flutter/material.dart';
import 'package:flutter_application_2/flutter_navigator/main_4_2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeWidget(),
    );
  }
}

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter에서 화면 이동하기"),
      ),
      body: Center(
        child: TextButton(
          child: const Text("Go go Page"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const NewPage(),
              ),
            );
          },
        ),
      ),
    );
  }
}
