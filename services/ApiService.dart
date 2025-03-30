import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:untitled2/models/Appointment.dart';
import '../modelsBoundary/AppointmentBoundary.dart';
import '../models/Treatment.dart';
import '../modelsBoundary/TreatmentBoundary.dart';

class ApiService {
  static const String baseUrl = "https://localhost:7250"; // התאמה לאמולטור

  Future<List<Appointment>> fetchAppointments() async {
    try {
      final response = await http.get(Uri.parse("$baseUrl/api/Appointments"));

      if (response.statusCode == 200) {
        List<AppointmentBoundary> objects = (jsonDecode(
            utf8.decode(response.bodyBytes)) as List)
            .map((i) => AppointmentBoundary.fromJson(i))
            .toList();

        return objects.map((object) {
          Appointment event = Appointment.fromBoundary(object);
          return event;
        }).toList();
      } else {
        throw Exception("Failed to load appointments");
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

  Future<List<Treatment>> fetchTreatments() async {
    try {
      final response = await http.get(Uri.parse("$baseUrl/api/Treatment"));

      if (response.statusCode == 200) {
        List<Treatmentboundary> objects = (jsonDecode(
            utf8.decode(response.bodyBytes)) as List)
            .map((i) => Treatmentboundary.fromJson(i))
            .toList();

        return objects.map((object) {
          Treatment event = Treatment.fromBoundary(object);
          return event;
        }).toList();
      } else {
        throw Exception("Failed to load appointments");
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }
}