import 'package:flutter/material.dart';
import 'package:travel_app/app_data.dart';
import 'package:travel_app/models/trip.dart';
import 'package:travel_app/widgets/trip_item.dart';

class CategoryTripsScreen extends StatefulWidget {
  static const screenRoute = '/Category-trips';
  final List<Trip> availableTrips;

  CategoryTripsScreen(this.availableTrips);

  @override
  State<CategoryTripsScreen> createState() => _CategoryTripsScreenState();
}

class _CategoryTripsScreenState extends State<CategoryTripsScreen> {
  late String categorytitle;
  late List<Trip> displayList;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final arg =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final String categoryid = arg['id'] as String;
    categorytitle = arg['title'] as String;
    displayList = widget.availableTrips.where((Trip) {
      return Trip.categories.contains(categoryid);
    }).toList();
    super.didChangeDependencies();
  }

  removeTrip(tripId) {
    setState(() {
      displayList.removeWhere((trip) => trip.id == tripId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categorytitle),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return TripItem(
            // removeTrip: removeTrip,
            id: displayList[index].id,
            title: displayList[index].title,
            imageUrl: displayList[index].imageUrl,
            duration: displayList[index].duration,
            tripType: displayList[index].tripType,
            season: displayList[index].season,
          );
        },
        itemCount: displayList.length,
      ),
    );
  }
}
