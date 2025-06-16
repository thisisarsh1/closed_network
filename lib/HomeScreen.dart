import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'CommunitiesScreen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    Center(
      child: Text(
        'Posts',
        style: GoogleFonts.sora(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    Center(
      child: MasonryGridViewWidget(),
    ),
    Center(
      child: Text(
        'Messages',
        style: GoogleFonts.sora(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    Center(
      child: Text(
        'Events',
        style: GoogleFonts.sora(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    Center(
      child: Text(
        'Profile',
        style: GoogleFonts.sora(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.jumpToPage(index);
    });
  }

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Drawer _buildDrawer() {
    return Drawer(
      backgroundColor: Colors.black,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Name',
                  style: GoogleFonts.chakraPetch(
                    color: Colors.tealAccent,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'College: Your College Name',
                  style: GoogleFonts.sora(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          _drawerTile(Icons.person, "Profile"),
          _drawerTile(Icons.people, "Communities"),
          _drawerTile(Icons.event, "Events"),
          _drawerTile(Icons.emoji_events, "Achievements"),
          _drawerTile(Icons.settings, "Settings"),
          _drawerTile(Icons.logout, "Logout"),
        ],
      ),
    );
  }

  ListTile _drawerTile(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.tealAccent),
      title: Text(
        title,
        style: GoogleFonts.chakraPetch(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
      onTap: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _buildDrawer(),
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text(
          'Closed_Network',
          style: GoogleFonts.chakraPetch(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 26,
            letterSpacing: 1.2,
          ),
        ),
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu, color: Colors.tealAccent),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: _pages,
        physics: BouncingScrollPhysics(),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF23272A),
          border: Border(
            top: BorderSide(
              color: const Color(0xFF696969),
              width: 1,
            ),
          ),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.black,
          elevation: 0,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.tealAccent,
          unselectedItemColor: Colors.grey[400],
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.mail),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.event),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
