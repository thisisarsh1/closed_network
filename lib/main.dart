import 'package:closed_network/LoadingScreen.dart';
import 'package:closed_network/LoginScreen.dart';
import 'package:closed_network/RegisterEmailScreen.dart';
import 'package:closed_network/RegisterScreen.dart';
import 'package:flutter/material.dart';
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
      home:  LoadingScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {



  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(

      body:
        Container(

        )
    );
  }
}
