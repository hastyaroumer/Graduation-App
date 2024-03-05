import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:graduation_app/Cource.dart';
import 'package:graduation_app/IT_CS.dart';
import 'package:graduation_app/Information.dart';
import 'package:graduation_app/Login_Page.dart';
import 'package:graduation_app/Notfication.dart';
import 'package:graduation_app/Sender.dart';
import 'package:graduation_app/Setting_Profile.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  final String Email;

  const Home({Key? key, required this.Email}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 1;

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
      } else if (_selectedIndex == 3) {
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) => HomePage(),
        //     ));
      }
    });
  }

  final HK = List<String>.generate(6, (index) => '');
  final List<String> Image_College = [
    'images/College5.jpg',
    'images/College1.jpg',
    'images/College2.jpg',
    'images/College3.jpg',
    'images/College4.jpg',
    'images/College6.jpg',
  ];
  bool isLoading = false;
  final List<String> College = [
    'کۆلێژی زانست و تەکنۆلۆژیا',
    'کۆلێژی پەرستاری',
    'کۆلێژی زمان',
    'کۆلێژی زانستە تەندروستییەکان',
    'کۆلێژی یاسا و سیاسەت',
    'کۆلێژی کارگێڕی و ئابووری',
  ];

  int _bottomNavIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("Register_Student")
            .doc(widget.Email)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final userData = snapshot.data!.data() as Map<String, dynamic>;
            final Name = '';
            return Drawer(
              child: ListView(
                children: [
                  UserAccountsDrawerHeader(
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: Colors.black.withOpacity(0.1)),
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(100)),
                        gradient: LinearGradient(
                            end: Alignment.bottomCenter,
                            begin: Alignment.topCenter,
                            colors: [
                              Colors.amber,
                              Colors.amber.shade100,
                            ]),
                        boxShadow: [
                          BoxShadow(blurRadius: 10, color: Colors.blue.shade900)
                        ]),
                    accountName: Text(
                      userData['FirstName'] + ' ' + userData['LastName'],
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue.shade900),
                    ),
                    accountEmail: Text(
                      widget.Email,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue.shade900),
                    ),
                    currentAccountPicture: CircleAvatar(
                      backgroundImage: userData['Email'] == 'hastyar@gmail.com'
                          ? AssetImage('images/Hastyar.jpg')
                          : userData['Email'] == 'shkomand@gmail.com'
                              ? AssetImage('images/Shko.jpg')
                              : AssetImage(''),
                    ),
                  ),
                  Center(
                    child: Text(
                      userData['Coolege'] + '_Semister ' + userData['Sem'],
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  ListTile(
                    title: Align(
                      child: Text(userData['Phone']),
                      alignment: Alignment.centerRight,
                    ),
                    leading: Icon(Icons.call),
                  ),
                  ListTile(
                    title: Align(
                      child: Text('گۆڕانکاری ئەکاونت'),
                      alignment: Alignment.centerRight,
                    ),
                    leading: Icon(Icons.settings),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                SettingsProfile(Email: widget.Email),
                          ));
                    },
                  ),
                  ListTile(
                    title: Align(
                      child: Text('کۆرسەکان'),
                      alignment: Alignment.centerRight,
                    ),
                    leading: Icon(Icons.co_present_sharp),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Course(College: "IT", Sem: "8"),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
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
                                        image:
                                            AssetImage('images/Instagram.png'),
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
                  SizedBox(
                    height: 50,
                  ),
                  Expanded(
                    child: GestureDetector(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.redAccent.shade700,
                        ),
                        height: 50,
                        width: 20,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'چونەدەرەوە    ',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                            Icon(
                              Icons.logout,
                              size: 25,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('ئایادەتەوێت بڕۆیتە دەرەوە'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text(
                                  'نەخێر',
                                  style: TextStyle(
                                      color: Colors.redAccent.shade700,
                                      fontSize: 15),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => LoginPage(),
                                      ));
                                },
                                child: Container(
                                  height: 40,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    boxShadow: [BoxShadow(blurRadius: 5)],
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.green.shade500,
                                  ),
                                  child: Center(
                                      child: Text(
                                    'بەڵی',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                    ),
                                  )),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          }
          return isLoading ? CircularProgressIndicator() : SizedBox();
        },
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
            toolbarHeight: 80,
            backgroundColor: Colors.amber.withOpacity(0.8),
            title: Align(
              alignment: Alignment.centerRight,
              child: Text(
                'زانکۆی گەشەپێدانی مرۆی',
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.blue.shade900,
                    fontFamily: 'fonts/Peshang_Des_3_Bold.ttf',
                    fontWeight: FontWeight.bold),
              ),
            ),
            actions: [
              IconButton(
                  tooltip: 'Message',
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UserListScreen(
                            Email: widget.Email,
                          ),
                        ));
                  },
                  icon: Icon(
                    Icons.textsms_rounded,
                    size: 30,
                    color: Colors.blue.shade900,
                  )),
              Image.asset(
                'images/Logo.png',
                fit: BoxFit.cover,
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: CarouselSlider(
              items: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10,
                        color: Colors.amber.withOpacity(0.8),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: AssetImage('images/IM1.jpg'), fit: BoxFit.cover),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10,
                        color: Colors.amber.withOpacity(0.8),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: AssetImage('images/IM2.jpg'), fit: BoxFit.cover),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10,
                        color: Colors.amber.withOpacity(0.8),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: AssetImage('images/IM3.jpg'), fit: BoxFit.cover),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10,
                        color: Colors.amber.withOpacity(0.8),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: AssetImage('images/IM4.jpg'), fit: BoxFit.cover),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10,
                        color: Colors.amber.withOpacity(0.8),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: AssetImage('images/IM5.jpg'), fit: BoxFit.cover),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10,
                        color: Colors.amber.withOpacity(0.8),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: AssetImage('images/IM6.jpg'), fit: BoxFit.cover),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10,
                        color: Colors.amber.withOpacity(0.8),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: AssetImage('images/IM7.jpg'), fit: BoxFit.cover),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10,
                        color: Colors.amber.withOpacity(0.8),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: AssetImage('images/IM8.jpg'), fit: BoxFit.cover),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10,
                        color: Colors.amber.withOpacity(0.8),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: AssetImage('images/IM9.jpg'), fit: BoxFit.cover),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10,
                        color: Colors.amber.withOpacity(0.8),
                      ),
                    ],
                    image: DecorationImage(
                        image: AssetImage('images/Logo.png'),
                        fit: BoxFit.cover),
                  ),
                ),
              ],
              options: CarouselOptions(
                height: 400,
                autoPlay: true,
                viewportFraction: 0.7,
                enlargeCenterPage: true,
                pageSnapping: true,
              ),
            ),
          ),
          SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  if (College[index] == 'کۆلێژی زانست و تەکنۆلۆژیا') {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => IT_CS_College(),
                        ));
                  }
                },
                child: Center(
                  child: Stack(
                    children: [
                      Positioned(
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 20),
                          height: 200,
                          width: MediaQuery.of(context).size.width / 1.2,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(Image_College[index]),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 10, color: Colors.blue.shade900),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 150,
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 20),
                          height: 50,
                          width: MediaQuery.of(context).size.width / 1.2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                            color: Colors.blue.shade900.withOpacity(0.7),
                          ),
                          child: Center(
                              child: Text(
                            College[index],
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          )),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ),
              );
            }, childCount: HK.length),
          ),
        ],
      ),
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
            Icon(
              Icons.message_sharp,
              color: Colors.white,
            ),
          ]),
    );
  }
}

// import 'dart:io';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
// import 'package:flutter/material.dart';
// import 'package:flutter_application_11/Chat.dart';

// class Home extends StatefulWidget {
//   final String nameStu;
//   final String userEmail;
//   const Home({Key? key, required this.nameStu, required this.userEmail})
//       : super(key: key);

//   @override
//   _YourWidgetState createState() => _YourWidgetState();
// }

// class _YourWidgetState extends State<Home> {
//   File? _image;
//   String? _imageUrl;

//   Future<void> _uploadImage() async {
//     if (_image ==
//         'https://www.bing.com/th?id=OIP.IWUDqJNEkGa_jAbNtzq51wHaHU&w=150&h=148&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2')
//       return;

//     try {
//       // Upload image to Firebase Storage
//       String fileName = DateTime.now().millisecondsSinceEpoch.toString();
//       firebase_storage.Reference ref =
//           firebase_storage.FirebaseStorage.instance.ref().child(fileName);
//       await ref.putFile(_image!);

//       // Get download URL of uploaded image
//       String downloadUrl = await ref.getDownloadURL();

//       // Update Firestore collection with image URL
//       String userEmail = widget.userEmail; // Replace with the user's email
//       await FirebaseFirestore.instance
//           .collection('Register_Student')
//           .doc(userEmail)
//           .update({
//         'https://www.bing.com/th?id=OIP.IWUDqJNEkGa_jAbNtzq51wHaHU&w=150&h=148&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2':
//             'https://www.bing.com/th?id=OIP.IWUDqJNEkGa_jAbNtzq51wHaHU&w=150&h=148&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2'
//       });

//       setState(() {
//         _imageUrl =
//             'https://www.bing.com/th?id=OIP.IWUDqJNEkGa_jAbNtzq51wHaHU&w=150&h=148&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2';
//       });
//     } catch (e) {
//       print('Error uploading image: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//           child: Container(
//         decoration: BoxDecoration(
//             image: DecorationImage(
//                 image: AssetImage(
//                     'https://www.bing.com/th?id=OIP.IWUDqJNEkGa_jAbNtzq51wHaHU&w=150&h=148&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2'))),
//       )),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => Chat(nameStu: widget.nameStu),
//               ));
//         },
//         child: Icon(Icons.upload),
//       ),
//     );
//   }
// }
