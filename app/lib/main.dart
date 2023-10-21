/*
  * Library imports
 */
import 'package:flutter/material.dart';
// ? https://pub.dev/packages/google_nav_bar
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:app/utils/global.vars.dart';

/*
  * Page/Component imports 
 */
import 'package:app/pages/home.dart';
import 'package:app/pages/raise.ph.levels.dart';
import 'package:app/pages/lower.ph.levels.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    RaisePhLevels(),
    LowerPhLevels(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Sets the application to dark mode
        colorScheme:
            const ColorScheme.dark(primary: GlobalVariables.primaryColor),
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: GlobalVariables.navColor,
          title: const Text(
            "Soil pH System",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: Colors.black.withOpacity(.1),
              )
            ],
          ),
          child: SafeArea(
            child: Container(
              color: GlobalVariables.navColor,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
                child: GNav(
                  rippleColor: Colors.grey[300]!,
                  hoverColor: Colors.grey[100]!,
                  gap: 8,
                  activeColor: Colors.black,
                  iconSize: 24,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  duration: const Duration(milliseconds: 400),
                  tabBackgroundColor: Colors.grey[100]!,
                  color: Colors.white,
                  tabs: const [
                    GButton(
                      icon: Icons.home_rounded,
                      text: 'Home',
                    ),
                    GButton(
                      icon: Icons.library_books_outlined,
                      text: 'Raise pH levels',
                    ),
                    GButton(
                      icon: Icons.library_books_outlined,
                      text: 'Lower pH levels',
                    ),
                  ],
                  selectedIndex: _selectedIndex,
                  onTabChange: (index) {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
