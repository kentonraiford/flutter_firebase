import 'package:flutter/material.dart';
import 'package:firebase/Auth/auth.dart';
import 'root_page.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget
{
  @override //Build the widget's hierarchy
  Widget build(BuildContext context)
  {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter login demo",
      theme: ThemeData(
        primarySwatch: Colors.blue
        ),
      home: RootPage(auth: Auth())
    );
  }
}
