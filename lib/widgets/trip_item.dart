// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:syria_atlas/screens/trip_detail_screen.dart';
import '../models/trip.dart';

class TripItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final List<String> properities;
  final String description;
  final TripType tripType;
  final Governorate governorate;

  TripItem({
    required this.id,
    required this.title,
    required this.description,
    required this.governorate,
    required this.imageUrl,
    required this.properities,
    required this.tripType,
  });

  void selectTrip(BuildContext context) {
    Navigator.of(
      context,
    ).pushNamed(TripDetailScreen.screenRoute, arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectTrip(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),

        elevation: 7,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  child: Image.asset(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  height: 250,
                  //color gradation  on the image to keep text clear:
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withValues(alpha: 0),
                        Colors.black.withValues(alpha: 0.8),
                      ],
                      stops: [
                        0.6,
                        1,
                      ], //to keep the colors of image clear put light black in the start
                    ),
                  ),
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.headlineLarge,
                    overflow: TextOverflow.fade,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(
                        size: 25,
                        Icons.local_activity,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      SizedBox(width: 6),
                      Text(tripType.name),
                    ],
                  ),
                  SizedBox(height: 20), // İki satır arası boşluk
                  Row(
                    children: [
                      Icon(
                        size: 25,
                        Icons.location_city,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      SizedBox(width: 6),
                      Text(governorate.name),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
