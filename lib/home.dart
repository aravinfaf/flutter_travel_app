import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_travel_app/widgets/travel_blog.dart';
import 'package:flutter_travel_app/widgets/travel_popular.dart';

class HomEpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Icon(
              Icons.menu,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              'Travel blog',
              style: TextStyle(fontSize: 36),
            ),
          ),
          Expanded(flex: 2, child: TravelBlog()),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Most popular',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  'View all',
                  style: TextStyle(fontSize: 16, color: Colors.deepOrange),
                ),
              ],
            ),
          ),
          Expanded(flex: 1, child: TravelPopular()),
        ],
      ),
    );
  }
}
