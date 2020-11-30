import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:last_session/studentEdit.dart';

class StudentList extends StatefulWidget {
  @override
  _StudentListState createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width*1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: size.height*0.1,),
            Text("Student List"),
            Container(
              height: size.height*0.8,
              child: StreamBuilder<QuerySnapshot>(
                stream: fetchStudent(),
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                  if(!snapshot.hasData){
                    return new Container(
                      child: Text("No Data"),
                    );
                  }
                  else
                    {
                      return ListView.builder(
                          itemCount: snapshot.data.docs.length,
                          itemBuilder: (BuildContext context, int i) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white
                                ),
                                width: size.width*1,
                                height: size.height*0.2,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          Text("Name: "),
                                          Text(snapshot.data.docs[i]["name"]),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text("Student Id: "),
                                          Text(snapshot.data.docs[i]["id"]),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text("Student Email: "),
                                          Text(snapshot.data.docs[i]["email"]),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text("Student Programme: "),
                                          Text(snapshot.data.docs[i]["programme"]),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text("Phone Number: "),
                                          Text(snapshot.data.docs[i]["phoneNumber"]),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          IconButton(
                                            icon: Icon(Icons.delete),
                                            onPressed: (){
                                              deleteStudent(i);
                                            },
                                          ),
                                          IconButton(
                                            icon: Icon(Icons.edit),
                                            onPressed: (){
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        StudentEdit(snapshot
                                                            .data.docs[i])),
                                              );
                                            },
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          });
                    }
                  
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  fetchStudent(){
    return FirebaseFirestore.instance.collection("Student").snapshots();
  }
  deleteStudent(id)async{
   CollectionReference collectionReference = FirebaseFirestore.instance.collection("Student");
   QuerySnapshot querySnapshot = await collectionReference.get();
   querySnapshot.docs[id].reference.delete();
  }
}
