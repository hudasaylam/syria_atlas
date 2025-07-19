import 'package:flutter/material.dart';
import '../models/trip.dart';
import '../widgets/trip_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Trip> favoriteTrips;

  const FavoritesScreen({super.key, required this.favoriteTrips});

  @override
  Widget build(BuildContext context) {
    if (favoriteTrips.isEmpty) {
      return Center(child: Text('Favorite trips will show here! 🧳'));
    } else {
      return ListView.builder(
        itemBuilder: (context, index) {
          return TripItem(
            id: favoriteTrips[index].id,
            title: favoriteTrips[index].title,
            imageUrl: favoriteTrips[index].imageUrl,
            properities: favoriteTrips[index].properities,
            tripType: favoriteTrips[index].tripType,
            governorate: favoriteTrips[index].governorate,
            description: favoriteTrips[index].description,
          );
        },
        itemCount: favoriteTrips.length,
      );
    }
  }
}
