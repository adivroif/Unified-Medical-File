import 'package:flutter/material.dart';

void main() {
  runApp(RecommendationPage());
}

class RecommendationPage extends StatefulWidget {
  @override
  _RecommendationPageState createState() => _RecommendationPageState();
}

class _RecommendationPageState extends State<RecommendationPage> {
  String _selectedOption = 'המלצות שהתקבלו לאחרונה';
  List<String> _treatmentList = [
    'טיפול 1',
    'טיפול 2',
    'טיפול 3',
    'טיפול 4',
    'טיפול 5',
    'טיפול 1',
    'טיפול 2',
    'טיפול 3',
    'טיפול 4',
    'טיפול 5',
    'טיפול 1',
    'טיפול 2',
    'טיפול 3',
    'טיפול 4',
    'טיפול 5',
    'טיפול 1',
    'טיפול 2',
    'טיפול 3',
    'טיפול 4',
    'טיפול 5'
  ]; // רשימת הטיפולים שלך

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('המלצות שלי'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
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
              child: Column(
                children: [
                  InputDecorator(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 12),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: _selectedOption,
                        items: <String>[
                          'המלצות שהתקבלו לאחרונה',
                          'המלצות אחרות',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedOption = newValue!;
                          });
                        },
                        isExpanded: true,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        return _buildRecommendationTile(
                          index == 0 ? 'טיפול חוזר' : 'טיפול חדש',
                          index == 0 ? 'דיקור סיני' : 'דיקור יפני',
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 16),
                  Center(
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            _showTreatmentListDialog(context); // הצגת רשימת הטיפולים
                          },
                          child: Text('לקבל המלצה', style: TextStyle(color: Colors.white)),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                          ),
                        ),
                        SizedBox(height: 8),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text('כל ההמלצות', style: TextStyle(color: Colors.white)),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRecommendationTile(String title, String treatmentType) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        title: Text('המלצה על - $title', style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('סוג טיפול: $treatmentType'),
            ElevatedButton(
              onPressed: () {},
              child: Text('פרטים', style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showRecommendation(int treatment) {
    // כאן תוסיף את הלוגיקה שלך לקבלת המלצה
    String recommendation = _getRecommendation(treatment);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('המלצה'),
          content: Text(recommendation),
          actions: <Widget>[
            TextButton(
              child: Text('סגור'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  String _getRecommendation(int treatment) {
    // כאן תוסיף את הלוגיקה שלך לקבלת המלצה עבור טיפול ספציפי
    return 'מומלץ לבצע פעילות גופנית 3 פעמים בשבוע עבור $_treatmentList[treatment].';
  }

  // פונקציה להצגת רשימת הטיפולים בתיבת דו-שיח
  void _showTreatmentListDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('בחר טיפול'),
          content: Container(
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: _treatmentList.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(_treatmentList[index]),
                  onTap: () {
                    _showRecommendation(index); // קבלת המלצה
                    Navigator.of(context).pop(); // סגירת תיבת הדו-שיח
                  },
                );
              },
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('סגור'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}