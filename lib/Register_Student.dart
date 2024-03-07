import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gender_picker/source/enums.dart';
import 'package:gender_picker/source/gender_picker.dart';
import 'package:graduation_app/Login_Page.dart';

class Register_Student1 extends StatefulWidget {
  const Register_Student1({super.key});

  @override
  State<Register_Student1> createState() => _RigisterState();
}

class _RigisterState extends State<Register_Student1> {
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
  final TextEditingController College = TextEditingController();
  final TextEditingController Semester = TextEditingController();
  Gender _selectedGender = Gender.Male;
  final Passwordd = TextEditingController();
  final ConPasswordd = TextEditingController();

  Future<void> _insertData(String FNamee, String LNamee, int Mobilee,
      String Emaill, Gender gender, String Password) async {
    try {
      // Create user with email and password
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: Emaill,
        password: Password,
      );

      // Access Firestore collection

      FirebaseFirestore.instance
          .collection('Register_Student')
          .doc(userCredential.user!.email)
          .set({
        'FirstName': FNamee,
        'LastName': LNamee,
        'Email': Emaill,
        'Phone': Mobilee.toString(),
        'Gender': gender.toString().split('.').last,
        'password': Password,
        // 'College':Collegee,
        // 'Sem':Semesterr,
        'Facebook': 'Empty',
        'Instagram': 'Empty',
        'Youtube': 'Empty',
        'Sem': '8',
        'Coolege': 'IT',
      });

      FName.clear();
      LName.clear();
      Email.clear();
      Mobil.clear();
      Passwordd.clear();
      ConPasswordd.clear();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
      print(" register user:");
    } catch (error) {
      print("Failed to register user: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                              image: AssetImage('images/Logo.png')))),
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
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          elevation: 10,
                          primary: Colors.blue.shade900,
                          onPrimary: Colors.white,
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
                        onPressed: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => Register_Teacher()));
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 10,
                          primary: Colors.blue.shade900,
                          onPrimary: Colors.white,
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
                          //       builder: (context) => Register_Taxi(),
                          //     ));
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 10,
                          primary: Colors.blue.shade900,
                          onPrimary: Colors.white,
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
                      'تۆمار کردنی قوتابی',
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
                  height: 550,
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
                          opacityOfGradient: 0.4,
                          padding: const EdgeInsets.all(3),
                          size: 50,
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
                              _insertData(
                                  FName.text,
                                  LName.text,
                                  int.parse(Mobil.text),
                                  Email.text,
                                  _selectedGender,
                                  Passwordd.text);
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.amber.shade700,
                              onPrimary: Colors.white,
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
    );
  }
}
