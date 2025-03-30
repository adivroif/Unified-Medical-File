import 'package:flutter/material.dart';

class TalkWithDoctorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TalkToDoctorScreen(); // הסר את MaterialApp
  }
}

class TalkToDoctorScreen extends StatefulWidget {
  @override
  _TalkToDoctorScreenState createState() => _TalkToDoctorScreenState();
}

class _TalkToDoctorScreenState extends State<TalkToDoctorScreen> {
  String _selectedReason = 'פנייה לרופא';
  String _selectedTreatment = 'בחר';
  String _message = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('דבר עם הרופא'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.lightBlue.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('סוג פניה'),
                    DropdownButton<String>(
                      value: _selectedReason,
                      items: <String>['פנייה לרופא', 'בירור מידע', 'שאלה כללית']
                          .map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedReason = newValue!;
                        });
                      },
                      isExpanded: true,
                    ),
                    SizedBox(height: 16),
                    Text('טיפול'),
                    DropdownButton<String>(
                      value: _selectedTreatment,
                      items: <String>['בחר', 'טיפול 1', 'טיפול 2', 'טיפול 3','ללא טיפול']
                          .map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedTreatment = newValue!;
                        });
                      },
                      isExpanded: true,
                    ),
                    SizedBox(height: 16),
                    Text('גוף הפניה'),
                    TextField(
                      maxLines: 4,
                      decoration: InputDecoration(
                        hintText: 'טקסט חופשי',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        setState(() {
                          _message = value;
                        });
                      },
                    ),
                    SizedBox(height: 24),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          // כאן תוסיף את הלוגיקה לשליחת ההודעה
                          print('סוג פניה: $_selectedReason');
                          print('טיפול מקושר: $_selectedTreatment');
                          print('הודעה: $_message');
                        },
                        child: Text('שליחה'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}