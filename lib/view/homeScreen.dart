import 'package:flutter/material.dart';

import 'menuScreen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              floating: true,
              pinned: true,
              expandedHeight: 200,
              flexibleSpace: AppBar(
                flexibleSpace: Image.network('https://i.pinimg.com/originals/d3/f5/2e/d3f52e3aed62d789d4d38b0e10ae6fe7.jpg',fit: BoxFit.cover,),
              ),
          ),
          ];
        },
        body: MenuScreen(),
      ),
    );
  }
}