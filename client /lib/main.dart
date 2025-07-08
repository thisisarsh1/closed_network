import 'package:closed_network/Authentication/ManualAuth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:io';

import 'Authentication/GoogleLogin.dart';
import 'Notification.dart';
import 'firebase_options.dart';
import 'LoadingScreen.dart';
import 'HomeScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // ✅ Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // ✅ Request notification permission
  await FirebaseMessaging.instance.requestPermission();

  // ✅ Safely get FCM token (handles iOS APNs token delay)
  await getFCMTokenSafely();

  runApp(const MyApp());
}

Future<void> getFCMTokenSafely() async {
  final messaging = FirebaseMessaging.instance;

  if (Platform.isIOS) {
    String? apnsToken;
    int tries = 0;

    while (apnsToken == null && tries < 50) {
      apnsToken = await messaging.getAPNSToken();
      await Future.delayed(const Duration(milliseconds: 200));
      tries++;
    }

    if (apnsToken == null) {
      print("❌ APNs token not available.");
      return;
    }
  }

  final token = await messaging.getToken();
  print("📩 FCM Token: $token");
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Closed Network',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        cardColor: const Color(0xFF2B2B2B),
        dividerColor: Colors.grey.shade700,
        primaryColor: Colors.tealAccent,
        iconTheme: const IconThemeData(color: Colors.tealAccent),
        textTheme: GoogleFonts.soraTextTheme().copyWith(
          bodyLarge: const TextStyle(color: Colors.white),
          bodyMedium: const TextStyle(color: Colors.white),
          bodySmall: TextStyle(color: Colors.grey.shade400),
        ),
        colorScheme: ColorScheme.dark(
          primary: Colors.tealAccent,
          secondary: Colors.tealAccent,
          surface: const Color(0xFF2B2B2B),
          background: Colors.black,
          onPrimary: Colors.black,
          onSurface: Colors.white,
        ),
        useMaterial3: true,
      ),
      home: AuthGate(),
    );
  }
}

class AuthGate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return authService.value.isLoggedIn ? HomePage() : LoadingScreen();
  }
}
