import 'package:flutter/material.dart';

class NavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 16),
        ],
      ),
      child: Column(
        children: [
          // NavDrawerHeader(),
          // NavDrawerItem('Mua', Icons.list, MuaRoutes),
          // NavDrawerItem('Episodes', Icons.videocam, EpisodeRoutes),
          // NavDrawerItem('About', Icons.help, AboutRoutes),
        ],
      ),
    );
  }
}
