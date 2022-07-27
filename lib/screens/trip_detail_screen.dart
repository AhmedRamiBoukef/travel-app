import 'package:flutter/material.dart';
import 'package:travel_app/app_data.dart';
import 'package:travel_app/models/trip.dart';

class TripDestailScreen extends StatelessWidget {
  final Function managefavourites;
  final Function isFavourite;
  static const screenRoute = '/trip_detail';

  TripDestailScreen(this.managefavourites, this.isFavourite);
  Widget tripTitle(BuildContext context, String title) {
    return Container(
      alignment: Alignment.topRight,
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline5,
      ),
    );
  }

  Widget tripListView(Widget child) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final String tripId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedTrip = Trips_data.firstWhere((trip) => trip.id == tripId);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedTrip.title),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedTrip.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            tripTitle(context, 'الأنشطة'),
            tripListView(
              ListView.builder(
                itemCount: selectedTrip.activities.length,
                itemBuilder: (ctx, index) {
                  return Card(
                    elevation: 0.3,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      child: Text(selectedTrip.activities[index]),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            tripTitle(context, 'البرنامج اليومي'),
            tripListView(
              ListView.builder(
                itemCount: selectedTrip.program.length,
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text(
                          'يوم ${index + 1}',
                        ),
                      ),
                      title: Text(selectedTrip.program[index]),
                    ),
                    Divider(),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => managefavourites(tripId),
        child: Icon(
          isFavourite(tripId) ? Icons.star : Icons.star_border,
          color: Colors.black,
        ),
      ),
    );
  }
}
