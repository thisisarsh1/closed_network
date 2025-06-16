import 'package:closed_network/Components/avatar.dart';
import 'package:closed_network/CreateCommunity.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Components/SnackBar.dart';

class CommunityPage extends StatefulWidget {
  const CommunityPage({super.key});

  @override
  State<CommunityPage> createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  final List<Map<String, dynamic>> communities = [
    {
      'name': 'Flutter Devs India',
      'description': 'A place for passionate Flutter developers in India to collaborate, share and grow together.',
      'members': 1250,
      'tags': ['Flutter', 'Mobile Dev', 'India'],
      'image': 'https://i.imgur.com/w1rMqAz.png',
      'applied': false,
    },
    {
      'name': 'Web3 Wizards',
      'description': 'Home for decentralized dreamers — learn, build and launch Web3 apps.',
      'members': 820,
      'tags': ['Web3', 'Blockchain', 'Crypto'],
      'image': 'https://i.imgur.com/g1LXG9X.png',
      'applied': false,
    },
    {
      'name': 'AI Creators',
      'description': 'Discuss and innovate around Artificial Intelligence, ML, and Gen AI.',
      'members': 990,
      'tags': ['AI', 'ML', 'Gen AI'],
      'image': 'https://i.imgur.com/yF3td0L.png',
      'applied': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.tealAccent,
        foregroundColor: Colors.black,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return CreateCommunityPage();
          },));
        },
        icon: const Icon(Icons.add),
        label: const Text("Create Community"),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(5),
        itemCount: communities.length,
        itemBuilder: (context, index) {
          final community = communities[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 20),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF191919),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.black),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header Row
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Avatar(
                      imageUrl: 'https://imgs.search.brave.com/_RFe93b14qzEH6CAMiAwHvv5o7l3MKqcrTVeklQMzYA/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly9jZG4u/d29ybGR2ZWN0b3Js/b2dvLmNvbS9sb2dv/cy9mbHV0dGVyLWxv/Z28uc3Zn',
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            community['name'],
                            style: GoogleFonts.sora(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            '${community['members']} members',
                            style: GoogleFonts.sora(
                              fontSize: 13,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          communities[index]['applied'] = !(communities[index]['applied'] ?? false);
                        });
                        if (communities[index]['applied']==true){
                          AwesomeSnackbar.info(context, "You Have Applied to ${communities[index]['name']} !", "The Admin of the Community will review your application!");
                        }
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: (community['applied'] ?? false)
                            ? Colors.teal
                            : Colors.tealAccent,
                        foregroundColor:(community['applied'] ?? false)
                            ? Colors.white
                            : Colors.black,
                        padding: const EdgeInsets.symmetric(
                            vertical: 6, horizontal: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text((community['applied'] ?? false) ? "Applied" : "Apply",style: TextStyle(fontWeight: FontWeight.bold),),
                    ),

                  ],
                ),

                const SizedBox(height: 12),

                // Description
                Text(
                  community['description'],
                  style: GoogleFonts.sora(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 10),

                // Tags
                Wrap(
                  spacing: 8,
                  children: List<Widget>.from(
                    community['tags'].map(
                          (tag) => Chip(
                        label: Text(tag),
                        backgroundColor: Colors.grey[850],
                        labelStyle: GoogleFonts.sora(color: Colors.white),
                        side: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
