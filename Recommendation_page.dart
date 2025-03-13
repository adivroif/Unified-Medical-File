import 'package:flutter/material.dart';

void main() {
  runApp(RecommendationPage());
}

class RecommendationPage extends StatefulWidget {
  @override
  _RecommendationPage createState() => _RecommendationPage();
}

class _RecommendationPage extends State<RecommendationPage> {
  String _selectedOption = 'המלצות שהתקבלו לאחרונה';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('המלצות שלי'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {Navigator.pop(context);},
          ),
        ),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // שיפור: שימוש ב-InputDecorator עבור Dropdown
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
                        onPressed: () {},
                        child: Text('לקבל המלצה',style:TextStyle(color:Colors.white)),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue, // שינוי צבע כפתור
                        ),
                      ),
                      SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('כל ההמלצות',style:TextStyle(color:Colors.white)),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue, // שינוי צבע כפתור
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
    );
  }

  Widget _buildRecommendationTile(String title, String treatmentType) {
    return Card( // שיפור: שימוש ב-Card
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
              child: Text('פרטים',style:TextStyle(color:Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // שינוי צבע כפתור
              ),
            ),
          ],
        ),
      ),
    );
  }
}