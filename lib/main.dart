import 'package:flutter/material.dart';
import './screens/LoginScreen.dart';
import './screens/EventsScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child:
          MaterialApp(title: 'Flutter Demo', initialRoute: '/login', routes: {
        '/login': (context) => LoginScreen(),
        '/events': (context) => EventsScreen(),
      }),
    );
  }
}
