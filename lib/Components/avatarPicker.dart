import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

class AvtarPickerWidget extends StatefulWidget {
  const AvtarPickerWidget({super.key});

  @override
  _AvtarPickerWidgetState createState() => _AvtarPickerWidgetState();
}

class _AvtarPickerWidgetState extends State<AvtarPickerWidget> {
  String _selectedImagePath = '';

  void _showImagePickerOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(CupertinoIcons.photo),
                title: const Text('Pick from gallery'),
                onTap: () {
                  _pickImage(ImageSource.gallery);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(CupertinoIcons.camera),
                title: const Text('Take a photo'),
                onTap: () {
                  _pickImage(ImageSource.camera);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      log('Picked file path: ${pickedFile.path}'); // Log the file path
      log('Picked file name: ${pickedFile.name}'); // Log the file name, if needed

      setState(() {
        _selectedImagePath = pickedFile.path;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No image selected'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () => _showImagePickerOptions(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 60,
                    backgroundImage: _selectedImagePath.isEmpty
                        ? const NetworkImage(
                        'https://www.shutterstock.com/image-vector/vector-flat-illustration-grayscale-avatar-600nw-2264922221.jpg') // Fallback image URL
                        : kIsWeb
                        ? NetworkImage(_selectedImagePath)
                    as ImageProvider<Object>?
                        : FileImage(File(_selectedImagePath)),
                  ),
                ),
                CircleAvatar(
                  radius: MediaQuery.sizeOf(context).width * .01,
                  backgroundColor: Colors.amber,
                  child: const Icon(Icons.add, color: Colors.black),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
