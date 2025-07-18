import 'package:flutter/material.dart';
import 'package:ourgo_app/models/new_trip.dart';
import 'package:ourgo_app/services/api_service.dart';

class AddTripScreen extends StatefulWidget {
  final VoidCallback onTripAdded;

  const AddTripScreen({super.key, required this.onTripAdded});

  @override
  State<AddTripScreen> createState() => _AddTripScreenState();
}

class _AddTripScreenState extends State<AddTripScreen> {
  final _formKey = GlobalKey<FormState>();
  final ApiService _apiService = ApiService();
  bool _isLoading = false;

  String _title = '';
  String _description = '';
  DateTime _startDate = DateTime.now();
  DateTime _endDate = DateTime.now().add(const Duration(days: 7));

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        _isLoading = true;
      });

      try {
        final newTrip = NewTrip(
          title: _title,
          description: _description,
          startDate: _startDate,
          endDate: _endDate,
        );
        await _apiService.createTrip(newTrip);

        // Pop the screen and trigger the callback
        Navigator.of(context).pop();
        widget.onTripAdded();

      } catch (e) {
        // Handle error, e.g., show a snackbar
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to create trip: $e')),
        );
      } finally {
        if (mounted) {
          setState(() {
            _isLoading = false;
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Trip'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(labelText: 'Title'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _title = value!;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Description'),
                onSaved: (value) {
                  _description = value ?? '';
                },
              ),
              const SizedBox(height: 20),
              // Note: A real app would have proper date pickers for startDate and endDate.
              // For this example, we'll use the default dates.
              if (_isLoading)
                const CircularProgressIndicator()
              else
                ElevatedButton(
                  onPressed: _submitForm,
                  child: const Text('Add Trip'),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
