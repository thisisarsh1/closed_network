import 'package:closed_network/LoadingScreen.dart';
import 'package:closed_network/LoginScreen.dart';
import 'package:closed_network/RegisterEmailScreen.dart';
import 'package:closed_network/RegisterScreen.dart';
import 'package:flutter/material.dart';

import 'HomeScreen.dart';
import 'MessageScreen/Message_view.dart';

//Black – main background
//
// TealAccent – primary accent
//
// Charcoal – for cards and surfaces
//
// Dim Grey – for borders and dividers
//
// White – for primary text
//
// Light Grey – for secondary text
//
// TealAccent (again) – for icons and highlights






//Font Name	Style	Use for
// Sora	Sleek, digital Gen Z vibe	Headlines
// Chakra Petch	Futuristic, edgy	Titles or highlights
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Closed Network',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black45),
      ),
      // home: const MyHomePage(),
      home:  HomePage(),
    );
  }
}
