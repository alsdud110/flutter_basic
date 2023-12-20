import 'package:flutter/material.dart';
import 'package:flutter_application_2/flutter_navigator/main_4_2.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(
    MaterialApp.router(
      routerConfig: GoRouter(
        initialLocation: "/",
        routes: [
          GoRoute(
            path: "/",
            name: "Home",
            builder: (context, _) => const HomePage(),
          ),
          GoRoute(
            path: "/new",
            name: "new",
            builder: (context, _) => const NewPage(),
          ),
          GoRoute(
            path: "/new1",
            name: "new1",
            builder: (context, _) => const HomePage(),
          ),
        ],
      ),
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            context.pushNamed("new");
          },
          child: const Text("Go Router"),
        ),
      ),
    );
  }
}
