import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_travel_app/detail.dart';
import 'package:flutter_travel_app/model/travel.dart';

class TravelPopular extends StatelessWidget {
  final list = Travel.getPopularBlog();
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: EdgeInsets.only(left: 15, right: 15, bottom: 15),
        scrollDirection: Axis.horizontal,
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
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.asset(
                    travel.url,
                    width: 140,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                    bottom: 20,
                    left: 15,
                    child: Material(
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            travel.name,
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            travel.location,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ))
              ],
            ),
          );
        },
        separatorBuilder: (_, index) => SizedBox(
              width: 15,
            ),
        itemCount: list.length);
  }
}
