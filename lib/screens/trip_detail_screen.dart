import 'package:flutter/material.dart';
import 'package:syria_atlas/app_data.dart';

class TripDetailScreen extends StatelessWidget {
  static const screenRoute = '/trip-detail';

  final Function manageFavorites;
  final Function isFavorite;
  TripDetailScreen(this.manageFavorites, this.isFavorite);

  Widget buildSectionTitle(BuildContext context, String titleText) {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      child: Text(
        titleText,
        style: TextStyle(
          color: Theme.of(context).colorScheme.primary, // bam! kendi yeşilin
          fontWeight: FontWeight.w500,
          fontSize: 30,
          letterSpacing: 1.2,
        ),
      ),
    );
  }

  Widget buildListviewContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      height: 200,
      margin: EdgeInsetsDirectional.symmetric(horizontal: 12),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final tripId = ModalRoute.of(context)?.settings.arguments as String;
    final selectTrip = Trip_data.firstWhere((trip) => trip.id == tripId);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${selectTrip.title}',
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
              stops: [0.1, 0.5],
              begin: Alignment.topLeft,
              end: Alignment.topRight,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.asset(selectTrip.imageUrl, fit: BoxFit.cover),
            ),

            buildSectionTitle(context, 'Properities'),
            buildListviewContainer(
              ListView.builder(
                itemCount: selectTrip.properities.length,
                itemBuilder:
                    (context, index) => Card(
                      elevation: 0.3,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 10,
                        ),
                        child: Text(selectTrip.properities[index]),
                      ),
                    ),
              ),
            ),
            SizedBox(height: 20),
            buildSectionTitle(context, 'Descrption'),

            buildListviewContainer(
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    selectTrip.description,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
            SizedBox(height: 100),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(isFavorite(tripId) ? Icons.star : Icons.star_border),
        onPressed: () => manageFavorites(tripId),
      ),
    );
  }
}
