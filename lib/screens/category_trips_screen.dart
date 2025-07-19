// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:syria_atlas/models/trip.dart';
import '../widgets/trip_item.dart';

class CategoryTripsScreen extends StatelessWidget {
  static const theRout = '/category-trips';
  final List<Trip> availableTrips;

  CategoryTripsScreen(this.availableTrips);
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryId = args['id'];
    final categoryTitle = args['title'];

    final filteredTrips =
        availableTrips.where((trip) {
          return trip.categories.contains(categoryId);
        }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryTitle ?? "No Title",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.primary,
                Theme.of(context).colorScheme.secondary,
              ],
              stops: [0.1, 1.0],
              begin: Alignment.topLeft,
              end: Alignment.topRight,
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return TripItem(
            id: filteredTrips[index].id,
            title: filteredTrips[index].title,
            imageUrl: filteredTrips[index].imageUrl,
            properities: filteredTrips[index].properities,
            tripType: filteredTrips[index].tripType,
            governorate: filteredTrips[index].governorate,
            description: filteredTrips[index].description,
          );
        },
        itemCount: filteredTrips.length,
      ),
    );
  }
}
