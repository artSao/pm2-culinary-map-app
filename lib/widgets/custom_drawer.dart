import 'package:culinary_map_app/screens/edit_profile_screen.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  final Function(int) onItemTap;

  const CustomDrawer({Key? key, required this.onItemTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.red),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Icons.account_circle, size: 80, color: Colors.white),
                SizedBox(height: 8),
                Text(
                  "Ilham Prastyo",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                Text(
                  "Admin",
                  style: TextStyle(fontSize: 14, color: Colors.white70),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.dashboard, color: Colors.red),
            title: Text('Dashboard'),
            onTap: () => onItemTap(0),
          ),
          ListTile(
            leading: Icon(Icons.edit, color: Colors.red),
            title: Text('Edit Profile'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EditProfileScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.logout, color: Colors.red),
            title: Text('Logout'),
            onTap: () => onItemTap(1),
          ),
          
        ],
      ),
    );
  }
}
