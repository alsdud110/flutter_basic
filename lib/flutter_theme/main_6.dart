import 'package:flutter/material.dart';
import 'package:flutter_application_2/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Theme"),
      ),
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          decoration:
              BoxDecoration(color: Theme.of(context).colorScheme.tertiary),
          child: Center(
            child: Text(
              "안녕하세요",
              style: textTheme.bodyMedium,
            ),
          ),
        ),
      ),
    );
  }
}
