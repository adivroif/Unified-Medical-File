import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(AppointmentDetailsPage());
}

class AppointmentDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('טיפול דיקור סיני'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {},
          ),
        ),
        body: Container( // הוספת Container עם גרדיאנט
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.lightBlue.shade100, Colors.lightBlue.shade300],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('טיפול דיקור סיני', style: TextStyle(fontWeight: FontWeight.bold)),
                                Text('טיפול מתמשך'),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Text('18.02.2025'),
                                SizedBox(width: 10),
                                Text('יום ג'),
                                SizedBox(width: 10),
                                Text('13:00'),
                              ],
                            ),
                            SizedBox(height: 20),
                            _buildInfoRow(Icons.person, 'רופא מטפל:', 'ד"ר רפאל מרציאנו'),
                            SizedBox(height: 20),
                            _buildInfoRow(Icons.notes, 'הערות:', 'נא לא להשתמש במוצרי קוסמטיקה יום לפני הטיפול באזור הטיפול'),
                            SizedBox(height: 20),
                            _buildInfoRow(Icons.location_on, 'מיקום:', 'מרפאת לב חולון\nנעמי שמר 12, חולון'),
                            SizedBox(height: 20),
                            Container(
                              height: 150,
                              child: GoogleMap(
                                initialCameraPosition: CameraPosition(
                                  target: LatLng(32.0163, 34.7738),
                                  zoom: 15,
                                ),
                                markers: {
                                  Marker(
                                    markerId: MarkerId('clinic'),
                                    position: LatLng(32.0163, 34.7738),
                                    infoWindow: InfoWindow(title: 'מרפאת לב חולון'),
                                  ),
                                },
                              ),
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ElevatedButton(
                                  onPressed: () {},
                                  child: Text('סגור', style: TextStyle(color: Colors.white)),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {},
                                  child: Text('עדכון תור', style: TextStyle(color: Colors.white)),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String title, String subtitle) {
    return Row(
      children: [
        Icon(icon),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title),
            Text(subtitle),
          ],
        ),
      ],
    );
  }
}