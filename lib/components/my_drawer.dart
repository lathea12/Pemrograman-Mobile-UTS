import 'package:flutter/material.dart';
import 'package:projekutslagi/components/my_drawer_tile.dart';

import '../pages/settings_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.cyan[400],
      child: Column(
        children: [
          //logo aplikasi
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Icon(
              Icons.lock_open_rounded,
              size: 80,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),

          const Padding(
            padding: EdgeInsets.all(25.0),
            child: Divider(
              color: Colors.white,
            ),
          ),

          //home judul
          MyDrawerTile(
            text: "H O M E",
            icon: Icons.home,
            onTap: () => Navigator.pop(context),
          ),

          //setting
          MyDrawerTile(
              text: "S E T T I N G S",
              icon: Icons.settings,
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SettingsPage(),
                  ),
                );
              }),

          const Spacer(),

          //logout
          MyDrawerTile(
            text: "L O G O U T",
            icon: Icons.logout,
            onTap: () {},
          ),

          const SizedBox(height: 25),
        ],
      ),
    );
  }
}
