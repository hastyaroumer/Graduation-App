import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:graduation_app/Home.dart';
import 'package:graduation_app/Notfication.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

class Info extends StatefulWidget {
  final String Email;
  const Info({super.key, required this.Email});

  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
  bool isLoading = false;
  int _selectedIndex = 0;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          widget.Email,
          style: TextStyle(
              color: Colors.blue.shade900,
              fontWeight: FontWeight.bold,
              fontSize: 25),
        )),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40))),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.amber.withOpacity(0.8),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("Register_Student")
            .doc(widget.Email)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final userData = snapshot.data!.data() as Map<String, dynamic>;

            return Column(
              children: [
                Center(
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('images/Shko.jpg'),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(100)),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(widget.Email),
                Text(userData['FirstName'] + ' ' + userData['LastName']),
                Text(userData['Coolege'] + '- Semester' + userData['Sem']),
                Text(userData['Phone']),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        launch(userData['Facebook']);
                      },
                      child: Link(
                        uri: Uri.parse(userData['Facebook']),
                        builder: (context, followLink) {
                          return Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('images/Facebook.png'),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.transparent),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        launch(userData['Instagram']);
                      },
                      child: Link(
                          uri: Uri.parse(userData['Instagram']),
                          builder: (context, followLink) {
                            return Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('images/Instagram.png'),
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(100),
                                  color: Colors.transparent),
                            );
                          }),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        launch(userData['Youtube']);
                      },
                      child: Link(
                        uri: Uri.parse(userData['Youtube']),
                        builder: (context, followLink) {
                          return Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.redAccent.shade700,
                                    width: 10),
                                image: DecorationImage(
                                    image: AssetImage('images/Youtube.jpg'),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.transparent),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ],
            );
          }

          return isLoading ? CircularProgressIndicator() : SizedBox();
        },
      ),
      bottomNavigationBar: CurvedNavigationBar(
          index: _selectedIndex,
          onTap: (_selectedIndex) {
            _onItemTapped(_selectedIndex);
          },
          buttonBackgroundColor: Colors.amber,
          color: Colors.blue.shade900,
          backgroundColor: Colors.white,
          animationDuration: Duration(milliseconds: 800),
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
