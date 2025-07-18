import 'package:flutter/material.dart';
import 'package:our_go/screens/add_trip_screen.dart';
import 'package:our_go/widgets/trip_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // A key to allow us to refresh the TripList
  Key _tripListKey = UniqueKey();

  void _refreshTrips() {
    setState(() {
      // By changing the key, we force the TripList widget to rebuild and refetch data.
      _tripListKey = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OurGO'),
      ),
      body: TripList(key: _tripListKey),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddTripScreen(onTripAdded: _refreshTrips),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
