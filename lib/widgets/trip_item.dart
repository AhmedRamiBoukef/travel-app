import 'package:flutter/material.dart';
import 'package:travel_app/models/trip.dart';
import 'package:travel_app/screens/trip_detail_screen.dart';

class TripItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final TripType tripType;
  final Season season;
  //final Function removeTrip;

  TripItem({
    // required this.removeTrip,
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.tripType,
    required this.season,
  });

  String get seasonText {
    switch (season) {
      case Season.Winter:
        return 'شتاء';
        break;
      case Season.Summer:
        return 'صيف';
        break;
      case Season.Autumn:
        return 'خريف';
        break;
      case Season.Spring:
        return 'ربيع';
        break;
      default:
        return 'غير معروف';
        break;
    }
  }

  String get tripTypeText {
    switch (tripType) {
      case TripType.Activities:
        return 'أنشطة';
        break;
      case TripType.Exploration:
        return 'استكشاف';
        break;
      case TripType.Therapy:
        return 'علاج';
        break;
      case TripType.Recovery:
        return 'استرجاع';
        break;
      default:
        return 'غير معروف';
    }
  }

  void selectTrip(BuildContext ctx) {
    Navigator.of(ctx)
        .pushNamed(
      TripDestailScreen.screenRoute,
      arguments: id,
    )
        .then((tripId) {
      //removeTrip(tripId)
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectTrip(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 7,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: 250,
                  alignment: Alignment.bottomRight,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0),
                        Colors.black.withOpacity(0.8),
                      ],
                      stops: const [0.6, 1],
                    ),
                  ),
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.headline6,
                    overflow: TextOverflow.fade,
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.today,
                        // ignore: deprecated_member_use
                        color: Theme.of(context).accentColor,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        '$duration أيام',
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.wb_sunny,
                        // ignore: deprecated_member_use
                        color: Theme.of(context).accentColor,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        seasonText,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.family_restroom,
                        // ignore: deprecated_member_use
                        color: Theme.of(context).accentColor,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        tripTypeText,
                      ),
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
