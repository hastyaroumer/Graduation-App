import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:graduation_app/Home.dart';
import 'package:graduation_app/Service.dart';
import 'package:graduation_app/Splash.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _ShowPassword = true;
  bool _ShowError = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final DataService _dataService = DataService();
  Future<void> _login() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Home(Email: _emailController.text),
          ));

      setState(() {
        _ShowError = true;
      });
    } catch (error) {
      setState(() {
        _ShowError = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade900,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 400,
              width: 400,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                    image: AssetImage('assets/images/Logo.png'),
                  )),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 1.7,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)),
                color: Colors.white,
                boxShadow: [BoxShadow(blurRadius: 10)],
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.1,
                    child: TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                          labelText: "ئیمەیڵ",
                          labelStyle: TextStyle(fontSize: 20),
                          filled: true,
                          fillColor: Colors.transparent,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30))),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(height: 8.0),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.1,
                    child: TextField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        labelText: "وشەی نهێنی",
                        labelStyle: TextStyle(fontSize: 20),
                        filled: true,
                        fillColor: Colors.transparent,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _ShowPassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.blue.shade900,
                          ),
                          onPressed: () {
                            setState(() {
                              _ShowPassword = !_ShowPassword;
                            });
                          },
                        ),
                      ),
                      obscureText: _ShowPassword,
                    ),
                  ),
                  _ShowError
                      ? Text(
                          'هەڵەئەک لە ئیمەیڵ و پاسۆردەکەیا هەیە',
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        )
                      : SizedBox(),
                  SizedBox(height: 30),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.5,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: _login,
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
                            'چوونەژوورەوە ',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          Icon(
                            Icons.login,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => splsahe(),
                              ),
                            );
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
          ],
        ),
      ),
    );
  }
}

























































// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';


// class Home extends StatefulWidget {
//   const Home({super.key});

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   TextEditingController _codecontroller = new TextEditingController();
//   String phoneNumber = "", data = "";
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   String smscode = "";

//   _signInWithMobileNumber() async {
//     UserCredential _credential;
//     User user;
//     try {
//       await _auth.verifyPhoneNumber(
//           phoneNumber: '+964' + data.trim(),
//           verificationCompleted: (PhoneAuthCredential authCredential) async {
//             await _auth.signInWithCredential(authCredential).then((value) {
//               Navigator.push(
//                   context, MaterialPageRoute(builder: (context) => Done()));
//             });
//           },
//           verificationFailed: ((error) {
//             print(error);
//           }),
//           codeSent: (String verificationId, [int? forceResendingToken]) {
//             showDialog(
//                 context: context,
//                 barrierDismissible: false,
//                 builder: (context) => AlertDialog(
//                       title: Text("Enter OTP"),
//                       content: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           TextField(
//                             controller: _codecontroller,
//                           )
//                         ],
//                       ),
//                       actions: [
//                         ElevatedButton(
//                             onPressed: () {
//                               FirebaseAuth auth = FirebaseAuth.instance;
//                               smscode = _codecontroller.text;
//                               PhoneAuthCredential _credential =
//                                   PhoneAuthProvider.credential(
//                                       verificationId: verificationId,
//                                       smsCode: smscode);
//                               auth
//                                   .signInWithCredential(_credential)
//                                   .then((result) {
//                                 Navigator.pop(context);
//                                 Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: (context) => Done()));
//                                                             }).catchError((e) {
//                                 print(e);
//                               });
//                             },
//                             child: Text("Done"))
//                       ],
//                     ));
//           },
//           codeAutoRetrievalTimeout: (String verificationId) {
//             verificationId = verificationId;
//           },
//           timeout: Duration(seconds: 45));
//     } catch (e) {}
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       appBar: AppBar(
//         title: Text(
//           "Continue with phone",
//           style: TextStyle(
//             fontSize: 18,
//             fontWeight: FontWeight.bold,
//             color: Colors.black,
//           ),
//         ),
//         backgroundColor: Colors.white,
//         elevation: 0,
//         centerTitle: true,
//       ),
//       body: SafeArea(
//         child: Column(
//           children: <Widget>[
//             Expanded(
//               child: Container(
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                     begin: Alignment.topCenter,
//                     end: Alignment.bottomCenter,
//                     colors: [
//                       Color(0xFFFFFFFF),
//                       Color(0xFFF7F7F7),
//                     ],
//                   ),
//                 ),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     SizedBox(
//                       height: 130,
//                       child: Image.asset('images/holding-phone.png'),
//                     ),
//                     Padding(
//                       padding:
//                           EdgeInsets.symmetric(vertical: 14, horizontal: 64),
//                       child: Text(
//                         "You'll receive a 6 digit code to verify next.",
//                         style: TextStyle(
//                           fontSize: 20,
//                           color: Color(0xFF818181),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Container(
//               height: MediaQuery.of(context).size.height * 0.13,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.all(
//                   Radius.circular(25),
//                 ),
//               ),
//               child: Padding(
//                 padding: EdgeInsets.all(16),
//                 child: Row(
//                   children: <Widget>[
//                     Container(
//                       width: 230,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: <Widget>[
//                           Text(
//                             "Enter your phone",
//                             style: TextStyle(
//                               fontSize: 14,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.grey,
//                             ),
//                           ),
//                           SizedBox(
//                             height: 8,
//                           ),
//                           Text(
//                             phoneNumber,
//                             style: TextStyle(
//                               fontSize: 24,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Expanded(
//                       child: GestureDetector(
//                         onTap: () {
//                           data = phoneNumber;
//                           phoneNumber = "";

//                           setState(() {});

//                           _signInWithMobileNumber();
//                         },
//                         child: Container(
//                           decoration: BoxDecoration(
//                             color: Color(0xFFFFDC3D),
//                             borderRadius: BorderRadius.all(
//                               Radius.circular(15),
//                             ),
//                           ),
//                           child: Center(
//                             child: Text(
//                               "Continue",
//                               style: TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             NumericPad(
//               onNumberSelected: (value) {
//                 setState(() {
//                   if (value != -1) {
//                     phoneNumber = phoneNumber + value.toString();
//                   } else {
//                     phoneNumber =
//                         phoneNumber.substring(0, phoneNumber.length - 1);
//                   }
//                 });
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }















// class Done extends StatefulWidget {
//   const Done({super.key});

//   @override
//   State<Done> createState() => _DoneState();
// }

// class _DoneState extends State<Done> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Done"),),
//     );
//   }
// }














// class NumericPad extends StatelessWidget {
//   final Function(int) onNumberSelected;

//   NumericPad({required this.onNumberSelected});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Color(0xFFF5F4F9),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: <Widget>[
//           Container(
//             height: MediaQuery.of(context).size.height * 0.10,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 buildNumber(1),
//                 buildNumber(2),
//                 buildNumber(3),
//               ],
//             ),
//           ),
//           Container(
//             height: MediaQuery.of(context).size.height * 0.10,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 buildNumber(4),
//                 buildNumber(5),
//                 buildNumber(6),
//               ],
//             ),
//           ),
//           Container(
//             height: MediaQuery.of(context).size.height * 0.10,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 buildNumber(7),
//                 buildNumber(8),
//                 buildNumber(9),
//               ],
//             ),
//           ),
//           Container(
//             height: MediaQuery.of(context).size.height * 0.10,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 buildEmptySpace(),
//                 buildNumber(0),
//                 buildBackspace(),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget buildNumber(int number) {
//     return Expanded(
//       child: GestureDetector(
//         onTap: () {
//           onNumberSelected(number);
//         },
//         child: Padding(
//           padding: EdgeInsets.all(10),
//           child: Container(
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.all(
//                 Radius.circular(15),
//               ),
//             ),
//             child: Center(
//               child: Text(
//                 number.toString(),
//                 style: TextStyle(
//                   fontSize: 28,
//                   fontWeight: FontWeight.bold,
//                   color: Color(0xFF1F1F1F),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget buildBackspace() {
//     return Expanded(
//       child: GestureDetector(
//         onTap: () {
//           onNumberSelected(-1);
//         },
//         child: Padding(
//           padding: EdgeInsets.all(10),
//           child: Container(
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.all(
//                 Radius.circular(15),
//               ),
//             ),
//             child: Center(
//               child: Icon(
//                 Icons.backspace,
//                 size: 28,
//                 color: Color(0xFF1F1F1F),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget buildEmptySpace() {
//     return Expanded(
//       child: Container(),
//     );
//   }
// }