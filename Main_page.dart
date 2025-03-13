import 'package:flutter/material.dart';
import 'ReportStatus_page.dart';
import 'Recommendation_page.dart';


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
                        Expanded(
                            child: _buildCard(context, 'קביעת תורים',
                                Icons.calendar_today, () {
                                  print('קביעת תורים נלחץ');
                                  // הוסף כאן ניווט למסך קביעת תורים
                                })),
                        SizedBox(width: 10),
                        Expanded(
                            child: _buildCard(context, 'טיפולים שלי',
                                Icons.favorite, () {
                                  print('טיפולים שלי נלחץ');
                                  // הוסף כאן ניווט למסך טיפולים שלי
                                })),
                        SizedBox(width: 10),
                        Expanded(
                            child: _buildCard(context, 'דיווחים שלי',
                                Icons.list, () {
                                  print('דיווחים שלי נלחץ');
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => ReportStatusPage()),
                                  );
                                })),
                      ],
                    )
                        : Column(
                      children: [
                        _buildCard(context, 'קביעת תורים',
                            Icons.calendar_today, () {
                              print('קביעת תורים נלחץ');
                              // הוסף כאן ניווט למסך קביעת תורים
                            }),
                        SizedBox(height: 10),
                        _buildCard(context, 'טיפולים שלי', Icons.favorite,
                                () {
                              print('טיפולים שלי נלחץ');
                              // הוסף כאן ניווט למסך טיפולים שלי
                            }),
                        SizedBox(height: 10),
                        _buildCard(context, 'דיווחים שלי', Icons.list, () {
                          print('דיווחים שלי נלחץ');
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ReportStatusPage()),
                          );
                        }),
                      ],
                    ),
                    SizedBox(height: 10),
                    constraints.maxWidth > 600
                        ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                            child: _buildCard(context, 'מסמכים',
                                Icons.description, () {
                                  print('מסמכים נלחץ');
                                  // הוסף כאן ניווט למסך מסמכים
                                })),
                        SizedBox(width: 10),
                        Expanded(
                            child: _buildCard(context, 'דבר עם הרופא',
                                Icons.person, () {
                                  print('דבר עם הרופא נלחץ');
                                  // הוסף כאן ניווט למסך דבר עם הרופא
                                })),
                        SizedBox(width: 10),
                        Expanded(
                            child: _buildCard(context, 'המלצות שלי',
                                Icons.lightbulb_outline, () {
                                  print('המלצות שלי נלחץ');
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => RecommendationPage()),
                                  );
                                })),
                      ],
                    )
                        : Column(
                      children: [
                        _buildCard(context, 'מסמכים',
                            Icons.description, () {
                              print('מסמכים נלחץ');
                              // הוסף כאן ניווט למסך מסמכים
                            }),
                        SizedBox(height: 10),
                        _buildCard(context, 'דבר עם הרופא', Icons.person,
                                () {
                              print('דבר עם הרופא נלחץ');
                              // הוסף כאן ניווט למסך דבר עם הרופא
                            }),
                        SizedBox(height: 10),
                        _buildCard(context, 'המלצות שלי',
                            Icons.lightbulb_outline, () {
                              print('המלצות שלי נלחץ');
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => RecommendationPage()),
                              );
                            }),
                      ],
                    ),
                    SizedBox(height: 20),
                    Text(
                      'טיפולים עתידיים שלך (2)',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    _buildTreatmentTile('טיפול מתמשך', 'טיפול דיקור סיני',
                        '18.02.2025', 'עדכון תור', 'פרטים', '14:00'),
                    SizedBox(height: 10),
                    _buildTreatmentTile('טיפול מתמשך', 'טיפול דיקור סיני',
                        '18.03.2025', 'עדכון תור', 'פרטים', '14:30'),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, String title, IconData icon,
      Function onPressed) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        onTap: () {
          onPressed();
        },
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: double.infinity,
          height: 100,
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 30, color: Colors.blue[800]),
              SizedBox(height: 5),
              Text(title,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w500)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTreatmentTile(String title1, String title2, String date,
      String button1Text, String button2Text, String time) {
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
              onPressed: () {},
              child: Text(button1Text, style: TextStyle(fontSize: 12)),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                textStyle: TextStyle(fontSize: 12),
              ),
            ),
            SizedBox(width: 5),
            ElevatedButton(
              onPressed: () {},
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