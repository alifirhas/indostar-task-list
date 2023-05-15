import 'package:flutter/material.dart';
import 'home/home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // This selected index is to control the bottom nav bar
  // int _selectedIndex = 0;

  // This method will update our selected index
  // when the user taps on the bottom nav bar
  // void navigateBottomBar(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  // pages to display
  // final List<Widget> _pages = [
  //   // home page
  //   const HomePage(),

  //   // shop page
  //   const ShopPage(),

  //   // profile page
  //   const ProfilePage(),
  // ];

  @override
  Widget build(BuildContext context) {
    /*

    UI - I like a more minimal style so that's what I did here, 
    but you can change up the colors and decorate it to your preference

    */
    return Scaffold(
      backgroundColor: Colors.grey[300],
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: Colors.transparent,
      //   leading: Builder(
      //     builder: (context) => IconButton(
      //       icon: Icon(
      //         Icons.menu,
      //         color: Colors.grey.shade800,
      //       ),
      //       onPressed: () => Scaffold.of(context).openDrawer(),
      //     ),
      //   ),
      //   title: Text(
      //     'A P P',
      //     style: TextStyle(color: Colors.grey.shade800),
      //   ),
      // ),
      // drawer: const MyDrawer(),
      body: const HomePage(),
      // bottomNavigationBar: MyBottomNavBar(
      //   onTabChange: (index) => navigateBottomBar(index),
      // ),
    );
  }
}
