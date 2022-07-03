import 'package:flutter/material.dart';
import 'package:flutter_progress/views/settings.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'home_screen.dart';

class HiddenDrawer extends StatefulWidget {
  const HiddenDrawer({Key? key}) : super(key: key);

  @override
  State<HiddenDrawer> createState() => _HiddenDrawerState();
}

class _HiddenDrawerState extends State<HiddenDrawer> {
  List<ScreenHiddenDrawer> _pages = [];
  final myTextStyle = const TextStyle(fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.black12,
            );
  @override
  void initState() {
    super.initState();
    _pages = [
      ScreenHiddenDrawer(
        ItemHiddenMenu(
            name: 'Homepage',
            baseStyle: myTextStyle,
            selectedStyle: myTextStyle,
            colorLineSelected: Colors.deepOrangeAccent,
            ),
        const HomeScreen(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
            name: 'Settings',
            baseStyle: myTextStyle,
            selectedStyle: myTextStyle,
            colorLineSelected: Colors.deepOrangeAccent,
            ),
        const SettingsPage(),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      backgroundColorMenu: Colors.orange.shade200,
      screens: _pages,
      initPositionSelected: 0,
      slidePercent: 40,
      //contentCornerRadius: 100,
    );
  }
}
