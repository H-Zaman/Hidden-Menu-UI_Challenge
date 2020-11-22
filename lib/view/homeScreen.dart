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
              backgroundColor: Colors.black54,
              expandedHeight: MediaQuery.of(context).size.height * .4,
              actions: [
                innerBoxIsScrolled ? CircleAvatar(
                  backgroundImage: AssetImage('assets/couple-travel.jpg'),
                ) : SizedBox()
              ],
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  children: [
                    Positioned.fill(child: Image.asset('assets/couple-travel.jpg',fit: BoxFit.cover,)),
                    Positioned(
                      bottom: 5,
                      right: 10,
                      child: Container(
                        width: MediaQuery.of(context).size.width * .4,
                        child: Text(''
                            'As Tour Operator we provide services like Hotel Booking, Tour Guide, Car Rental, Adventure Tours, Sundarban Tour and Experiential Tour all around the World.',
                          textAlign: TextAlign.justify,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 10,
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                          ),),
                      ),
                    ),
                  ],
                ),
                title: SizedBox(
                  width: MediaQuery.of(context).size.width * .4,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10,bottom: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Mad Travels',
                          style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                titlePadding: EdgeInsets.zero,
              ),
            ),
          ];
        },
        body: MenuScreen(),
      ),
    );
  }
}
