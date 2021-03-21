import 'package:flutter/material.dart';
import 'package:gngappv1/screens/favorit_screens.dart';
import 'package:gngappv1/screens/home_Screens.dart';
import 'package:gngappv1/screens/login_screens.dart';
import 'package:gngappv1/screens/order_history_screens.dart';

import 'package:localstorage/localstorage.dart';

class AppDrower extends StatefulWidget {
  @override
  _AppDrowerState createState() => _AppDrowerState();
}

class _AppDrowerState extends State<AppDrower> {
  LocalStorage storage = new LocalStorage('usertoken');

  void _logoutnew() async {
    await storage.clear();
    Navigator.of(context).pushReplacementNamed(LoginScrrens.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text("GNGBD.com", style: TextStyle(color: Colors.black)),
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            iconTheme: IconThemeData(color: Colors.black),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pushReplacementNamed(HomeScreens.routeName);
            },
            trailing: Icon(
              Icons.home,
              color: Colors.red,
            ),
            title: Text("Home"),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pushReplacementNamed(HomeScreens.routeName);
            },
            trailing: Icon(
              Icons.category,
              color: Colors.red,
            ),
            title: Text("Categories"),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pushReplacementNamed(HomeScreens.routeName);
            },
            trailing: Icon(
              Icons.branding_watermark_outlined,
              color: Colors.red,
            ),
            title: Text("Brands"),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(FalvoritScreens.routeName);
            },
            trailing: Icon(
              Icons.favorite,
              color: Colors.red,
            ),
            title: Text("Favorites"),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(OrderScreens.routeName);
            },
            trailing: Icon(
              Icons.history,
              color: Colors.red,
            ),
            title: Text("All orders"),
          ),
          Spacer(),
          ListTile(
            onTap: () {
              Navigator.of(context).pushReplacementNamed(HomeScreens.routeName);
            },
            trailing: Icon(
              Icons.add_business_sharp,
              color: Colors.red,
            ),
            title: Text("About us"),
          ),
          ListTile(
            onTap: () {
              _logoutnew();
            },
            trailing: Icon(
              Icons.logout,
              color: Colors.red,
            ),
            title: Text("Logout"),
          ),
        ],
      ),
    );
  }
}
