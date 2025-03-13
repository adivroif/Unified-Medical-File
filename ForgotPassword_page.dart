import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  // פונקציה לשליחת מייל איפוס סיסמה
  Future<void> _sendPasswordResetEmail(String email) async {
    final url = Uri.parse('YOUR_API_ENDPOINT'); // החלף ב-API Endpoint שלך
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email}),
      );
      if (response.statusCode == 200) {
        // מייל נשלח בהצלחה
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('קישור לאיפוס סיסמה נשלח')),
        );
      } else {
        // שגיאה בשליחת המייל
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('שגיאה בשליחת המייל')),
        );
      }
    } catch (e) {
      // שגיאה ברשת
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('שגיאה ברשת')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('שכחתי סיסמה'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue[100]!, Colors.blue[300]!],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  'הזן את כתובת האימייל שלך ואנו נשלח לך קישור לאיפוס הסיסמה.',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'כתובת אימייל',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'אנא הזן את כתובת האימייל שלך';
                    }
                    // הוסף כאן בדיקה תקינות של כתובת אימייל
                    return null;
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _sendPasswordResetEmail(_emailController.text); // קריאה לפונקציה
                    }
                  },
                  child: Text('שלח'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}