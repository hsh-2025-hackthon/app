class NewTrip {
  final String title;
  final String? description;
  final DateTime startDate;
  final DateTime endDate;

  NewTrip({
    required this.title,
    this.description,
    required this.startDate,
    required this.endDate,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
    };
  }
}
