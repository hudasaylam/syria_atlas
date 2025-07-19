import 'package:flutter/material.dart';
import '../screens/categories_screen.dart';
import '../screens/favorites_screen.dart';
import '../screens/filter_screen.dart';
import '../models/trip.dart';

class TabsScreen extends StatefulWidget {
  final Map<String, bool> filter;
  final Function(Map<String, bool>) changeFilters;
  final List<Trip> favoriteTrips;

  const TabsScreen({
    Key? key,
    required this.filter,
    required this.changeFilters,
    required this.favoriteTrips,
  }) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            indicatorColor: Colors.white,
            tabs: [
              Tab(
                icon: Icon(Icons.dashboard, color: Colors.white),
                text: 'Categories',
              ),
              Tab(
                icon: Icon(Icons.star, color: Colors.white),
                text: 'Favorites',
              ),
              Tab(
                icon: Icon(Icons.search, color: Colors.white),
                text: 'Filter trips',
              ),
            ],
          ),
          title: Text(
            'Syria Atlas',
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
        body: TabBarView(
          children: [
            CategoriesScreen(),
            FavoritesScreen(favoriteTrips: widget.favoriteTrips),
            FilterScreen(
              currentFilters: widget.filter,
              saveFilters: widget.changeFilters,
            ),
          ],
        ),
      ),
    );
  }
}
