import 'dart:io';
import 'package:closed_network/Components/SnackBar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class CreateCommunityPage extends StatefulWidget {
  const CreateCommunityPage({super.key});

  @override
  State<CreateCommunityPage> createState() => _CreateCommunityPageState();
}

class _CreateCommunityPageState extends State<CreateCommunityPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descController = TextEditingController();

  final Set<int> _selectedIndices = {};
  File? _coverImage;

  final List<String> _tags = [
    'Flutter', 'React', 'AI', 'ML', 'Web3',
    'Blockchain', 'Cybersecurity', 'Cloud', 'AR/VR',
    'Mobile Dev', 'Frontend', 'Backend', 'UI/UX',
    'DevOps', 'Game Dev', 'DSA', 'Open Source',
    'Startups', 'Leadership', 'IoT', 'Tech Talk'
  ];

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _coverImage = File(pickedFile.path);
      });
    }
  }

  void _submitCommunity() {
    final name = _nameController.text.trim();
    final desc = _descController.text.trim();
    final selectedTags = _selectedIndices.map((i) => _tags[i]).toList();

    if (name.isEmpty || desc.isEmpty || selectedTags.length > 3 || _coverImage == null) {
      AwesomeSnackbar.error(context, "Dude Fill the entire Form", "Fill all fields, pick image & max 3 tags");
      return;
    }

    print("Community Created:\n$name\n$desc\nTags: $selectedTags\nImage: ${_coverImage?.path}");

    _nameController.clear();
    _descController.clear();
    setState(() {
      _selectedIndices.clear();
      _coverImage = null;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Community submitted")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Create Community", style: GoogleFonts.sora(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTextField("Community Name", _nameController),
            const SizedBox(height: 16),
            _buildTextField("Description", _descController, maxLines: 4),
            const SizedBox(height: 16),

            Text("Cover Image", style: GoogleFonts.sora(color: Colors.white, fontSize: 14)),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: _pickImage,
              child: Container(
                height: 160,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFF1E1E1E),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey[800]!),
                ),
                child: _coverImage == null
                    ? const Center(
                  child: Icon(Icons.image, color: Colors.grey, size: 40),
                )
                    : ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.file(_coverImage!, fit: BoxFit.cover),
                ),
              ),
            ),

            const SizedBox(height: 20),
            Text(
              "Select Tags (max 3)",
              style: GoogleFonts.sora(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: List.generate(_tags.length, (index) {
                final selected = _selectedIndices.contains(index);
                return ChoiceChip(
                  label: Text(_tags[index]),
                  selected: selected,
                  onSelected: (bool isSelected) {
                    setState(() {
                      if (isSelected) {
                        if (_selectedIndices.length < 3) {
                          _selectedIndices.add(index);
                        }
                      } else {
                        _selectedIndices.remove(index);
                      }
                    });
                  },
                  selectedColor: Colors.tealAccent,
                  backgroundColor: Colors.grey[800],
                  labelStyle: GoogleFonts.sora(
                    color: selected ? Colors.black : Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                );
              }),
            ),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton.icon(
                onPressed: _submitCommunity,
                icon: const Icon(Icons.send),
                label: const Text("Submit"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.tealAccent,
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  textStyle: GoogleFonts.sora(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, {int maxLines = 1}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.sora(color: Colors.grey[400], fontSize: 14),
        ),
        const SizedBox(height: 6),
        TextField(
          controller: controller,
          maxLines: maxLines,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xFF1E1E1E),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            hintText: "Enter $label",
            hintStyle: TextStyle(color: Colors.grey[600]),
          ),
        ),
      ],
    );
  }
}
