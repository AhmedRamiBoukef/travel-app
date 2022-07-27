import 'package:flutter/material.dart';
import 'package:travel_app/screens/category_screen.dart';
import 'package:travel_app/screens/favourite_screen.dart';
import 'package:travel_app/widgets/drawer_app.dart';

class TabsScreen extends StatefulWidget {
  final favouriteTrips;

  TabsScreen(this.favouriteTrips);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  void selectedTab(int index) {
    setState(() {
      _tabindex = index;
    });
  }

  late List<Map<String, Object>> _tabScreens;
  @override
  void initState() {
    _tabScreens = [
      {
        'Screen': CategoryScreen(),
        'Title': 'لائحة التصنيفات',
      },
      {
        'Screen': FavouritesScreen(widget.favouriteTrips),
        'Title': 'المفضلة',
      }
    ];
    super.initState();
  }

  int _tabindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _tabScreens[_tabindex]['Title'] as String,
        ),
        centerTitle: true,
      ),
      drawer: const DrawerScreen(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        // ignore: deprecated_member_use
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.white,
        currentIndex: _tabindex,
        onTap: selectedTab,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.dashboard,
            ),
            label: 'التصنيفات',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.star,
            ),
            label: 'المفضلة',
          ),
        ],
      ),
      body: _tabScreens[_tabindex]['Screen'] as Widget,
    );
  }
}
