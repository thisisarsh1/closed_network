import 'dart:io';
import 'package:closed_network/Components/SlideToAct.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'Components/CircularWordCounter.dart'; // Make sure this import path matches your project

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}
class _CreatePostScreenState extends State<CreatePostScreen> {
  final TextEditingController _descController = TextEditingController();
  final int _maxChars = 100;
  File? _pickedImage;

  bool isSlideEnabled = false;

  @override
  void initState() {
    super.initState();
    _descController.addListener(() {
      final hasText = _descController.text.trim().isNotEmpty;
      if (hasText != isSlideEnabled) {
        setState(() {
          isSlideEnabled = hasText;
        });
      }
    });
  }

  @override
  void dispose() {
    _descController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    if (_pickedImage != null) return;
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _pickedImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.tealAccent),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "New Post",
          style: GoogleFonts.sora(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      body: SafeArea(
        child: 
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 42,
                      height: 42,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.tealAccent,
                      ),
                      child: const Icon(Icons.person, color: Colors.black),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "@you",
                      style: GoogleFonts.sora(
                        fontSize: 15,
                        color: Colors.white.withOpacity(0.8),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
          
                Stack(
                  children: [
                    TextField(
                      controller: _descController,
                      maxLines: 8,
                      maxLength: _maxChars + 100,
                      style: const TextStyle(color: Colors.white),
                      cursorColor: Colors.tealAccent,
                      decoration: InputDecoration(
                        hintText: "What's on your mind?",
                        hintStyle: GoogleFonts.sora(
                          color: Colors.white24,
                          fontSize: 16,
                        ),
                        counterText: "",
                        filled: true,
                        fillColor: Colors.grey[900],
                        contentPadding: const EdgeInsets.all(18),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: BorderSide(color: Colors.grey[800]!),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: const BorderSide(color: Colors.tealAccent, width: 1.5),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 8,
                      right: 8,
                      child: CircularWordCounter(
                        controller: _descController,
                        maxLength: _maxChars,
                      ),
                    ),
                  ],
                ),
          
                const SizedBox(height: 24),
          
                GestureDetector(
                  onTap: _pickImage,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: Colors.grey[800]!),
                    ),
                    child: _pickedImage == null
                        ? SizedBox(
                      height: 200,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.image_outlined,
                              color: Colors.tealAccent, size: 36),
                          const SizedBox(height: 6),
                          Text(
                            "Add Image",
                            style: GoogleFonts.sora(
                              color: Colors.white54,
                              fontSize: 13.5,
                            ),
                          ),
                        ],
                      ),
                    )
                        : ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.file(
                        _pickedImage!,
                        fit: BoxFit.fitWidth,
                        width: double.infinity,
                      ),
                    ),
                  ),
                ),
          
          
                const SizedBox(height: 60),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SlideToActWidget(
                    onSubmit: () async {
                      // Post submission logic here
                      print("Submitted: ${_descController.text}");
                    },
                    text: 'Post',
                    enabled: isSlideEnabled,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
