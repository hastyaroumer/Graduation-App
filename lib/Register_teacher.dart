//
// Generated file. Do not edit.
//

// ignore_for_file: directives_ordering
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: depend_on_referenced_packages

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gender_picker/source/enums.dart';
import 'package:gender_picker/source/gender_picker.dart';
import 'package:graduation_app/Login_Page.dart';

// ignore: public_member_api_docs

class Register_Teacher extends StatefulWidget {
  const Register_Teacher({super.key});

  @override
  State<Register_Teacher> createState() => _RigisterState();
}

class _RigisterState extends State<Register_Teacher> {
  List<String> Certifitcatee = ['بەکالۆریۆس', 'ماستەر', 'دکتۆرا', 'پڕۆفیسۆر'];
  bool _obscureText1 = true;
  bool _obscureText = true;
  bool _ShowError1 = false;
  bool _ShowError2 = false;
  bool _ShowSuccess1 = false;
  bool _ShowSuccess2 = false;

  final TextEditingController FName = TextEditingController();
  final TextEditingController LName = TextEditingController();
  final TextEditingController Mobil = TextEditingController();
  final TextEditingController Email = TextEditingController();
  TextEditingController Certificate = TextEditingController();
  Gender _selectedGender = Gender.Male;
  final Passwordd = TextEditingController();
  final ConPasswordd = TextEditingController();
  String? selectedCertificate;
  Future<void> _insertData2(
    String firstName,
    String lastName,
    int mobile,
    // String certificate,
    String email,
    Gender gender,
    String password,
  ) async {
    try {
      if (email.isNotEmpty) {
        // Ensure email is not empty
        // Create user with email and password
        UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        // Access Firestore collection
        await FirebaseFirestore.instance
            .collection('Register_Teacher')
            .doc(userCredential.user!.uid)
            .set({
          'FirstName': firstName,
          'LastName': lastName,
          'Email': email,
          'Phone': mobile.toString(),
          'Gender': gender.toString().split('.').last,
          'password': password,
          'Certificate': "ماستەر",
          'Facebook': 'Empty',
          'Instagram': 'Empty',
          'Youtube': 'Empty',
        });

        // Clear text controllers
        FName.clear();
        LName.clear();
        Email.clear();
        Mobil.clear();
        Certificate.clear();
        Passwordd.clear();
        ConPasswordd.clear();

        // Navigate to login page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
        print("Registered user");
      } else {
        print("Email is empty");
        // Handle case where email is empty (display error, prevent registration, etc.)
      }
    } catch (error) {
      print("Failed to register user: $error");
      // Handle registration failure (display error, retry registration, etc.)
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Container(
            width: MediaQuery.of(context).size.width / 1,
            height: MediaQuery.of(context).size.height / 1,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Center(
                    child: Container(
                      height: MediaQuery.of(context).size.height / 3,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(100)),
                          gradient: LinearGradient(
                              end: Alignment.bottomCenter,
                              begin: Alignment.topCenter,
                              colors: [
                                Colors.amber.shade700,
                                Colors.amber.withOpacity(0.2),
                              ]),
                          image: DecorationImage(
                              image: AssetImage('images/Logo.png'))),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 50,
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: ElevatedButton(
                          onPressed: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => Register_Student()));
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.blue.shade900,
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(30),
                                  topLeft: Radius.circular(30)),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'قوتابی',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.blue.shade900,
                            elevation: 10,
                            shape: RoundedRectangleBorder(),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'مامۆستا',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: ElevatedButton(
                          onPressed: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => Register_Taxi()));
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.blue.shade900,
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(30),
                                  topRight: Radius.circular(30)),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'تەکسی',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'تۆمار کردنی مامۆستا',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue.shade900,
                            fontFamily: 'DroidNaskh'),
                      ),
                      Text(
                        ' فۆرمی',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue.shade900,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.05,
                    height: 600,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(blurRadius: 10, color: Colors.amber.shade700)
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      border: Border.all(
                        width: 2,
                        color: Colors.transparent,
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            height: 50,
                            width: MediaQuery.of(context).size.width / 1.4,
                            child: TextField(
                              controller: FName,
                              style: TextStyle(fontSize: 18),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                label: Center(
                                  child: Text(
                                    "ناوی یەکەم",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.blue.shade900,
                                        fontFamily: 'DroidNaskh'),
                                  ),
                                ),
                                prefixIcon: Icon(
                                  Icons.person_outline_sharp,
                                  color: Colors.blue.shade900,
                                ),
                                hintText: "ناوی یەکەم",
                                hintStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue.shade900.withOpacity(0.5),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(30),
                                  ),
                                  borderSide:
                                      BorderSide(color: Colors.blue.shade900),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            height: 50,
                            width: MediaQuery.of(context).size.width / 1.4,
                            child: TextField(
                              controller: LName,
                              style: TextStyle(fontSize: 18),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                label: Center(
                                  child: Text(
                                    "ناوی دووەم",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.blue.shade900,
                                        fontFamily: 'DroidNaskh'),
                                  ),
                                ),
                                prefixIcon: Icon(
                                  Icons.person_outline,
                                  color: Colors.blue.shade900,
                                ),
                                hintText: "ناوی دووەم",
                                hintStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue.shade900.withOpacity(0.5),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            height: 50,
                            width: MediaQuery.of(context).size.width / 1.4,
                            child: TextField(
                              controller: Email,
                              style: TextStyle(fontSize: 18),
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                label: Center(
                                  child: Text(
                                    "ئیمەیڵی زانکۆ تۆمار بکە",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.blue.shade900,
                                        fontFamily: 'DroidNaskh'),
                                  ),
                                ),
                                prefixIcon: Icon(
                                  Icons.email_outlined,
                                  color: Colors.blue.shade900,
                                ),
                                hintText: "example@uhd.edu.iq",
                                hintStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue.shade900.withOpacity(0.5),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            height: 50,
                            width: MediaQuery.of(context).size.width / 1.4,
                            child: TextField(
                              controller: Mobil,
                              style: TextStyle(fontSize: 18),
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                label: Center(
                                  child: Text(
                                    "ژمارەی مۆبال تۆمار بکە",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.blue.shade900,
                                        fontFamily: 'DroidNaskh'),
                                  ),
                                ),
                                prefixIcon: Icon(
                                  Icons.call_outlined,
                                  color: Colors.blue.shade900,
                                ),
                                hintText: "07711749000",
                                hintStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue.shade900.withOpacity(0.5),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            height: 50,
                            width: MediaQuery.of(context).size.width / 1.4,
                            child: DropdownButtonFormField<String>(
                              isDense: false,
                              itemHeight: 60,
                              isExpanded: true,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                contentPadding:
                                    EdgeInsets.fromLTRB(10, 20, 10, 0),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                prefixIcon: Icon(
                                  Icons.school_outlined,
                                  color: Colors.blue.shade900,
                                ),
                              ),
                              hint: Center(
                                child: Text(
                                  'Select a certificate',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.blue.shade900,
                                  ),
                                ),
                              ),
                              value: selectedCertificate,
                              items: Certifitcatee.map((item) {
                                return DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontFamily: 'DroidNaskh',
                                    ),
                                  ),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  selectedCertificate = value;
                                });
                              },
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          GenderPickerWithImage(
                            showOtherGender: false,
                            verticalAlignedText: false,
                            maleText: 'نێر',
                            femaleText: 'مێ',
                            selectedGender: Gender.Male,
                            selectedGenderTextStyle: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                            unSelectedGenderTextStyle: TextStyle(
                                color: Colors.blue.shade900,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                            onChanged: (gender) {
                              print(gender);
                            },
                            equallyAligned: true,
                            animationDuration: Duration(milliseconds: 300),
                            isCircular: true,
                            // default : true,
                            opacityOfGradient: 0.4,
                            padding: const EdgeInsets.all(3),
                            size: 50, //default : 40
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            height: 50,
                            width: MediaQuery.of(context).size.width / 1.4,
                            child: TextField(
                              controller: Passwordd,
                              style: TextStyle(fontSize: 18),
                              obscureText: _obscureText,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                label: Center(
                                  child: Text(
                                    "وشەی نهێنی",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.blue.shade900,
                                        fontFamily: 'DroidNaskh'),
                                  ),
                                ),
                                prefixIcon: Icon(
                                  Icons.key_rounded,
                                  color: Colors.blue.shade900,
                                ),
                                hintText: "وشەی نهێنی",
                                hintStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue.shade900.withOpacity(0.5),
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _obscureText
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.blue.shade900,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _obscureText = !_obscureText;
                                    });
                                  },
                                ),
                              ),
                              onChanged: (value) {
                                String P = Passwordd.text;
                                if (P.isEmpty) {
                                  setState(() {
                                    _ShowError1 = false;
                                    _ShowSuccess1 = false;
                                  });
                                } else {
                                  if (value.length < 8) {
                                    setState(() {
                                      _ShowError1 = true;
                                      _ShowSuccess1 = false;
                                    });
                                  } else {
                                    setState(() {
                                      _ShowSuccess1 = true;
                                      _ShowError1 = false;
                                    });
                                  }
                                }
                              },
                            ),
                          ),
                          _ShowError1
                              ? Text(
                                  'تکایە وشەی نهێنی لە ٨ وشە زیاتر بێت',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                )
                              : SizedBox(),
                          _ShowSuccess1
                              ? Text(
                                  'ئێستا تەواوە',
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                )
                              : SizedBox(),
                          SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            height: 50,
                            width: MediaQuery.of(context).size.width / 1.4,
                            child: TextField(
                              controller: ConPasswordd,
                              style: TextStyle(fontSize: 18),
                              obscureText: _obscureText1,
                              decoration: InputDecoration(
                                isDense: false,
                                filled: true,
                                fillColor: Colors.white,
                                errorStyle: TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.bold),
                                label: Center(
                                  child: Text(
                                    'پشت ڕاستکردنەوە',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.blue.shade900,
                                        fontFamily: 'DroidNaskh'),
                                  ),
                                ),
                                prefixIcon: Icon(
                                  Icons.key,
                                  color: Colors.blue.shade900,
                                ),
                                hintText: "پشت ڕاستکردنەوە",
                                hintStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue.shade900.withOpacity(0.5),
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _obscureText1
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.blue.shade900,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _obscureText1 = !_obscureText1;
                                    });
                                  },
                                ),
                              ),
                              onChanged: (value) {
                                String P = Passwordd.text;
                                String CP = ConPasswordd.text;
                                if (CP.isEmpty) {
                                  setState(() {
                                    _ShowError2 = false;
                                    _ShowSuccess2 = false;
                                  });
                                } else {
                                  if (CP != P) {
                                    setState(() {
                                      _ShowError2 = true;
                                      _ShowSuccess2 = false;
                                    });
                                  } else {
                                    setState(() {
                                      _ShowError2 = false;
                                      _ShowSuccess2 = true;
                                    });
                                  }
                                }
                              },
                            ),
                          ),
                          _ShowError2
                              ? Text(
                                  'یەکسان نییە بە وشەی نهێنی',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                )
                              : SizedBox(),
                          _ShowSuccess2
                              ? Text(
                                  'ئێستا تەواوە',
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                )
                              : SizedBox(),
                          SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            height: 50,
                            width: MediaQuery.of(context).size.width / 1.299,
                            child: ElevatedButton(
                              onPressed: () {
                                if (selectedCertificate != null &&
                                    selectedCertificate!.isNotEmpty) {
                                  // Call _insertData function with selected certificate
                                  _insertData2(
                                      FName.text,
                                      LName.text,
                                      int.parse(Mobil.text),
                                      Email.text,
                                      // selectedCertificate ?? '',
                                      _selectedGender,
                                      Passwordd.text);
                                } else {
                                  // Display error message or prevent user from registering
                                  print('Please select a certificate');
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.amber,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(60),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'تۆمارکردن  ',
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Icon(
                                    Icons.receipt_long_outlined,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.arrow_back,
                                size: 30,
                                color: Colors.blue.shade900,
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    'گەڕانەوە',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.blue.shade900,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}






























// // import 'package:final_project/Rigister_Student.dart';
// // import 'package:final_project/Rigister_Taxi.dart';


// import 'package:app_gdradution/homes.dart';
// import 'package:app_gdradution/splash.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// // import 'package:gender_picker/source/enums.dart';
// // import 'package:gender_picker/source/gender_picker.dart';

// class Rigister_Teacher extends StatefulWidget {
//   const Rigister_Teacher({super.key});

//   @override
//   State<Rigister_Teacher> createState() => _RigisterState();
// }

// class _RigisterState extends State<Rigister_Teacher> {
//   List<String> Certifitcatee = ['بەکالۆریۆس', 'ماستەر', 'دکتۆرا', 'پڕۆفیسۆر'];
//   bool _obscureText1 = true;
//   bool _obscureText = true;
//   bool _ShowError1 = false;
//   bool _ShowError2 = false;
//   bool _ShowSuccess1 = false;
//   bool _ShowSuccess2 = false;
//    String? errorMessage;
//   final _auth = FirebaseAuth.instance;
//   final _formKey = GlobalKey<FormState>();
//   final firstNameEditingController = new TextEditingController();
//   final selectEditingController = new TextEditingController();
//   final secondNameEditingController = new TextEditingController();
//   final emailEditingController = new TextEditingController();
//     final phoneEditingController = new TextEditingController();
//   final passwordEditingController = new TextEditingController();
//   final confirmPasswordEditingController = new TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//         final firstNameField = TextFormField(
//         autofocus: false,
//         controller: firstNameEditingController,
//         keyboardType: TextInputType.name,
//         validator: (value) {
//           RegExp regex = new RegExp(r'^.{3,}$');
//           if (value!.isEmpty) {
//             return ("ناوه‌كه‌تۆماربكه‌ تكایه‌");
//           }
//           if (!regex.hasMatch(value)) {
//             return ("سێ پیت كه‌متر نه‌بێ تكایه‌");
//           }
//           return null;
//         },
//         onSaved: (value) {
//           firstNameEditingController.text = value!;
//         },
//         textInputAction: TextInputAction.next,
//         decoration: InputDecoration(
//           prefixIcon: Icon(Icons.person_outline_sharp, color: Colors.blue.shade900,),
//           contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
//           hintText:  "ناوی یەکەم",
//           hintStyle: TextStyle(
//             fontSize: 20,
//           color: Colors.blue.shade900,
//             fontFamily: 'DroidNaskh'),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(30),
//             borderSide:
//            BorderSide(color: Colors.blue.shade900),
//           ),
//         ));


//          final selecflidField = TextFormField(
//         autofocus: false,
//         controller: selectEditingController,
//         keyboardType: TextInputType.name,
//         validator: (value) {
//           RegExp regex = new RegExp(r'^.{3,}$');
//           if (value!.isEmpty) {
//             return ("ناوه‌كه‌تۆماربكه‌ تكایه‌");
//           }
//           if (!regex.hasMatch(value)) {
//             return ("سێ پیت كه‌متر نه‌بێ تكایه‌");
//           }
//           return null;
//         },
//         onSaved: (value) {
//           firstNameEditingController.text = value!;
//         },
//         textInputAction: TextInputAction.next,
//         decoration: InputDecoration(
//           prefixIcon: Icon(Icons.school_outlined, color: Colors.blue.shade900,),
//           contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
//           hintText:  " دیاریكردنی بروانامه‌",
//           hintStyle: TextStyle(
//             fontSize: 20,
//           color: Colors.blue.shade900,
//             fontFamily: 'DroidNaskh'),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(30),
//             borderSide:
//            BorderSide(color: Colors.blue.shade900),
//           ),
//         ));








//          final secondNameField = TextFormField(
//         autofocus: false,
//         controller: secondNameEditingController,
//         keyboardType: TextInputType.name,
//         validator: (value) {
//           if (value!.isEmpty) {
//             return ("ناوه‌كه‌تۆماربكه‌ تكایه‌");
//           }
//           return null;
//         },
//         onSaved: (value) {
//           secondNameEditingController.text = value!;
//         },
//         textInputAction: TextInputAction.next,
//         decoration: InputDecoration(
//           prefixIcon: Icon(Icons.person_outline,
//           color: Colors.blue.shade900,),
//           contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
//           hintText: "ناوی دووەم",
//           hintStyle: TextStyle(
//            fontWeight: FontWeight.bold,
//             color: Colors.blue.shade900.withOpacity(0.5),
//              ),
//            border: OutlineInputBorder(
//           borderRadius:
//             BorderRadius.all(Radius.circular(30)),
//               borderSide: BorderSide(color: Colors.white)
//           ),
//         ));


//          final emailField = TextFormField(
//         autofocus: false,
//         controller: emailEditingController,
//         keyboardType: TextInputType.emailAddress,
//         validator: (value) {
//           if (value!.isEmpty) {
//             return ("تكایه‌ ئیمێله‌كه‌و داخل بكه‌");
//           }
//           // reg expression for email validation
//           if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
//               .hasMatch(value)) {
//             return ("تكایه‌ به‌ وردی داخلی بكه‌");
//           }
//           return null;
//         },
//         onSaved: (value) {
//           firstNameEditingController.text = value!;
//         },
//         textInputAction: TextInputAction.next,
//         decoration: InputDecoration(
//           prefixIcon: Icon(Icons.email_outlined,
//           color: Colors.blue.shade900,),
//           contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
//            hintText: "example@uhd.edu.iq",
//                                 hintStyle: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.blue.shade900.withOpacity(0.5),
//                                 ),
          
//           border: OutlineInputBorder(
//                                   borderRadius:
//                                       BorderRadius.all(Radius.circular(30)),
//                                   borderSide: BorderSide(color: Colors.white),
                                
//           ),
//         ));


// final phoneField = TextFormField(
//         autofocus: false,
//         controller: phoneEditingController,
//         keyboardType: TextInputType.phone,
//         validator: (value) {
//           if (value!.isEmpty) {
//             return ("ژمارەی مۆبال تۆمار بکە");
//           }
//           // reg expression for email validation
//           if (!RegExp("^[0-9]+[0-9]+[0-9]+[0-9]+[0-9]+[0-9]+[0-9]+[0-9]+[0-9]+[0-9]+[0-9]")
//               .hasMatch(value)) {
//             return ("تكایه‌ به‌ وردی داخلی بكه‌");
//           }
//           return null;
//         },
//         onSaved: (value) {
//           firstNameEditingController.text = value!;
//         },
//         textInputAction: TextInputAction.next,
//         decoration: InputDecoration(
//           prefixIcon: Icon(Icons.phone_android_rounded,
//           color: Colors.blue.shade900,),
//           contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
//           hintText: "07711749000",
//                                 hintStyle: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.blue.shade900.withOpacity(0.5),
//                                 ),
          
//           border: OutlineInputBorder(
//                                   borderRadius:
//                                       BorderRadius.all(Radius.circular(30)),
//                                   borderSide: BorderSide(color: Colors.white),
                                
//           ),
//         ));





//          final passwordField = TextFormField(
//         autofocus: false,
//         controller: passwordEditingController,
//         obscureText: true,
//         validator: (value) {
//           RegExp regex = new RegExp(r'^.{6,}$');
//           if (value!.isEmpty) {
//             return ("تكایه‌ وشه‌ی نهێنی داخل بكه‌");
//           }
//           if (!regex.hasMatch(value)) {
//             return ("تكایه‌ با له‌ 6 پیت كه‌متر نه‌بێ");
//           }
//           return null;
//         },
//         onSaved: (value) {
//           firstNameEditingController.text = value!;
//         },
//         textInputAction: TextInputAction.next,
//         decoration: InputDecoration(
//           prefixIcon: Icon( _obscureText
//                                         ? Icons.visibility
//                                         : Icons.visibility_off,
//                                     color: Colors.blue.shade900,),
                                    
//           contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
//           hintText: "Password",
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(30),
//           ),
//         ));
        


//           final confirmPasswordField = TextFormField(
//         autofocus: false,
//         controller: confirmPasswordEditingController,
//         obscureText: true,
//         validator: (value) {
//           if (confirmPasswordEditingController.text !=
//               passwordEditingController.text) {
//             return "هه‌مان وشه‌ی نهێنی نیه‌";
//           }
//           return null;
//         },
//         onSaved: (value) {
//           confirmPasswordEditingController.text = value!;
//         },
//         textInputAction: TextInputAction.done,
//         decoration: InputDecoration(
//           suffixIcon: IconButton(
//                                   icon: Icon(
//                                     _obscureText1
//                                         ? Icons.visibility
//                                         : Icons.visibility_off,
//                                     color: Colors.blue.shade900,
//                                   ),
//                                   onPressed: () {
//                                     setState(() {
//                                       _obscureText1 = !_obscureText1;
//                                     });
//                                   },
//                                 ),
//           prefixIcon: Icon(Icons.vpn_key,
//          color: Colors.blue.shade900,),
         
//           contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
//           hintText: "Confirm Password",
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(30),
//           ),
//         ));





//  final signUpButton = Material(
//       elevation: 5,
//       borderRadius: BorderRadius.circular(30),
//       color: Colors.redAccent,
//       child: ElevatedButton(
//         onPressed: () {
         
//      signUp(emailEditingController.text, passwordEditingController.text);
//       Navigator.push(context, MaterialPageRoute(builder: (context) => homestudent(),));
//          },
//       style: ElevatedButton.styleFrom(
//        foregroundColor: Colors.white, backgroundColor: Colors.amber.shade700,
//         shape: RoundedRectangleBorder(
//          borderRadius: BorderRadius.circular(60),
//                                 ),
//                               ),
//        child: Row(
//          mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//            Text(
//           'تۆمارکردن  ',
//            style: TextStyle(
//             fontSize: 25,
//             fontWeight: FontWeight.bold),
//                                   ),
//            Icon(
//            Icons.receipt_long_outlined,
//            color: Colors.white,
//                                   ),
//                                 ],
//                               ),
//                             ),
      
      
    
//     );













//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(leading: IconButton(onPressed: (){
//        // Navigator.push(context,MaterialPageRoute(builder: (context) => splash3(),));
//       }, icon: Icon(Icons.arrow_back_ios,color: Colors.amber,),
//       color: Colors.transparent,)),
//         backgroundColor: Colors.white,
//         body: SafeArea(
//           child: Container(
//             width: MediaQuery.of(context).size.width / 1,
//             height: MediaQuery.of(context).size.height / 1,
//             child: SingleChildScrollView(
//               child:
//                Form(
//                 key: _formKey,
//                  child: Column(
//                   children: [
//                     Center(
//                       child: Container(
//                         height: MediaQuery.of(context).size.height / 3,
//                         width: double.infinity,
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.only(
//                                 bottomLeft: Radius.circular(100)),
//                             gradient: LinearGradient(
//                                 end: Alignment.bottomCenter,
//                                 begin: Alignment.topCenter,
//                                 colors: [
//                                   Colors.amber.shade700,
//                                   Colors.amber.withOpacity(0.2),
//                                 ]),
//                             image: DecorationImage(
//                                 image: AssetImage('assets/images/logo.png'))),
//                       ),
//                     ),
                   
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           'تۆمار کردنی مامۆستا',
//                           style: TextStyle(
//                               fontSize: 30,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.blue.shade900,
//                               fontFamily: 'DroidNaskh'),
//                         ),
//                         Text(
//                           ' فۆرمی',
//                           style: TextStyle(
//                             fontSize: 30,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.blue.shade900,
//                           ),
//                         ),
//                       ],
//                     ),
//                     Container(
//                       width: MediaQuery.of(context).size.width / 1.05,
//                       height: 600,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         boxShadow: [
//                           BoxShadow(blurRadius: 10, color: Colors.amber.shade700)
//                         ],
//                         borderRadius: BorderRadius.all(Radius.circular(25)),
//                         border: Border.all(
//                           width: 2,
//                           color: Colors.transparent,
//                         ),
//                       ),
//                       child: SingleChildScrollView(
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             SizedBox(height: 45),
//                       firstNameField,
//                       SizedBox(height: 20),
//                       secondNameField,
//                       SizedBox(height: 20),
//                       emailField,
//                       SizedBox(height: 20),
//                       selecflidField,
//                       SizedBox(height: 20),
//                       phoneField,
//                       SizedBox(height: 20),
//                       passwordField,
//                       SizedBox(height: 20),
//                       confirmPasswordField,
                      
//                       SizedBox(height: 20),
//                       signUpButton
                      
//                             // SizedBox(
//                             //   height: 15,
//                             // ),
//                             // GenderPickerWithImage(
//                             //   showOtherGender: false,
//                             //   verticalAlignedText: false,
//                             //   maleText: 'نێر',
//                             //   femaleText: 'مێ',
//                             //   selectedGender: Gender.Male,
//                             //   selectedGenderTextStyle: TextStyle(
//                             //       color: Colors.red,
//                             //       fontWeight: FontWeight.bold,
//                             //       fontSize: 20),
//                             //   unSelectedGenderTextStyle: TextStyle(
//                             //       color: Colors.blue.shade900,
//                             //       fontWeight: FontWeight.bold,
//                             //       fontSize: 15),
//                             //   onChanged: (gender) {
//                             //     print(gender);
//                             //   },
//                             //   equallyAligned: true,
//                             //   animationDuration: Duration(milliseconds: 300),
//                             //   isCircular: true,
//                             //   // default : true,
//                             //   opacityOfGradient: 0.4,
//                             //   padding: const EdgeInsets.all(3),
//                             //   size: 50, //default : 40
//                             // ),
//                             // SizedBox(
//                             //   height: 15,
//                             // ),
                          
                          
//                             ,SizedBox(
//                               height: 15,
//                             ),
                            
//                           ],
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 15,
//                     )
//                   ],
//                                ),
//                ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//    void signUp(String email, String password) async {
//     if (_formKey.currentState!.validate()) {
//       try {
//         await _auth
//             .createUserWithEmailAndPassword(email: email, password: password)
//             .then((value) => {postDetailsToFirestore()})
//             .catchError((e) {
//          // Fluttertoast.showToast(msg: e!.message);
//         });
//       } on FirebaseAuthException catch (error) {
//         switch (error.code) {
//           case "invalid-email":
//             errorMessage = "ئیمێله كیشه‌ی هه‌یه‌";
//             break;
//           case "wrong-password":
//             errorMessage = "وشه‌ی نێهێتی ههه‌له‌یه‌.";
//             break;
//           case "user-not-found":
//             errorMessage = "ئیمێله كیشه‌ی هه‌یه‌";
//             break;
//           case "user-disabled":
//             errorMessage = "ئیمێله كیشه‌ی هه‌یه‌";
//             break;
//           case "too-many-requests":
//             errorMessage = "Too many requests";
//             break;
//           case "operation-not-allowed":
//             errorMessage = "وشه‌ی نێهێتی ههه‌له‌یه‌.";
//             break;
//           default:
//             errorMessage = "An undefined Error happened.";
//         }
//         //Fluttertoast.showToast(msg: errorMessage!);
//         print(error.code);
//       }
//     }
//   }
//   postDetailsToFirestore() async {
  

//     FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
//     User? user = _auth.currentUser;

//     UserModel userModel = UserModel();

//     // writing all the values
//     userModel.email = user!.email;
//     userModel.uid = user.uid;
//     userModel.firstName = firstNameEditingController.text;
//     userModel.secondName = secondNameEditingController.text;
//     userModel.phone=phoneEditingController.text;
//     userModel.select=selectEditingController.text;

//     await firebaseFirestore
//         .collection("techer")
//         .doc(user.uid)
//         .set(userModel.toMap());
//    // Fluttertoast.showToast(msg: "Account created successfully :) "
//    // );

//     // Navigator.pushAndRemoveUntil(
//     //     (context),
//     //     MaterialPageRoute(builder: (context) => HomeScreen()),
//     //     (route) => false);
//   }
// }








// class UserModel {
//   String? uid;
//   String? email;
//   String? firstName;
//   String? secondName;
//   String? phone;
//   String? select;

  

//   UserModel({this.uid, this.email, this.firstName, this.secondName,this.phone,this.select});

//   // receiving data from server
//   factory UserModel.fromMap(map) {
//     return UserModel(
//       uid: map['uid'],
//       email: map['email'],
//       firstName: map['firstName'],
//       secondName: map['secondName'],
//       phone: map['phone'],
//       select: map['select']
//     );
//   }
  
 

//   // sending data to our server
//   Map<String, dynamic> toMap() {
//     return {
//       'uid': uid,
//       'email': email,
//       'firstName': firstName,
//       'secondName': secondName,
//       'phone':phone,
//       'select':select
//     };
//   }
// }



