import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:graduation_app/Home.dart';
import 'package:graduation_app/Information.dart';
import 'package:graduation_app/Information_Public.dart';

class Notfic extends StatefulWidget {
  final String Email;
  const Notfic({Key? key, required this.Email}) : super(key: key);

  @override
  State<Notfic> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<Notfic> {
  final Iconn = false;
  Future<void> _removeData(String email) async {
    try {
      await FirebaseFirestore.instance
          .collection('Request')
          .doc(email)
          .delete();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Data removed successfully')),
      );
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to remove data: $error')),
      );
    }
  }

  Future<void> _updateAcceptField(String email) async {
    try {
      await FirebaseFirestore.instance.collection('Request').doc(email).update({
        'Acsept': 'Accepted',
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Accept field updated successfully')),
      );
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to update Accept field: $error')),
      );
    }
  }

  int _selectedIndex = 2;

  static List<Widget> _widgetOptions = <Widget>[];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 2) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Notfic(Email: widget.Email),
            ));
      } else if (_selectedIndex == 1) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Home(Email: widget.Email),
            ));
      } else if (_selectedIndex == 0) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Info(Email: widget.Email),
            ));
      }
    });
  }

  Future<void> _insertData(String email) async {
    try {
      await FirebaseFirestore.instance.collection('Request').doc(email).set({
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
          'ئاگانامە',
          style: TextStyle(
              color: Colors.blue.shade900,
              fontWeight: FontWeight.bold,
              fontSize: 30),
        )),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40))),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.amber.withOpacity(0.8),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('Request').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            String data = widget.Email;

            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                  child: CircularProgressIndicator(
                color: Colors.amber,
              ));
            }

            return ListView(
              children: snapshot.data!.docs
                  .where((document) => document['RequestTo'] == data)
                  .map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data() as Map<String, dynamic>;

                return Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(color: Colors.blue.shade900)),
                  child: ListTile(
                    leading: IconButton(
                        onPressed: () {},
                        icon: data['Acsept'] == 'Empty'
                            ? Icon(
                                Icons.notification_important,
                                color: Colors.red,
                                size: 35,
                              )
                            : IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          InfoPub(Email: data['Email']),
                                    ),
                                  );
                                },
                                icon: Icon(Icons.person),
                                color: Colors.green,
                                iconSize: 35,
                              )),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('دڵنیا بونەوە'),
                                  content: Text('دەتەوێت پەیوەندی بکەیت'),
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
                                        _removeData(data['Email']);
                                      },
                                      child: Text('بەڵێ'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          icon: Icon(
                            Icons.remove_circle_outlined,
                            color: Colors.red,
                          ),
                        ),
                        IconButton(
                            onPressed: data['Acsept'] == 'Empty'
                                ? () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text('Confirmation'),
                                          content: Text(''),
                                          actions: <Widget>[
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Text('Cancel'),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                                _updateAcceptField(data[
                                                    'Email']); // Call _updateAcceptField
                                              },
                                              child: Text('Confirm'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  }
                                : () {},
                            icon: data['Acsept'] == 'Empty'
                                ? Icon(
                                    Icons.verified_user_rounded,
                                    color: Colors.green,
                                  )
                                : Icon(null)),
                      ],
                    ),
                    title: Text(data['Email']),
                  ),
                );
              }).toList(),
            );
          }),
      bottomNavigationBar: CurvedNavigationBar(
          index: _selectedIndex,
          onTap: (_selectedIndex) {
            _onItemTapped(_selectedIndex);
          },
          buttonBackgroundColor: Colors.amber,
          color: Colors.blue.shade900,
          backgroundColor: Colors.white,
          animationDuration: Duration(milliseconds: 1),
          items: [
            Icon(
              Icons.info,
              color: Colors.white,
            ),
            Icon(
              Icons.home,
              color: Colors.white,
            ),
            Icon(
              Icons.notifications,
              color: Colors.white,
            ),
          ]),
    );
  }
}
