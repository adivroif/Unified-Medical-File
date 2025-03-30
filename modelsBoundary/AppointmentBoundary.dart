class AppointmentBoundary {
  String appointmentId;
  int startSlot;
  int treatmentId;
  String patientId;
  String doctorId;
  String recordId;
  int statusOfAppointment;

  AppointmentBoundary({
    required this.appointmentId,
    required this.startSlot,
    required this.treatmentId,
    required this.patientId,
    required this.doctorId,
    required this.recordId,
    required this.statusOfAppointment,
  });

  factory AppointmentBoundary.fromJson(Map<String, dynamic> json) {
    return AppointmentBoundary(
      appointmentId: json['appointmentId'],
      startSlot: json['startSlot'],
      treatmentId: json['treatmentId'],
      patientId: json['patientId'],
      doctorId: json['doctorId'],
      recordId: json['recordId'],
      statusOfAppointment: json['statusOfAppointment'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'appointmentId':appointmentId,
      'startSlot': startSlot,
      'treatmentId': treatmentId,
      'patientId': patientId,
      'doctorId': doctorId,
      'recordId':recordId,
      'statusOfAppointment': statusOfAppointment,
    };

  }
}