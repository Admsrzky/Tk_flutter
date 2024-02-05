import 'package:flutter/material.dart';
import 'package:tk_online_flutter/screens/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Babeh Store',
      home: HomePage(),
    );
  }
}
