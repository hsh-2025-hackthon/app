import 'package:flutter_test/flutter_test.dart';
import 'package:ourgo_app/models/new_trip.dart';
import 'package:ourgo_app/services/api_service.dart';

void main() {
  group('ApiService', () {
    late ApiService apiService;

    setUp(() {
      apiService = ApiService();
    });

    test('getTrips returns a list of trips on successful call', () async {
      final trips = await apiService.getTrips();

      expect(trips, isA<List>());
      expect(trips.length, 2);
      expect(trips[0].title, 'Grand Canyon Expedition');
    });

    test('createTrip returns a trip object on successful call', () async {
      final newTrip = NewTrip(
        title: 'Test Trip',
        description: 'A trip for testing.',
        startDate: DateTime.now(),
        endDate: DateTime.now().add(const Duration(days: 1)),
      );

      final createdTrip = await apiService.createTrip(newTrip);

      expect(createdTrip, isNotNull);
      expect(createdTrip.title, 'Test Trip');
    });
  });
}
