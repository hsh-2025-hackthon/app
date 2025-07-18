import 'dart:convert';
import 'dart:math';
import 'package:ourgo_app/models/new_trip.dart';
import 'package:ourgo_app/models/trip.dart';

class ApiService {
  // Base URL of the API. This would be a real URL in a production app.
  // For now, we don't need it as we are mocking the response.
  final String _baseUrl = "http://localhost:3000/api";

  Future<List<Trip>> getTrips() async {
    // Simulate a network delay
    await Future.delayed(const Duration(seconds: 1));

    // Mocked JSON response based on the OpenAPI spec
    const mockJsonResponse = '''
    [
      {
        "id": "a1b2c3d4-e5f6-7890-1234-567890abcdef",
        "title": "Grand Canyon Expedition",
        "description": "A week-long hiking and camping trip.",
        "startDate": "2025-09-10T09:00:00Z",
        "endDate": "2025-09-17T18:00:00Z",
        "destinations": [],
        "collaborators": []
      },
      {
        "id": "b2c3d4e5-f6a7-8901-2345-67890abcdef0",
        "title": "Tokyo Cultural Tour",
        "description": "Exploring the heart of Japan.",
        "startDate": "2026-04-20T14:00:00Z",
        "endDate": "2026-05-01T11:00:00Z",
        "destinations": [],
        "collaborators": []
      }
    ]
    ''';

    // In a real app, you would use the http package like this:
    // final response = await http.get(Uri.parse('$_baseUrl/trips'));
    // if (response.statusCode == 200) {
    //   final List<dynamic> data = json.decode(response.body);
    //   return data.map((json) => Trip.fromJson(json)).toList();
    // } else {
    //   throw Exception('Failed to load trips');
    // }

    final List<dynamic> data = json.decode(mockJsonResponse);
    return data.map((json) => Trip.fromJson(json)).toList();
  }

  Future<Trip> createTrip(NewTrip newTrip) async {
    // Simulate a network delay
    await Future.delayed(const Duration(seconds: 1));

    // In a real app, you would do:
    // final response = await http.post(
    //   Uri.parse('$_baseUrl/trips'),
    //   headers: {'Content-Type': 'application/json'},
    //   body: json.encode(newTrip.toJson()),
    // );
    // if (response.statusCode == 201) {
    //   return Trip.fromJson(json.decode(response.body));
    // } else {
    //   throw Exception('Failed to create trip');
    // }

    // Mock response
    final newId = Random().nextInt(10000).toString();
    final createdTrip = Trip(
      id: newId,
      title: newTrip.title,
      description: newTrip.description,
      startDate: newTrip.startDate,
      endDate: newTrip.endDate,
    );
    return createdTrip;
  }
}
