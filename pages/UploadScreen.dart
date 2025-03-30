import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

class UploadScreen extends StatefulWidget {
  @override
  _UploadScreenState createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  File _file = File(" ");
  String _fileName = " ";
  double _uploadProgress = 0;

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        _file = File(result.files.single.path!);
        _fileName = result.files.single.name;
      });
    }
  }

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _file = File(pickedFile.path);
        _fileName = pickedFile.name;
      });
    }
  }

  Future<void> _takePicture() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _file = File(pickedFile.path);
        _fileName = pickedFile.name;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('העלאת מסמכים'),
      ),
      body: Container( // הוספת Container עם גרדיאנט
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.lightBlue.shade100, Colors.lightBlue.shade300],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: _pickFile,
                child: Text('בחר קובץ'),
              ),
              ElevatedButton(
                onPressed: _pickImage,
                child: Text('בחר תמונה'),
              ),
              ElevatedButton(
                onPressed: _takePicture,
                child: Text('צלם תמונה'),
              ),
              if (_file != null) Text('קובץ נבחר: $_fileName'),
              if (_uploadProgress > 0)
                LinearProgressIndicator(value: _uploadProgress),
              ElevatedButton(
                onPressed: (){},
                child: Text('העלה'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}