import 'package:flutter/material.dart';
import 'package:last_session/studentAdd.dart';
import 'package:last_session/studentList.dart';

class StudentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width * 1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RaisedButton(
              child: Text("Add new student"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StudentAdd()),
                );
              },
            ),
            RaisedButton(
              child: Text("Student List"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StudentList()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
