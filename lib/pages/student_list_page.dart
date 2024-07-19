// lib/pages/student_list_page.dart

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import '../models/student_model.dart';

class StudentListPage extends StatefulWidget {
  final String? studentNumber;

  StudentListPage({this.studentNumber});

  @override
  _StudentListPageState createState() => _StudentListPageState();
}

class _StudentListPageState extends State<StudentListPage> {
  List<Student> _students = [];
  int _currentPage = 0;
  static const int _studentsPerPage = 10;
  Student? _currentStudent;
  bool _studentNotFound = false;

  @override
  void initState() {
    super.initState();
    _loadStudentData();
  }

  Future<void> _loadStudentData() async {
    try {
      final jsonString = await rootBundle.loadString('assets/ogrenciler.json');
      final jsonResponse = json.decode(jsonString) as List;
      setState(() {
        _students = jsonResponse.map<Student>((data) {
          return Student.fromJson(data);
        }).toList();

        // Öğrenci numarası verilmişse, ilgili öğrenciye bak
        if (widget.studentNumber != null) {
          _currentStudent = _students.firstWhere(
            (student) => student.number == widget.studentNumber,
            orElse: () => null!,
          );
          _studentNotFound = _currentStudent == null;
        }
      });

      // Eğer öğrenci bulunamadıysa, ana sayfada uyarı göster
      if (_studentNotFound) {
        setState(() {
          _currentStudent = null;
        });
      }
    } catch (e) {
      print('Error loading student data: $e');
      setState(() {
        _studentNotFound = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final totalPageCount = (_students.length / _studentsPerPage).ceil();
    final start = _currentPage * _studentsPerPage;
    final end = (start + _studentsPerPage) > _students.length
        ? _students.length
        : start + _studentsPerPage;
    final pageStudents = _students.sublist(start, end);

    return Scaffold(
      appBar: AppBar(
        title: Text('Öğrenci Listesi'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            if (_studentNotFound) ...[
              Text(
                'Öğrenci bulunamadı',
                style: TextStyle(color: Colors.red, fontSize: 18),
              ),
              SizedBox(height: 20),
            ],
            Expanded(
              child: SingleChildScrollView(
                child: DataTable(
                  columnSpacing: 16,
                  headingRowHeight: 56,
                  dataRowHeight: 56,
                  columns: [
                    DataColumn(label: Text('Öğrenci No')),
                    DataColumn(label: Text('Adı Soyadı')),
                    DataColumn(label: Text('Görev Durumu')),
                  ],
                  rows: pageStudents.map((student) {
                    return DataRow(
                      cells: [
                        DataCell(Text(student.number)),
                        DataCell(Text('${student.name} ${student.surname}')),
                        DataCell(
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: student.tasks.map((completed) {
                              return Icon(
                                completed ? Icons.check_circle : Icons.cancel,
                                color: completed ? Colors.green : Colors.red,
                                size: 24,
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (_currentPage > 0) {
                      setState(() {
                        _currentPage--;
                      });
                    }
                  },
                  child: Text('Önceki Sayfa'),
                ),
                Text('${_currentPage + 1} / $totalPageCount'),
                ElevatedButton(
                  onPressed: () {
                    if (_currentPage < totalPageCount - 1) {
                      setState(() {
                        _currentPage++;
                      });
                    }
                  },
                  child: Text('Sonraki Sayfa'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
