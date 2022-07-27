import 'package:flutter/material.dart';
import 'package:travel_app/app_data.dart';
import 'package:travel_app/models/trip.dart';
import 'package:travel_app/screens/category_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:travel_app/screens/category_trips_screen.dart';
import 'package:travel_app/screens/filter_screen.dart';
import 'package:travel_app/screens/tab_screen.dart';
import 'package:travel_app/screens/trip_detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'summer': false,
    'winter': false,
    'family': false,
  };
  List<Trip> availableTrips = Trips_data;
  List<Trip> favouriteTrips = [];
  void _managefavourites(String tripId) {
    var index = favouriteTrips.indexWhere((trip) => tripId == trip.id);
    if (index >= 0) {
      setState(() {
        favouriteTrips.removeAt(index);
      });
    } else {
      setState(() {
        favouriteTrips.add(Trips_data.firstWhere((trip) => trip.id == tripId));
      });
    }
  }

  bool _isFavourite(String id) {
    return favouriteTrips.any((trip) => trip.id == id);
  }

  void _changeFilters(Map<String, bool> newfilters) {
    setState(() {
      _filters = newfilters;
      availableTrips = Trips_data.where((trip) {
        if (_filters['summer'] == true && trip.isInSummer != true) {
          return false;
        }
        if (_filters['winter'] == true && trip.isInWinter != true) {
          return false;
        }
        if (_filters['family'] == true && trip.isForFamilies != true) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ar', 'AE'), // English, no country code
      ],
      title: 'Travel App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
            .copyWith(secondary: Colors.amber),
        fontFamily: 'ElMessiri',
        textTheme: ThemeData.light().textTheme.copyWith(
              headline5: const TextStyle(
                color: Colors.blue,
                fontSize: 24,
                fontFamily: 'ElMessiri',
                fontWeight: FontWeight.bold,
              ),
              headline6: const TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontFamily: 'ElMessiri',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      routes: {
        '/': (ctx) => TabsScreen(favouriteTrips),
        CategoryTripsScreen.screenRoute: (ctx) =>
            CategoryTripsScreen(availableTrips),
        TripDestailScreen.screenRoute: (ctx) =>
            TripDestailScreen(_managefavourites, _isFavourite),
        FilterScreen.screenRoute: (ctx) =>
            FilterScreen(_filters, _changeFilters),
      },
    );
  }
}
