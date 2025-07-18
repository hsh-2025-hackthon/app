import 'package:flutter/material.dart';
import 'package:ourgo_app/models/trip.dart';
import 'package:ourgo_app/services/api_service.dart';

class TripList extends StatefulWidget {
  const TripList({super.key});

  @override
  State<TripList> createState() => _TripListState();
}

class _TripListState extends State<TripList> {
  late Future<List<Trip>> _futureTrips;
  final ApiService _apiService = ApiService();

  @override
  void initState() {
    super.initState();
    _futureTrips = _apiService.getTrips();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Trip>>(
      future: _futureTrips,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No trips found.'));
        } else {
          final trips = snapshot.data!;
          return ListView.builder(
            itemCount: trips.length,
            itemBuilder: (context, index) {
              final trip = trips[index];
              return ListTile(
                title: Text(trip.title),
                subtitle: Text(trip.description ?? 'No description'),
                trailing: const Icon(Icons.arrow_forward_ios),
              );
            },
          );
        }
      },
    );
  }
}
