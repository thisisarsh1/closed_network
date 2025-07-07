import 'package:closed_network/Authentication/Email.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Authentication/GoogleLogin.dart';
import 'firebase_options.dart';

import 'LoadingScreen.dart';
import 'HomeScreen.dart'; // keep if you navigate there later

Future<void> main() async {
  // Must come first when you await anything before runApp.
  WidgetsFlutterBinding.ensureInitialized();

  // Initialise Firebase once, synchronously, before the app starts.
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Closed Network',
      debugShowCheckedModeBanner: false,

      // ---------- Global theme ----------
      theme: ThemeData(
        // Dark base so black surfaces inherit correct contrast.
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,           // Black – main background
        cardColor: const Color(0xFF2B2B2B),             // Charcoal – cards
        dividerColor: Colors.grey.shade700,             // Dim Grey – dividers
        primaryColor: Colors.tealAccent,                // TealAccent – primary accent
        iconTheme: const IconThemeData(
          color: Colors.tealAccent,                     // Icons & highlights
        ),

        // Text styles
        textTheme: GoogleFonts.soraTextTheme().copyWith(
          // Primary text – white
          bodyLarge: const TextStyle(color: Colors.white),
          bodyMedium: const TextStyle(color: Colors.white),
          // Secondary text – light grey
          bodySmall: TextStyle(color: Colors.grey.shade400),
        ),

        // ColourScheme is useful for M3 widgets
        colorScheme: ColorScheme.dark(
          primary: Colors.tealAccent,
          secondary: Colors.tealAccent,
          surface: const Color(0xFF2B2B2B),             // Charcoal surfaces
          background: Colors.black,
          onPrimary: Colors.black,                      // text/icons on teal
          onSurface: Colors.white,
        ),
        useMaterial3: true,
      ),
      // Show a lightweight loading screen first; push to HomeScreen when ready.

      home:  Authgate(),
    );
  }
}
class Authgate extends StatelessWidget{
  @override
  Widget build(BuildContext context) {


     return authService.value.isLoggedIn ? HomePage():LoadingScreen();
  }

}