import 'package:flutter/material.dart';

import '../pages/setting_page.dart';
import 'drawer_tile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          // HEADER
          const DrawerHeader(
            child: Icon(Icons.edit),
          ),
          const SizedBox(
            height: 25.0,
          ),

          // NOTE TILE
          DrawerTile(
            title: "Notes",
            leading: Icon(Icons.home),
            onTap: () => Navigator.pop(context),
          ),
          DrawerTile(
              title: "Settings",
              leading: Icon(Icons.settings),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingPage(),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
