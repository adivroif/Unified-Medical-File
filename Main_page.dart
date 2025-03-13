import 'package:flutter/material.dart';

void main() {
  runApp(MainPage());
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('מסך ראשי'),
          actions: [
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {},
            ),
          ],
        ),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.lightBlue.shade100, Colors.lightBlue.shade300],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: ListView(
                  padding: EdgeInsets.all(16.0),
                  children: [
                    Text(
                      'שלום, משה!',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text('איך נוכל לעזור לך היום?'),
                    SizedBox(height: 20),
                    constraints.maxWidth > 600
                        ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(child: _buildCard('קביעת תורים', Icons.calendar_today)),
                        SizedBox(width: 10),
                        Expanded(child: _buildCard('טיפולים שלי', Icons.favorite)),
                        SizedBox(width: 10),
                        Expanded(child: _buildCard('דיווחים שלי', Icons.list)),
                      ],
                    )
                        : Column(
                      children: [
                        _buildCard('קביעת תורים', Icons.calendar_today),
                        SizedBox(height: 10),
                        _buildCard('טיפולים שלי', Icons.favorite),
                        SizedBox(height: 10),
                        _buildCard('דיווחים שלי', Icons.list),
                      ],
                    ),
                    SizedBox(height: 10),
                    constraints.maxWidth > 600
                        ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(child: _buildCard('מסמכים', Icons.description)),
                        SizedBox(width: 10),
                        Expanded(child: _buildCard('דבר עם הרופא', Icons.person)),
                        SizedBox(width: 10),
                        Expanded(child: _buildCard('המלצות שלי', Icons.lightbulb_outline)),
                      ],
                    )
                        : Column(
                      children: [
                        _buildCard('מסמכים', Icons.description),
                        SizedBox(height: 10),
                        _buildCard('דבר עם הרופא', Icons.person),
                        SizedBox(height: 10),
                        _buildCard('המלצות שלי', Icons.lightbulb_outline),
                      ],
                    ),
                    SizedBox(height: 20),
                    Text(
                      'טיפולים עתידיים שלך (2)',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    _buildTreatmentTile('טיפול מתמשך', 'טיפול דיקור סיני', '18.02.2025', 'עדכון תור', 'פרטים', '14:00'),
                    SizedBox(height: 10),
                    _buildTreatmentTile('טיפול מתמשך', 'טיפול דיקור סיני', '18.03.2025', 'עדכון תור', 'פרטים', '14:30'),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildCard(String title, IconData icon) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        width: double.infinity,
        height: 100,
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 30, color: Colors.blue[800]),
            SizedBox(height: 5),
            Text(title, textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }

  Widget _buildTreatmentTile(String title1, String title2, String date, String button1Text, String button2Text, String time) {
    return Card(
      elevation: 2,
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
              onPressed: () {}, // הוספת פונקציה ריקה
              child: Text(button1Text, style: TextStyle(fontSize: 12)),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                textStyle: TextStyle(fontSize: 12),
              ),
            ),
            SizedBox(width: 5),
            ElevatedButton(
              onPressed: () {}, // הוספת פונקציה ריקה
              child: Text(button2Text, style: TextStyle(fontSize: 12)),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                textStyle: TextStyle(fontSize: 12),
              ),
            )
          ],
        ),
      ),
    );
  }
}