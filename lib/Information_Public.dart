import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoPub extends StatefulWidget {
  final String Email;
  const InfoPub({super.key, required this.Email});

  @override
  State<InfoPub> createState() => _InfoState();
}

class _InfoState extends State<InfoPub> {
  bool isLoading = false;

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
        backgroundColor: Colors.amber.withOpacity(0.5),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
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
    );
  }
}
