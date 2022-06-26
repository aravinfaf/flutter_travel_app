import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_travel_app/model/travel.dart';

class DetailPage extends StatelessWidget {
  final Travel travel;
  final double expandedHeight = 300;
  final double roundedContainerHeight = 50;

  DetailPage({required this.travel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        CustomScrollView(
          slivers: [
            _buildSilverHeaderWidget(),
            SliverToBoxAdapter(child: _buildDetail()),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top, right: 15, left: 15),
          child: SizedBox(
            height: kToolbarHeight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(
                    Icons.arrow_back_outlined,
                    color: Colors.white,
                  ),
                ),
                Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        )
      ],
    ));
  }

  Widget _buildSilverHeaderWidget() {
    return SliverPersistentHeader(
        delegate: DetailSilverDelegate(
            travel: travel,
            expandedHeight: expandedHeight,
            roundedContainerHeight: roundedContainerHeight));
  }

  Widget _buildDetail() {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          buildUserInfo(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15.0),
            child: Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.',
              style: TextStyle(color: Colors.grey, fontSize: 16, height: 1.5),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Featured',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'view all',
                  style: TextStyle(
                    color: Colors.deepOrange,
                    fontSize: 16,
                    letterSpacing: 1.5,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 160, child: FeatureWidget()),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15.0),
            child: Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.',
              style: TextStyle(color: Colors.grey, fontSize: 16, height: 1.5),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildUserInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 5),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(
              travel.url,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  travel.name,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  travel.location,
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ],
            ),
          ),
          Spacer(),
          Icon(
            Icons.share,
            color: Colors.grey,
          )
        ],
      ),
    );
  }
}

class DetailSilverDelegate extends SliverPersistentHeaderDelegate {
  final Travel travel;
  final double expandedHeight;
  final double roundedContainerHeight;
  DetailSilverDelegate(
      {required this.travel,
      required this.expandedHeight,
      required this.roundedContainerHeight});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      children: [
        Opacity(
          opacity: 0.8,
          child: Image.asset(
            travel.url,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
            top: expandedHeight - roundedContainerHeight - shrinkOffset,
            left: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: roundedContainerHeight,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30))),
            )),
        Positioned(
            top: expandedHeight - shrinkOffset - 120,
            left: 30,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  travel.name,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 30),
                ),
                Text(
                  travel.location,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20),
                ),
              ],
            ))
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => 0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

class FeatureWidget extends StatelessWidget {
  var travel = Travel.getPopularBlog();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: EdgeInsets.all(10),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            width: 120,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white),
            child: Image.asset(
              travel[index].url,
              fit: BoxFit.cover,
            ),
          );
        },
        separatorBuilder: (_, index) => SizedBox(
              width: 10,
            ),
        itemCount: travel.length);
  }
}
