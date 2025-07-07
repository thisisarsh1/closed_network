import 'package:closed_network/Authentication/Email.dart';
import 'package:closed_network/HomeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:closed_network/Components/SnackBar.dart';

class ManualRegisterScreen extends StatefulWidget {
  final String Name;
  const ManualRegisterScreen({super.key,required this.Name});

  @override
  State<ManualRegisterScreen> createState() => _ManualRegisterScreenState();
}

class _ManualRegisterScreenState extends State<ManualRegisterScreen> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _confirmPassController = TextEditingController();

  String? selectedCollege;

  final List<String> colleges = List.generate(
      50, (index) => 'College ${index + 1}, Mumbai');

  @override
  void dispose() {
    _emailController.dispose();
    _passController.dispose();
    _confirmPassController.dispose();
    super.dispose();
  }

  Future<void> _submitForm() async {
    final email   = _emailController.text.trim();
    final pass    = _passController.text;
    final confirm = _confirmPassController.text;

    // very loose RFC‑5322‑ish check; good enough for UI validation
    final emailRegex =
    RegExp(r"^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}$", caseSensitive: false);

    if (email.isEmpty ||
        pass.isEmpty ||
        confirm.isEmpty ||
        selectedCollege == null) {
      AwesomeSnackbar.error(
          context, 'Missing Fields', 'Please fill out all fields.');
    } else if (!emailRegex.hasMatch(email)) {
      AwesomeSnackbar.error(
          context, 'Invalid Email', 'Enter a valid e‑mail address.');
    } else if (pass != confirm) {
      AwesomeSnackbar.error(
          context, 'Password Mismatch', 'Passwords do not match.');
    } else {
      try {
        await authService.value.signUp(email: email, password: pass);

        await FirebaseAuth.instance.currentUser
            ?.updateDisplayName(widget.Name);
        await FirebaseAuth.instance.currentUser?.reload();
        AwesomeSnackbar.success(
            context, 'Hurray ! You are Part of The Club Now', 'Welcome to the Club !!');
        if(authService.value.isLoggedIn){
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return HomePage();
          },));
        }

      }on FirebaseException catch(e){
        AwesomeSnackbar.error(
            context, '${e.message}', 'Please Fix it !');
      };

    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [

              Padding(
                padding: const EdgeInsets.fromLTRB(14, 0, 14, 30),
                child: Text(
                  "Your Clg didn't give you an email? Don't worry, we got you!",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.chakraPetch(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ),

              // everything below stays the same ──▼
              Text(
                'Register Your Account',
                style: GoogleFonts.chakraPetch(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 25),
              CustomTextField(
                controller: _emailController,
                hintText: "you@domain.com",
                labelText: "Email Address",
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _passController,
                hintText: "••••••••",
                labelText: "Password",
                obscureText: true,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _confirmPassController,
                hintText: "••••••••",
                labelText: "Confirm Password",
                obscureText: true,
              ),
              const SizedBox(height: 16),
              PrimaryContainer(
                radius: 10,
                child: DropdownButtonFormField<String>(
                  dropdownColor: Colors.grey[900],
                  iconEnabledColor: Colors.white,
                  value: selectedCollege,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    hintText: 'Select College',
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                  items: colleges.map((c) => DropdownMenuItem(value: c, child: Text(c))).toList(),
                  onChanged: (v) => setState(() => selectedCollege = v),
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _submitForm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.tealAccent,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  ),
                  child: Text(
                    'Register',
                    style: GoogleFonts.sora(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// You can reuse these from your existing codebase
class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final bool obscureText;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.labelText,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.white),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.white70),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey, width: 1),
          borderRadius: BorderRadius.circular(25.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey, width: 1),
          borderRadius: BorderRadius.circular(25.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 1),
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
    );
  }
}

class PrimaryContainer extends StatelessWidget {
  final Widget child;
  final double? radius;
  final Color? color;

  const PrimaryContainer({
    super.key,
    this.radius,
    this.color,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius ?? 30),
        boxShadow: const [
          BoxShadow(color: Color(0XFF1E1E1E)),
          BoxShadow(
            offset: Offset(2, 2),
            blurRadius: 4,
            spreadRadius: 0,
            color: Colors.black,
          ),
        ],
      ),
      child: child,
    );
  }
}
