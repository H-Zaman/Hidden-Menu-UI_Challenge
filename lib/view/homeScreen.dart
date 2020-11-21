import 'package:flutter/material.dart';

import 'menuScreen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Historical Place\'s'),
        centerTitle: true,
      ),
      body: MenuScreen(),
    );
  }
}
