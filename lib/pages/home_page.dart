// lib/pages/home_page.dart

import 'package:flutter/material.dart';
import 'student_list_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _numberController = TextEditingController();

  void _checkStudent() {
    final number = _numberController.text.trim();
    if (number.isNotEmpty) {
      // Şu an sadece öğrenci listesine yönlendirme var
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => StudentListPage(studentNumber: number),
        ),
      ).then((value) {
        if (value != null && value == false) {
          _showStudentNotFoundDialog();
        }
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Öğrenci numarasını giriniz')),
      );
    }
  }

  void _viewAllStudents() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => StudentListPage()),
    );
  }

  void _showStudentNotFoundDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Öğrenci Bulunamadı'),
          content:
              Text('Girilen öğrenci numarasıyla eşleşen öğrenci bulunamadı.'),
          actions: <Widget>[
            TextButton(
              child: Text('Tamam'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Oryantasyon Kontrol Sistemi'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Container(
            constraints: BoxConstraints(maxWidth: 400),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue, width: 2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 20),
                Text(
                  'Öğrenci numarasını giriniz:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                TextField(
                  controller: _numberController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Öğrenci numarasını giriniz',
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _checkStudent,
                  child: Text('Kontrol Et'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _viewAllStudents,
                  child: Text('Tüm Öğrencileri Gör'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
