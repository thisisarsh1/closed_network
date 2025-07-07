import 'package:closed_network/HomeScreen.dart';
import 'package:closed_network/ManualRegister.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class GoogleButton extends StatelessWidget {
  final VoidCallback onPressed;

  const GoogleButton({
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
        side: const BorderSide(color: Colors.white), // White border
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 2,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        minimumSize: const Size(double.infinity, 54),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/crypto%2Fsearch%20(2).png?alt=media&token=24a918f7-3564-4290-b7e4-08ff54b3c94c",
            width: 20,
          ),
          const SizedBox(width: 20),
          Text(
            'Sign in with Google',
            style: GoogleFonts.sora(
                textStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                )
            ),
          ),
        ],
      ),
    );

  }
}

class RegisterEmailScreen extends StatelessWidget {
  final name;

  const RegisterEmailScreen({super.key, this.name});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Supp! ${name}",
                style: GoogleFonts.chakraPetch(
                    textStyle: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                    )
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),

              Text(
                "Use your official (.edu.in) email ID to join the squad — no outsiders allowed!",
                 style: GoogleFonts.chakraPetch(
                     textStyle: TextStyle(
                         fontSize: 30,
                         fontWeight: FontWeight.bold,
                         color: Colors.white
                     )
                 ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              GoogleButton(
                onPressed: () {
                  // Handle Google sign-in
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                    return HomePage();
                  },));
                },
              ),
              const SizedBox(height: 60),

              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ManualRegisterScreen(Name: name.toString()),));
                },
                child: Text(
                  "Your Clg doesn't provide one ?",
                  style: GoogleFonts.chakraPetch(
                      textStyle: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey
                      )
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
