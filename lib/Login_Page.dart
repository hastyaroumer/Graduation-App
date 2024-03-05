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
        _ShowError = false;
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
      backgroundColor: Colors.blue.shade900.withOpacity(0.7),
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
                    image: AssetImage('images/Logo.png'),
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
