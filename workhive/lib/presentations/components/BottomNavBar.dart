import 'package:flutter/material.dart';

import '../constants/strings.dart';

class BottomNavBar extends StatefulWidget {
  int pageIndex;
  BottomNavBar({required this.pageIndex, Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  late int _selectedIndex;
  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.pageIndex;
  }

  _onItemTapped(int index) async {
    setState(() {
      _selectedIndex = index;
      switch (index) {
        case 0:
          _selectedIndex = index;
          Navigator.pushNamed(context, HomePage);
          break;
        case 1:
          Navigator.pushNamed(context, Annonces);
          break;
        case 3:
          Navigator.pushNamed(context, userProfile);
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BottomNavigationBar(
          enableFeedback: true,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                _selectedIndex == 0 ? Icons.home : Icons.home_outlined,
              ),
              label: 'Accueil',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                _selectedIndex == 1
                    ? Icons.access_time_filled
                    : Icons.access_time,
              ),
              label: 'Annonces',
            ),


          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          showUnselectedLabels: true,
          showSelectedLabels: true,
          type: BottomNavigationBarType.fixed,
          onTap: _onItemTapped),
    );
  }
}
