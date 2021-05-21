import 'package:flutter/material.dart';

import 'SignInPage.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("Hussam"),
            accountEmail: Text("hussam@gmail.com"),
            currentAccountPicture: CircleAvatar(
              child: Icon(Icons.person),
            ),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                      'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGhvdG98ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80',
                    ),
                    fit: BoxFit.cover)),
          ),

          ///This profile
          ListTile(
            title: Text("Profile"),
            leading: Icon(Icons.person),
            onTap: () {},
          ),
          ListTile(
            title: Text("Info"),
            leading: Icon(Icons.info),
          ),
          ///For searching for activite

          ListTile(
            title: Text("Log out "),
            leading: Icon(Icons.logout),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => SignInPage()));
            },
          ),
        ],
      ),
    );
  }
}
