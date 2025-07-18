class Trip {
  final String id;
  final String title;
  final String? description;
  final DateTime startDate;
  final DateTime endDate;
  // For simplicity, destinations and collaborators are not fully modeled yet.
  // They can be added later.

  Trip({
    required this.id,
    required this.title,
    this.description,
    required this.startDate,
    required this.endDate,
  });

  factory Trip.fromJson(Map<String, dynamic> json) {
    return Trip(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      startDate: DateTime.parse(json['startDate']),
      endDate: DateTime.parse(json['endDate']),
    );
  }
}
