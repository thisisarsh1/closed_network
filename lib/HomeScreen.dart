import 'package:closed_network/AboutScreen.dart';
import 'package:closed_network/Authentication/Email.dart';
import 'package:closed_network/LoadingScreen.dart';
import 'package:closed_network/MessagingScreen.dart';
import 'package:closed_network/NotificationScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Components/SnackBar.dart';
import 'Data/UserData.dart';

import 'CommunityScreen.dart';
import 'Components/avatar.dart';
import 'Homeposts.dart';
import 'NewsScreen.dart';
import 'ProfileScreen.dart';
import 'SearchScreen.dart';
import 'SettingScreen.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    Center(
      child: HomePosts(),
    ),
    Center(
      child: MasonryGridViewWidget(),
    ),
    Center(
        child: CollegeUpdatesScreen()
    ),
    Center(
        child: CommunityPage()
    ),
    Center(
      child: Profile()
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
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Header
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Avatar(
                    imageUrl:
                    '${user.profileImageUrl}',
                    size: 18,
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${user.name}",
                        style: GoogleFonts.chakraPetch(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "${user.handle}",
                        style: GoogleFonts.sora(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(color: Colors.grey.shade800),
            // Menu Items
            _drawerTile(Icons.person_outline, "Profile",),
            _drawerTile(Icons.people_outline, "Communities"),
            _drawerTile(Icons.calendar_today_outlined, "Events"),
            _drawerTile(Icons.emoji_events_outlined, "FAQ",onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return AboutScreen();
              },));
            }),
            _drawerTile(Icons.settings_outlined, "Settings", onTap:(){
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SettingsScreen();
              },));
            } ),

            Spacer(),
            Divider(color: Colors.grey.shade800),
            // Logout
            ListTile(
              leading: Icon(Icons.logout, color: Colors.redAccent),
              title: Text(
                "Logout",
                style: GoogleFonts.sora(
                  color: Colors.redAccent,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTap: () async {

                if(authService.value.isLoggedIn){
                  authService.value.signOut();
                  AwesomeSnackbar.error(
                      context, 'LoggedOut Bruv!', 'hope to see you again !');
                  await Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return LoadingScreen();
                  },));
                }

              },
            ),
          ],
        ),
      ),
    );
  }


  ListTile _drawerTile(
      IconData icon,
      String title, {
        VoidCallback? onTap,
      }) {
    return ListTile(
      leading: Icon(icon, color: Colors.tealAccent),
      title: Text(
        title,
        style: GoogleFonts.chakraPetch(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: onTap,               // <- pass it through
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
        leadingWidth: 50, // tighter control over avatar space
        leading: Builder(
          builder: (context) => Padding(
            padding: const EdgeInsets.only(left: 12.0),

              child: IconButton(
                icon: const Icon(Icons.menu, color: Colors.white, size: 24), onPressed: () { Scaffold.of(context).openDrawer();
              print(authService.value.currentUser);},

              )

          ),
        ),
        title: Text(
          'Closed_Network',
          style: GoogleFonts.chakraPetch(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 19,
            letterSpacing: 0.5,
          ),
        ),
        centerTitle: false, // false keeps natural balance with leading & actions
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: IconButton(
              icon: const Icon(Icons.notifications_none, color: Colors.white, size: 24),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => NotificationPage()),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: IconButton(
              icon: const Icon(Icons.chat_bubble_outline, color: Colors.white, size: 24),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => MessagePage()),
                );
              },
            ),
          ),
        ],
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
              icon: Icon(Icons.search_rounded),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.newspaper_rounded),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.group_rounded),
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
