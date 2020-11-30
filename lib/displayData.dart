import 'package:flutter/material.dart';

class DisplayData extends StatelessWidget {
  final String name, id, email, programme, phoneNumber;

  DisplayData({this.name, this.id, this.email, this.programme, this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Display Data'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              children: <Widget>[
                Card(
                  child: ListTileInfoStudent(
                    data: name,
                    title: 'Student Name',
                    icon: Icons.person,
                  ),
                ),
                Card(
                  child: ListTileInfoStudent(
                    data: id,
                    title: 'Student Id',
                    icon: Icons.credit_card,
                  ),
                ),
                Card(
                  child: ListTileInfoStudent(
                    data: email,
                    title: 'Student Email',
                    icon: Icons.email,
                  ),
                ),
                Card(
                  child: ListTileInfoStudent(
                    data: programme,
                    title: 'Student Programme',
                    icon: Icons.class_,
                  ),
                ),
                Card(
                  child: ListTileInfoStudent(
                    data: phoneNumber,
                    title: 'Phone Number',
                    icon: Icons.phone,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: size.width,
            height: size.height * 0.06,
            child: RaisedButton(
              color: Colors.red,
              child: Text(
                'Back Button',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ListTileInfoStudent extends StatelessWidget {
  ListTileInfoStudent({this.data, this.title, this.icon});

  final String data, title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      subtitle: Text(
        data,
        style: TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }
}