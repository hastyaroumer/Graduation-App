import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserListScreen extends StatefulWidget {
  final String Email;
  const UserListScreen({Key? key, required this.Email}) : super(key: key);

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  Future<void> _insertData(String email) async {
    try {
      await FirebaseFirestore.instance
          .collection('Request')
          .doc(widget.Email)
          .set({
        'RequestTo': email,
        'Email': widget.Email,
        'Acsept': 'Empty',
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('بە سەرکەوتوی نێردرا')),
      );
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to insert data: $error')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'بەکارهێنەرەکان',
          style: TextStyle(
              color: Colors.blue.shade900,
              fontWeight: FontWeight.bold,
              fontSize: 25),
        )),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40))),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.blue.shade900,
            )),
        backgroundColor: Colors.amber.withOpacity(0.8),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('Register_Student')
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: CircularProgressIndicator(
              color: Colors.amber,
            ));
          }
          String AC = 'Acsept';
          return ListView(
            children: snapshot.data!.docs
                .where((document) => document['Email'] != widget.Email)
                .map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data() as Map<String, dynamic>;

              return Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(color: Colors.blue.shade900)),
                child: ListTile(
                  trailing: IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('دڵنیابونەوە'),
                            content: Text(
                                'ئایا دڵنیایت لەوەی دەتەوێت ئەم بەکارهێنەرە زیاد بکەیت ؟'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('نەخێر'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  _insertData(data['Email']);
                                },
                                child: Text('بەڵێ'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    icon: Icon(
                      Icons.person_add_alt_1,
                      color: Colors.blue.shade900,
                      size: 35,
                    ),
                  ),
                  title: Text(
                    data['FirstName'] + ' ' + data['LastName'],
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  subtitle: Text(
                    data['Email'],
                    style: TextStyle(color: Colors.blue.shade900, fontSize: 15),
                  ),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
