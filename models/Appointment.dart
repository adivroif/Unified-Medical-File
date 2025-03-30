import '../modelsBoundary/AppointmentBoundary.dart';
class Appointment {
  String appointmentId;
  final String treatmentName;
  final String appointmentDescription;
  final DateTime appointmentDate;
  final String patientName;
  int startSlot;
  int treatmentId;
  String patientId;
  String doctorId;
  String recordId;
  int statusOfAppointment;
  //late Location location;

  Appointment({
    required this.appointmentId,
    required this.treatmentName,
    required this.appointmentDescription,
    required this.appointmentDate,
    required this.patientName,
    required this.startSlot,
    required this.treatmentId,
    required this.patientId,
    required this.doctorId,
    required this.recordId,
    required this.statusOfAppointment,
  });

  factory Appointment.fromBoundary(AppointmentBoundary boundary) {
    return Appointment(
      appointmentId: boundary.appointmentId,
      treatmentName: "null",
      appointmentDescription: "null",
      appointmentDate: DateTime.now(),
      patientName: "null",
      startSlot: boundary.startSlot,
      treatmentId:boundary.treatmentId,
      patientId: boundary.patientId,
      doctorId: boundary.doctorId,
      recordId: boundary.recordId,
      statusOfAppointment: boundary.statusOfAppointment,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'appointmentId': appointmentId,
      'treatmentName': treatmentName,
      'appointmentDescription': appointmentDescription,
      'appointmentDate': appointmentDate,
      'patientName': patientName,
      'startSlot': startSlot,
      'treatmentId': treatmentId,
      'patientId': patientId,
      'doctorId': doctorId,
      'recordId': recordId,
      'statusOfAppointment': statusOfAppointment,
    };
  }

}
