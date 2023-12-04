import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/Screens/_homescreen.dart';
import 'package:untitled1/Screens/_signup.dart';
import 'package:untitled1/Screens/_ticket.dart';
import 'package:untitled1/Screens/_welcome.dart';
import 'package:untitled1/utils/app_styles.dart';
import '_login.dart';
import '_searchscreen.dart';

class BotttomBar extends StatefulWidget {
  const BotttomBar({Key? key}) : super(key: key);

  @override
  State<BotttomBar> createState() => _BotttomBarState();
}

class _BotttomBarState extends State<BotttomBar> {
  int _increment=0;
  static final List<Widget>_widgetOptions=<Widget>[
    HomeScreen(),
    SearchScreen(),
    Ticket(),
    LogIn(),
  ];

  void Increment(int index){
    setState(() {
      _increment=index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: _widgetOptions[_increment],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _increment,
        onTap: Increment,
        elevation: 10,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Styles.primaryColor,
        unselectedItemColor: const Color(0xFF526480),
          type: BottomNavigationBarType.fixed,
          items: const[
            BottomNavigationBarItem(icon: Icon(FluentSystemIcons.ic_fluent_home_regular),
              label: "Home", activeIcon: Icon(FluentSystemIcons.ic_fluent_home_filled)),
            BottomNavigationBarItem(icon: Icon(FluentSystemIcons.ic_fluent_search_regular),
                label: "Search", activeIcon: Icon(FluentSystemIcons.ic_fluent_search_filled)),
            BottomNavigationBarItem(icon: Icon(FluentSystemIcons.ic_fluent_ticket_regular),
                label: "Ticket", activeIcon: Icon(FluentSystemIcons.ic_fluent_ticket_filled)),
            BottomNavigationBarItem(icon: Icon(FluentSystemIcons.ic_fluent_person_regular),
                label: "Profile", activeIcon: Icon(FluentSystemIcons.ic_fluent_person_filled))
          ],
      ),
    );
  }
}
