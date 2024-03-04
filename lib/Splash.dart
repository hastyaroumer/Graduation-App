import 'dart:async';

import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class splsahe extends StatefulWidget {
  @override
  State<splsahe> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<splsahe>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _animationController.forward();
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => splashScreean(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeTransition(
        opacity: _animation,
        child: Stack(
          children: [
            Image.asset(
              'images/sp2.png',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            Positioned(
              top: MediaQuery.of(context).size.height / 5,
              left: 150,
              child: Image.asset(
                'images/logo.png', // Replace with your logo image
                width: 200,
                height: 200,
              ),
            ),
            Positioned(
              child: Padding(
                padding: EdgeInsets.fromLTRB(70, 370, 190, 0),
                child: LoadingIndicator(
                  indicatorType: Indicator.ballRotateChase,
                  colors: const [
                    Color.fromARGB(255, 230, 186, 28),
                    Color.fromARGB(255, 78, 170, 235),
                  ],
                  strokeWidth: 2,

                  /// Optional, the stroke backgroundColor
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class splashScreean extends StatefulWidget {
  const splashScreean({super.key});

  @override
  State<splashScreean> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<splashScreean> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Image.asset(
          'images/sp2.png',
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        Positioned(
          top: MediaQuery.of(context).size.height / 4,
          left: 100,
          child: Image.asset(
            'images/logo.png', // Replace with your logo image
            width: 200,
            height: 200,
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height / 1.8,
          left: 1,
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Text(
              ' به‌خێربێت بۆ ئه‌پلیكه‌یشنی زانكۆی گه‌شه‌پێدانی مرۆی ',
              style: TextStyle(
                fontFamily: 'kurdi',
                color: Colors.lightBlue,
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height / 1.5,
          child: Text(
            '       بۆزانیاری'
            ' زیاتر به‌رده‌وام بوون هه‌لبژێره‌',
            style: TextStyle(
              fontFamily: 'kurdi',
              color: Colors.lightBlue,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Positioned(
            top: MediaQuery.of(context).size.height / 1.2,
            left: 100,
            child: ElevatedButton(
                style: ButtonStyle(
                    iconSize: MaterialStatePropertyAll(100),
                    backgroundColor: MaterialStatePropertyAll(Colors.amber)),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => splash3(),
                      ));
                },
                child: Text(
                  "به‌رده‌وام بوون",
                  style: TextStyle(
                      fontSize: 30, color: Colors.white, fontFamily: 'kurdy'),
                ))),
      ],
    ));
  }
}

class splash3 extends StatefulWidget {
  const splash3({super.key});

  @override
  State<splash3> createState() => _splash3State();
}

class _splash3State extends State<splash3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Image.asset(
          'images/5.jfif',
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        Positioned(
          top: MediaQuery.of(context).size.height / 6,
          left: 150,
          child: Image.asset(
            'images/Logo.png', // Replace with your logo image
            width: 180,
            height: 180,
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height / 2.3,
          left: 50,
          child: Text(
            ' به‌شی پێویست دیاری بكه‌',
            style: TextStyle(
              fontFamily: 'kurdi',
              color: Colors.lightBlue,
              fontSize: 33,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Positioned(
            top: MediaQuery.of(context).size.height / 1.9,
            left: 100,
            child: ElevatedButton(
                style: ButtonStyle(
                    iconSize: MaterialStatePropertyAll(100),
                    backgroundColor: MaterialStatePropertyAll(Colors.amber)),
                onPressed: () {
                  // Navigator.pushReplacement(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => Register_Student1(),
                  //     ));
                },
                child: Text(
                  " خوێندكار",
                  style: TextStyle(
                      fontSize: 35, color: Colors.white, fontFamily: 'kurdy'),
                ))),
        Positioned(
            top: MediaQuery.of(context).size.height / 1.6,
            left: 110,
            child: ElevatedButton(
                style: ButtonStyle(
                    iconSize: MaterialStatePropertyAll(100),
                    backgroundColor: MaterialStatePropertyAll(Colors.amber)),
                onPressed: () {
                  // Navigator.pushReplacement(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => Register_Teacher(),
                  //     ));
                },
                child: Text(
                  " مامۆستا",
                  style: TextStyle(
                      fontSize: 35, color: Colors.white, fontFamily: 'kurdy'),
                ))),
        Positioned(
            top: MediaQuery.of(context).size.height / 1.4,
            left: 120,
            child: ElevatedButton(
                style: ButtonStyle(
                    iconSize: MaterialStatePropertyAll(100),
                    backgroundColor: MaterialStatePropertyAll(Colors.amber)),
                onPressed: () {
                  // Navigator.pushReplacement(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => Register_Taxi(),
                  //     ));
                },
                child: Text(
                  " ته‌كسی",
                  style: TextStyle(
                      fontSize: 35, color: Colors.white, fontFamily: 'kurdy'),
                ))),
        Positioned(
            top: MediaQuery.of(context).size.height / 1.25,
            left: 120,
            child: ElevatedButton(
                style: ButtonStyle(
                    iconSize: MaterialStatePropertyAll(100),
                    backgroundColor: MaterialStatePropertyAll(Colors.amber)),
                onPressed: () {
                  // Navigator.pushReplacement(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => Register_shuqa(),
                  //     ));
                },
                child: Text(
                  "نوسینگه‌",
                  style: TextStyle(
                      fontSize: 35, color: Colors.white, fontFamily: 'kurdy'),
                ))),
        Positioned(
            top: MediaQuery.of(context).size.height / 1.13,
            left: 130,
            child: TextButton(
                onPressed: () {
                  // Navigator.pushReplacement(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => HomeScreen(),
                  //     ));
                },
                child: Text(
                  " بۆ به‌رده‌وام بوون بێ خۆتۆماركردن",
                  style: TextStyle(
                      fontSize: 20, color: Colors.black, fontFamily: 'kurdy'),
                ))),
        Positioned(
            top: MediaQuery.of(context).size.height / 1.05,
            left: 130,
            child: TextButton(
                onPressed: () {
                  // Navigator.pushReplacement(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => LoginPage(),
                  //     ));
                },
                child: Text(
                  "پێشتر ئه‌كاونتت هه‌بووه‌",
                  style: TextStyle(
                      fontSize: 20, color: Colors.black, fontFamily: 'kurdy'),
                ))),
      ],
    ));
  }
}
