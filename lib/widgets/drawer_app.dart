import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:travel_app/screens/filter_screen.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            padding: EdgeInsets.only(top: 40),
            alignment: Alignment.center,
            color: Colors.amber,
            child: Text(
              'دليلك السياحي',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          newMethod(
            'الرحلات',
            Icons.card_travel,
            () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          newMethod(
            'التصفية',
            Icons.filter_list,
            () {
              Navigator.of(context)
                  .pushReplacementNamed(FilterScreen.screenRoute);
            },
          ),
        ],
      ),
    );
  }

  ListTile newMethod(String title, IconData icon, VoidCallback onTap) {
    return ListTile(
      leading: Icon(
        icon,
        size: 30,
        color: Colors.blue,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: 'ElMessiri',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onTap,
    );
  }
}
