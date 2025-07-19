import 'package:flutter/material.dart';
import 'package:syria_atlas/screens/category_trips_screen.dart';
import '../screens/trip_detail_screen.dart';
import './screens/tabs_screen.dart';
import './models/trip.dart';
import './app_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filter = {'summer': false, 'winter': false};

  List<Trip> _availableTrips = Trip_data;
  List<Trip> _favoriteTrips = [];

  void _changeFilters(Map<String, bool> filterData) {
    setState(() {
      _filter = filterData;

      _availableTrips =
          Trip_data.where((trip) {
            if (_filter['summer'] == true && trip.isInSummer != true) {
              return false;
            }
            if (_filter['winter'] == true && trip.isInWinter != true) {
              return false;
            }
            return true;
          }).toList();
    });
  }

  void _manageFavoritTrips(String tripId) {
    final existingIndex = _favoriteTrips.indexWhere(
      (trip) => trip.id == tripId,
    );
    if (existingIndex >= 0) {
      setState(() {
        _favoriteTrips.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteTrips.add(Trip_data.firstWhere((trip) => trip.id == tripId));
      });
    }
  }

  bool _isFavorite(String id) {
    return _favoriteTrips.any((trip) => trip.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Syria Atlas',

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color.fromARGB(255, 0, 96, 3),
          primary: Color.fromARGB(255, 4, 59, 6),
        ).copyWith(secondary: const Color.fromARGB(255, 2, 85, 30)),

        textTheme: ThemeData.light().textTheme.copyWith(
          headlineMedium: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontFamily: 'Times New Roman',
            fontWeight: FontWeight.bold,
          ),
          headlineLarge: TextStyle(
            color: Colors.white,
            fontSize: 26,
            fontFamily: 'Times New Roman',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      initialRoute: '/',

      home: TabsScreen(
        filter: _filter,
        changeFilters: _changeFilters,
        favoriteTrips: _favoriteTrips,
      ),
      routes: {
        CategoryTripsScreen.theRout:
            (ctx) => CategoryTripsScreen(_availableTrips),
        TripDetailScreen.screenRoute:
            (ctx) => TripDetailScreen(_manageFavoritTrips, _isFavorite),
      },
    );
  }
}
