// //import 'dart:async';

// // import 'package:app_gdradution/homes.dart';
// // //import 'package:app_gdradution/reg.dart';
// // import 'package:firebase_core/firebase_core.dart';

// // import 'package:flutter/material.dart';

// // Future<void> main() async {
// //  WidgetsFlutterBinding.ensureInitialized() ;
// // await Firebase.initializeApp();

// // // // if(kIsWeb){
// //  //await Firebase.initializeApp(options: FirebaseOptions(apiKey: "AIzaSyATkTzLWCJtFn-YybZj8DwWA0CwgHMZsbw", appId: "1:422231480438:web:99232a1612feb06b59e757", messagingSenderId: "422231480438", projectId: "uhd-project-9fd05"));
// // // // }
// // //  //await Firebase.initializeApp();
// // runApp(MyApp());}

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graduation_app/firebase_options.dart';

//import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  _initializeFirebase();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
// );
// FirebaseAppCheck firebaseAppCheck
// = FirebaseAppCheck.getInstance(); firebaseAppCheck.installAppCheckProviderFactory( SafetyNet AppCheckProviderFactory.getInstance());

//.then((FirebaseApp value) => Get.put(AuthenticationRepository()))
  //await Firebase.initializeApp(options:DefaultFirebaseOption.currentPlatform).then((value) => null);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        //Rigister_Teacher()
        //  SignUpPage()
        //WelcomeScreen()
        //HomePage()

        //RegisterScreen1()
        //MyPhones()
        //LoginScreen1()

        //LoginPage2()
        // MyPhones1()
        //splsahe()
        //MyPhones()
        //LoginScreen1()

        //DropdownExample()

        );
  }
}

_initializeFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (context) =>RegisterationAuthProvider() ,),
//       ],
//       child: MaterialApp(
//         title: 'Login App',
//         home:RegistrationScreen()
//       ),
//     );
//   }
// }

// import 'package:app_gdradution/helper/helper_function.dart';
// import 'package:app_gdradution/pages/auth/login_page.dart';
// import 'package:app_gdradution/pages/home_page.dart';
// import 'package:app_gdradution/shared/constants.dart';

// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/foundation.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   if (kIsWeb) {
//     await Firebase.initializeApp(
//         options: FirebaseOptions(
//             apiKey: Constants.apiKey,
//             appId: Constants.appId,
//             messagingSenderId: Constants.messagingSenderId,
//             projectId: Constants.projectId));
//   } else {
//     await Firebase.initializeApp();
//   }

//   runApp(const MyApp());
// }

// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   bool _isSignedIn = false;

//   @override
//   void initState() {
//     super.initState();
//     getUserLoggedInStatus();
//   }

//   getUserLoggedInStatus() async {
//     await HelperFunctions.getUserLoggedInStatus().then((value) {
//       if (value != null) {
//         setState(() {
//           _isSignedIn = value;
//         });
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//           primaryColor: Constants().primaryColor,
//           scaffoldBackgroundColor: Colors.white),
//       debugShowCheckedModeBanner: false,
//       home: _isSignedIn ? const HomePage() : const LoginPage1(),
//     );
//   }
// }
