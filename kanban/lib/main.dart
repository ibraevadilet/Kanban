import 'package:flutter/material.dart';
import 'package:kanban/screens/loginScreen/loginScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Kanban",
        home: LoginScreen(),
      );
}
