import 'package:closed_network/LoginScreen.dart';
import 'package:closed_network/RegisterEmailScreen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _dobController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Text(
                'Create your account',
                 style: GoogleFonts.chakraPetch(
                 textStyle: TextStyle(
                   fontSize: 35,
                   fontWeight: FontWeight.bold,
                   color: Colors.white
                 )
               ),
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _nameController,
                hintText: "Name",
                labelText: "Full Name",
              ),
              const SizedBox(height: 20),
              DateField(dobController: _dobController),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return LoginScreen();
                      },));
                    },
                    child:  Text(
                      'Already have an account?',
                      style: GoogleFonts.sora(
                        textStyle: TextStyle(
                          fontSize: 16,
                          color: Colors.white
                        )
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_nameController.text.trim().isEmpty ||
                          _dobController.text.trim().isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content:
                            Text("Please enter both Name and Date of Birth."),
                            backgroundColor: Colors.redAccent,
                          ),
                        );
                      } else {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) => RegisterEmailScreen(),
                        ));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.tealAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      'Next',
                      style: GoogleFonts.sora(
                          textStyle: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black
                          )
                      ),
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

// The rest of your code remains unchanged
class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String labelText;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.white),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.white70),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.grey,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(25.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(25.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(25.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.grey,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
    );
  }
}

class DateField extends StatefulWidget {
  final TextEditingController dobController;

  const DateField({super.key, required this.dobController});

  @override
  _DateFieldState createState() => _DateFieldState();
}

class _DateFieldState extends State<DateField> {
  @override
  void dispose() {
    widget.dobController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime now = DateTime.now();
    final DateTime lastDate = DateTime(now.year - 18, now.month, now.day);
    final DateTime firstDate = DateTime(now.year - 50, now.month, now.day);

    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: lastDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    if (pickedDate != null) {
      setState(() {
        widget.dobController.text =
            DateFormat('dd/MM/yyyy').format(pickedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return PrimaryContainer(
      radius: 10,
      child: TextFormField(
        readOnly: true,
        style: const TextStyle(fontSize: 16, color: Colors.white),
        controller: widget.dobController,
        textAlignVertical: TextAlignVertical.center,
        onTap: () => _selectDate(context),
        decoration: const InputDecoration(
          labelText: "Date of Birth",
          labelStyle: TextStyle(color: Colors.white),
          contentPadding: EdgeInsets.only(left: 20, right: 20, bottom: 3),
          border: InputBorder.none,
          filled: false,
          focusedBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          hintText: 'DD/MM/YYYY',
          suffixIcon: Icon(Icons.calendar_today, color: Colors.white),
          hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
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
          BoxShadow(
            color: Color(0XFF1E1E1E),
          ),
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
