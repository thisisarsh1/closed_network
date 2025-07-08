import 'package:closed_network/HomeScreen.dart';
import 'package:closed_network/ManualRegister.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Authentication/GoogleLogin.dart';
import 'Components/SnackBar.dart';


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
              GoogleBtn(
                onSuccess: (displayname) {
                  AwesomeSnackbar.success(
                    context,
                    'Welcome onBoard $displayname !!',
                    'Have a good time!',
                  );
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
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
