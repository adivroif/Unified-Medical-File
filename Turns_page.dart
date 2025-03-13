import 'package:flutter/material.dart';

void main() {
  runApp(TurnsPage());
}

class TurnsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('טיפולים שלי'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {},
          ),
        ),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            children: [
              // שיפור: שימוש ב-SingleChildScrollView עבור כותרות הטיפולים
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
              SizedBox(height: 10), // הוספת מרווח
              Expanded(
                child: ListView.builder(
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return _buildTreatmentTile(
                      'טיפול ראשון',
                      'ביופידבק',
                      '18.12.2024',
                      'עדכון תור',
                      'פרטים',
                      '14:00',
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // שיפור: פונקציה ליצירת כפתור סוג טיפול
  Widget _buildTreatmentTypeButton(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: OutlinedButton(
        onPressed: () {},
        child: Text(text),
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: Colors.blue), // שינוי צבע גבול
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)), // שינוי פינות מעוגלות
        ),
      ),
    );
  }

  Widget _buildTreatmentTile(String title1, String title2, String date, String button1Text, String button2Text, String time) {
    return Card( // שיפור: שימוש ב-Card
      elevation: 2,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8), // שינוי מרווחים
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        title: Text(title1, style: TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title2),
            Text(date),
            Text(time),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: Text(button1Text, style: TextStyle(fontSize: 12,color : Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // שינוי צבע כפתור
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                textStyle: TextStyle(fontSize: 12),
              ),
            ),
            SizedBox(width: 5),
            ElevatedButton(
              onPressed: () {},
              child: Text(button2Text, style: TextStyle(fontSize: 12,color : Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // שינוי צבע כפתור
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