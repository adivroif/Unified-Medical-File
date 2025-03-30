import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:ui' as ui; // הוסף את הייבוא הזה

class AppointmentScreen extends StatefulWidget {
  @override
  _AppointmentScreenState createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  String? _selectedTreatment;
  String? _selectedAvailableAppointment;
  DateTime? _selectedDate;

  final List<String> _treatments = ['דיקור סיני', 'פיזיותרפיה', 'רפלקסולוגיה', 'עיסוי רפואי'];
  final Map<String, List<String>> _availableAppointments = {
    'דיקור סיני': [
      'תל אביב - 10:00',
      'ירושלים - 14:00',
      'חיפה - 16:00'
    ],
    'פיזיותרפיה': [
      'רמת גן - 11:00',
      'באר שבע - 13:00',
      'אשדוד - 15:00'
    ],
    'רפלקסולוגיה': [
      'נתניה - 12:00',
      'פתח תקווה - 14:30',
      'חולון - 16:30'
    ],
    'עיסוי רפואי': [
      'ראשון לציון - 10:30',
      'כפר סבא - 12:30',
      'רחובות - 15:30'
    ],
  };

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2080),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _selectedAvailableAppointment = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('קביעת תור'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.lightBlue.shade100, Colors.lightBlue.shade300],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Directionality(
            textDirection: ui.TextDirection.rtl,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('בחר טיפול:'),
                DropdownButtonFormField<String>(
                  value: _selectedTreatment,
                  items: _treatments.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Directionality( // הוספת Directionality
                        textDirection: ui.TextDirection.ltr, // כיוון טקסט מימין לשמאל
                        child: Text(value),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedTreatment = newValue;
                      _selectedDate = null;
                      _selectedAvailableAppointment = null;
                    });
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),

                ),
                if (_selectedTreatment != null) ...[
                  SizedBox(height: 20),
                  Directionality(
                    textDirection: Directionality.of(context),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          onPressed: () => _selectDate(context),
                          child: Text(_selectedDate == null
                              ? 'בחר תאריך'
                              : DateFormat('dd/MM/yyyy').format(_selectedDate!)),
                        ),
                        SizedBox(width: 10),
                        Text('בחר תאריך'),
                      ],
                    ),
                  ),
                  if (_selectedDate != null) ...[
                    SizedBox(height: 20),
                    Text('בחר תור פנוי:'),
                    DropdownButtonFormField<String>(
                      value: _selectedAvailableAppointment,
                      items: _availableAppointments[_selectedTreatment]!.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Directionality(
                            textDirection: ui.TextDirection.rtl,
                            child: Text(value),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedAvailableAppointment = newValue;
                        });
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                ],
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_selectedTreatment != null &&
                          _selectedDate != null &&
                          _selectedAvailableAppointment != null) {
                        print('טיפול: $_selectedTreatment');
                        print('תאריך: ${DateFormat('dd/MM/yyyy').format(_selectedDate!)}');
                        print('תור פנוי: $_selectedAvailableAppointment');
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('התור נקבע בהצלחה!')),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('אנא בחר טיפול, תאריך ותור פנוי')),
                        );
                      }
                    },
                    child: Text('קבע תור'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}