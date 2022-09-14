
import 'package:flutter/material.dart';
import 'package:pizza_app/main_screen/main_screen_widget.dart';

class RouterScreenWidget extends StatefulWidget {
  const RouterScreenWidget({Key? key}) : super(key: key);

  @override
  _RouterScreenWidgetState createState() => _RouterScreenWidgetState();
}

class _RouterScreenWidgetState extends State<RouterScreenWidget> {
  int _selectedTab = 0;

  void onSelectTab(int index){
    if (_selectedTab == index) return;
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: IndexedStack(
        index: _selectedTab,
        children: [
          MainScreenWidget(),
         Container(
           alignment: Alignment.center,
           child:  Text(
             'Профиль',
           ),
         ),
      Container(
        alignment: Alignment.center,
        child:  Text(
          'Профиль',
        ),
      ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Меню',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Профиль',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket),
            label: 'Корзина',
          ),

        ],
        onTap: onSelectTab,
      ),
    );
  }
}
