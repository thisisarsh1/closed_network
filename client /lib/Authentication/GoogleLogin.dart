import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import '../Components/SnackBar.dart';

class GoogleBtn extends StatefulWidget {
  final void Function(String emailOrName) onSuccess;

  const GoogleBtn({super.key, required this.onSuccess});

  @override
  State<GoogleBtn> createState() => _GoogleBtnState();
}

class _GoogleBtnState extends State<GoogleBtn> {
  bool _isLoading = false;

  Future<void> _handleSignIn() async {
    setState(() => _isLoading = true);

    final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email', 'profile']);
    try {
      final user = await _googleSignIn.signIn();
      final name = user?.displayName;

      if (user != null && name != null && name.trim().isNotEmpty) {
        widget.onSuccess(name);
        AwesomeSnackbar.success(
          context,
          'Welcome onBoard $name !!',
          'Have a good time!',
        );
      } else {
        AwesomeSnackbar.error(
          context,
          'User cancelled sign-in or no name found!',
          'Please try again',
        );
      }
    } catch (e) {
      AwesomeSnackbar.error(
        context,
        'Google Sign-In error',
        e.toString(),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }
  @override
  Widget build(BuildContext context) {return SizedBox(
    width: double.infinity,
    height: 50,
    child: ElevatedButton.icon(
      onPressed: _isLoading ? null : _handleSignIn,
      icon: _isLoading
          ? const SizedBox(
        height: 25,
        width: 25,
        child: CircularProgressIndicator(
          strokeWidth: 3,
          color: Colors.grey,
        ),
      )
          : const Icon(
        MaterialCommunityIcons.google,
        color: Colors.grey,
        size: 28,
        textDirection: TextDirection.ltr,
      ),
      label: Text(
        _isLoading ? 'Signing in...' : 'Sign in with Google',
        style: GoogleFonts.sora(
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.grey,
            letterSpacing: 0.8,
          ),
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        foregroundColor: Colors.grey,
        elevation: 8,
        side: const BorderSide(color: Colors.grey, width: 1.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14.0),
        ),
        shadowColor: Colors.grey.shade800,
        padding: const EdgeInsets.symmetric(horizontal: 16),
      ),
    ),
  );

  }

  }

