import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_travel_app/model/travel.dart';

import '../detail.dart';

class TravelBlog extends StatelessWidget {
  final list = Travel.getTravelBlog();
  PageController pageController = PageController(viewportFraction: 0.9);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: pageController,
        itemCount: list.length,
        itemBuilder: (context, index) {
          var travel = list[index];
          return GestureDetector(
            onTap: () => {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => DetailPage(
                        travel: travel,
                      )))
            },
            child: Stack(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(right: 20, bottom: 30, top: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.asset(
                      travel.url,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                    bottom: 80,
                    left: 20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Material(
                          color: Colors.transparent,
                          child: Text(
                            travel.name,
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                        Material(
                          color: Colors.transparent,
                          child: Text(
                            travel.location,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    )),
                Positioned(
                    bottom: 0,
                    right: 30,
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.deepOrange,
                          borderRadius: BorderRadius.circular(30)),
                      child: Icon(
                        Icons.arrow_right_alt_outlined,
                        color: Colors.white,
                        size: 30,
                      ),
                    ))
              ],
            ),
          );
        });
  }
}
