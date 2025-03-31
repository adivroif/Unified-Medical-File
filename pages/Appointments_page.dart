import 'package:flutter/material.dart';
import '../services/ApiService.dart';
import '../models/Appointment.dart';
import '../models/Treatment.dart';

void main() {
  runApp(AppointmentsPage());
}

class AppointmentsPage extends StatefulWidget {
  @override
  _AppointmentsPageState createState() => _AppointmentsPageState();
}

class _AppointmentsPageState extends State<AppointmentsPage> {
  late Future<List<Appointment>> futureAppointments;
  late Future<List<Treatment>> futureTreatments;

  @override
  void initState() {
    super.initState();
    futureAppointments = ApiService().fetchAppointments();
    futureTreatments = ApiService().fetchTreatments();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('טיפולים שלי'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.lightBlue.shade100, Colors.lightBlue.shade300],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildTreatmentTypeButton('כל הטיפולים'),
                      _buildTreatmentTypeButton('טיפולים עתידיים'),
                      _buildTreatmentTypeButton('טיפולים מתמשכים'),
                      _buildTreatmentTypeButton('היסטוריית הטיפולים'),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Expanded(
                  child: FutureBuilder<List<Appointment>>(
                    future: futureAppointments,
                    builder: (context, appointmentSnapshot) {
                      if (appointmentSnapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else if (appointmentSnapshot.hasError) {
                        return Center(child: Text("שגיאה בטעינת הנתונים"));
                      } else {
                        List<Appointment> appointments = appointmentSnapshot.data ?? [];

                        return FutureBuilder<List<Treatment>>(
                          future: futureTreatments,
                          builder: (context, treatmentSnapshot) {
                            if (treatmentSnapshot.connectionState == ConnectionState.waiting) {
                              return Center(child: CircularProgressIndicator());
                            } else if (treatmentSnapshot.hasError) {
                              return Center(child: Text("שגיאה בטעינת הנתונים של הטיפולים"));
                            } else {
                              List<Treatment> treatmentList = treatmentSnapshot.data ?? [];

                              return ListView.builder(
                                itemCount: appointments.length,
                                itemBuilder: (context, index) {
                                  var appointment = appointments[index];
                                  int id = appointment.treatmentId;
                                  String treatmentName = 'ללא כותרת';

                                  if (id >= 0 && id < treatmentList.length) {
                                    treatmentName = treatmentList[id].treatmentName ?? 'ללא כותרת';
                                  }

                                  return _buildTreatmentTile(
                                    treatmentName,
                                    appointment.doctorId ?? 'סוג לא ידוע',
                                    appointment.patientId ?? "כלום",
                                    'עדכון תור',
                                    'פרטים',
                                    " ",
                                  );
                                },
                              );
                            }
                          },
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTreatmentTypeButton(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: OutlinedButton(
        onPressed: () {},
        child: Text(text),
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: Colors.blue),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
      ),
    );
  }

  Widget _buildTreatmentTile(String title1, String title2, String date, String button1Text, String button2Text, String time) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        title: Text(title1, style: TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title2),
            Text('Date: $date'),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: Text(button1Text, style: TextStyle(fontSize: 12, color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                textStyle: TextStyle(fontSize: 12),
              ),
            ),
            SizedBox(width: 5),
            ElevatedButton(
              onPressed: () {},
              child: Text(button2Text, style: TextStyle(fontSize: 12, color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                textStyle: TextStyle(fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
