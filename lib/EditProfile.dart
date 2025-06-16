import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProfilePage extends StatefulWidget {
  final Map<String, dynamic> initialData;

  const EditProfilePage({super.key, required this.initialData});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late TextEditingController nameController;
  late TextEditingController handleController;
  late TextEditingController bioController;
  late TextEditingController locationController;
  late TextEditingController websiteController;
  late TextEditingController profileImageController;
  late TextEditingController coverImageController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.initialData['name']);
    handleController = TextEditingController(text: widget.initialData['handle']);
    bioController = TextEditingController(text: widget.initialData['bio']);
    locationController = TextEditingController(text: widget.initialData['location']);
    websiteController = TextEditingController(text: widget.initialData['website']);
    profileImageController = TextEditingController(text: widget.initialData['profileImageUrl']);
    coverImageController = TextEditingController(text: widget.initialData['coverImageUrl']);
  }

  @override
  void dispose() {
    nameController.dispose();
    handleController.dispose();
    bioController.dispose();
    locationController.dispose();
    websiteController.dispose();
    profileImageController.dispose();
    coverImageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Edit Profile", style: GoogleFonts.chakraPetch(color: Colors.white)),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            buildInputField("Name", nameController),
            buildInputField("Handle", handleController),
            buildInputField("Bio", bioController, maxLines: 3),
            buildInputField("Location", locationController),
            buildInputField("Website", websiteController),
            buildInputField("Profile Image URL", profileImageController),
            buildInputField("Cover Image URL", coverImageController),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          final updatedProfile = {
            'name': nameController.text,
            'handle': handleController.text,
            'bio': bioController.text,
            'location': locationController.text,
            'website': websiteController.text,
            'profileImageUrl': profileImageController.text,
            'coverImageUrl': coverImageController.text,
          };
          Navigator.pop(context, updatedProfile);
        },
        backgroundColor: Colors.tealAccent,
        foregroundColor: Colors.black,
        label: const Text("Save"),
        icon: const Icon(Icons.save),
      ),
    );
  }

  Widget buildInputField(String label, TextEditingController controller, {int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        controller: controller,
        maxLines: maxLines,
        style: GoogleFonts.sora(color: Colors.white),
        cursorColor: Colors.tealAccent,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: GoogleFonts.sora(color: Colors.grey),
          filled: true,
          fillColor: const Color(0xFF1A1A1A),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.tealAccent),
          ),
        ),
      ),
    );
  }
}
