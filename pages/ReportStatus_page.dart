import 'package:flutter/material.dart';

void main() {
  runApp(ReportStatusPage());
}

class ReportStatusPage extends StatefulWidget {
  @override
  _ReportStatusPageState createState() => _ReportStatusPageState();
}

class _ReportStatusPageState extends State<ReportStatusPage> {
  String? _selectedTreatment;
  bool _showQuestions = false;
  List<double> _ratings = List.filled(6, 3.0); // דירוגים התחלתיים

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('דיווחים שלי'),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'תבחר\\י טיפול שעליו תרצה\\י\nלדווח:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  DropdownButtonFormField<String>(
                    value: _selectedTreatment,
                    items: <String>[
                      'טיפול 1',
                      'טיפול 2',
                      'טיפול 3',
                      'טיפול 4',
                      'טיפול 5',
                      'טיפול 6',
                      'טיפול 7',
                      'טיפול 8',
                      'טיפול 4',
                      'טיפול 5',
                      'טיפול 10',
                      'טיפול 20',
                      'טיפול 30',
                      'טיפול 40',
                      'טיפול 50',
                      'טיפול 19',
                      'טיפול 29',
                      'טיפול 93',
                      'טיפול 94',
                      '9טיפול 5'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedTreatment = newValue;
                      });
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelText: 'בחר',
                      suffixIcon: Icon(Icons.arrow_drop_down),
                    ),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _showQuestions = true;
                        });
                      },
                      child: Text('המשך', style: TextStyle(color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                        textStyle: TextStyle(fontSize: 18),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                  if (_showQuestions)
                    Expanded(
                      child: ListView(
                        children: _buildQuestions(),
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

  List<Widget> _buildQuestions() {
    return [
      SizedBox(height: 20),
      Text(
        'שאלות דיווח עבור $_selectedTreatment:',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 10),
      _buildQuestionWithSlider(0, '1. האם חשת בשיפור לאחר הטיפול?'),
      _buildQuestionWithSlider(1, '2. האם היו לך תופעות לוואי לאחר הטיפול?'),
      _buildQuestionWithSlider(2, '3. איך הרגשת במהלך הטיפול?'),
      _buildQuestionWithSlider(3, '4. האם הטיפול היה יעיל מבחינתך?'),
      _buildQuestionWithSlider(4, '5. באיזה מידה היית ממליץ לאחרים את הטיפול?'),
      _buildQuestionWithSlider(5, '6. היית חוזר על הטיפול בעבר?'),
      SizedBox(height: 20),
      Center(
        child: ElevatedButton(
          onPressed: () {
            print('דירוגים: $_ratings');
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(' דיווח על $_selectedTreatment נשמר בהצלחה '))
            );
            Navigator.pop(context);
          },
          child: Text('שמור דיווח', style: TextStyle(color: Colors.white)),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
            textStyle: TextStyle(fontSize: 18),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
      ),
    ];
  }

  Widget _buildQuestionWithSlider(int index, String question) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(question),
        Slider(
          value: _ratings[index],
          min: 1,
          max: 5,
          divisions: 4,
          label: _ratings[index].round().toString(),
          onChanged: (double value) {
            setState(() {
              _ratings[index] = value;
            });
          },
        ),
        Text('דירוג: ${_ratings[index].round()}'),
        SizedBox(height: 10),
      ],
    );
  }
}