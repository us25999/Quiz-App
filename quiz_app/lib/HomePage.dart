// ignore_for_file: missing_return

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quiz_app/LoadJsonPage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // height: MediaQuery.of(context).size.height,
        color: Colors.grey[900],

        child: Image.asset(
          "assets/STRATUS.jpeg",
          // fit: BoxFit.fitHeight,
          height: MediaQuery.of(context).size.height,
        ),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController nameController = TextEditingController();
  String name = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(

      //   title: Text("STRATUS"),
      //   automaticallyImplyLeading: false,
      //   centerTitle: true,
      // ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.blueGrey, Colors.green, Colors.grey],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        // margin: EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 30),
                Text(
                  "STRATUS APP",
                  style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,),
                ),
                SizedBox(height: 30),
                Text(
                  "Earning With Learning",
                  style: TextStyle(fontSize: 30),
                ),
                Text(
                  "Gain knowledge and Earn money",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 50),
                Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Enter Your Name",
                          style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,),
                        ),
                        SizedBox(height: 10),
                        TextField(
                          controller: nameController,
                          decoration:
                              InputDecoration(hintText: "enter your Name"),
                        ),
                        SizedBox(height: 40),
                        Text(
                          "Enter Your Age",
                          style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,),
                        ),
                        SizedBox(height: 10),
                        TextField(
                          
                          decoration:
                              InputDecoration(hintText: "enter your Age"),
                        ),
                        SizedBox(height: 40),
                        MaterialButton(
                          minWidth: MediaQuery.of(context).size.width,
                          height: 50,
                          color: Colors.green[300],
                          onPressed: () {
                            name = nameController.text;
                            if (name != "") {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoadJsonScreen(name)));
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  content: Text(
                                      "The Name field should not be empty.Please Enter your name")));
                            }
                          },
                          child: Text(
                            "Start Quiz",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                    "Give correct answer,Collect Coins and Earn Money 50 coins will be given for a correct answer.When you will collect 5000 coins You will be awarded ")
              ],
            ),
          ),
        ),
      ),
    );
  }
}






























































































































































































































































































// import 'package:flutter/material.dart';
// import 'package:quiz_app/LoadJsonPage.dart';
// import 'package:quiz_app/SelectionPage.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({Key key}) : super(key: key);

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         backgroundColor: Colors.grey,
//         title: Text(
//           "Select Languages",
//           style: TextStyle(color: Colors.black),
//         ),
//       ),
//       backgroundColor: Colors.white,
//       body: ListView(
//         children: [
//           CustomCard(
//             context,
//             "C",
//             "images/c_logo.png",
//             Colors.blue[400],
//             "C++ is a general-purpose programming language that was developed as an enhancement of the C language to include object-oriented paradigm. It is an imperative and a compiled language. ",
//           ),
//           CustomCard(
//             context,
//             "C++",
//             "images/c++_logo.png",
//             Colors.red[200],
//             "C++ is a general-purpose programming language that was developed as an enhancement of the C language to include object-oriented paradigm. It is an imperative and a compiled language. ",
//           ),
//           CustomCard(
//             context,
//             "Java",
//             "images/java.png",
//             Colors.pink[200],
//             "Java is a high-level, class-based, object-oriented programming language that is designed to have as few implementation dependencies as possible. ",
//           ),
//           CustomCard(
//             context,
//             "Python",
//             "images/python_logo.png",
//             Colors.orange[200],
//             "Python is an interpreted high-level general-purpose programming language. Python's design philosophy emphasizes code readability with its notable use of significant indentation.",
//           ),
//         ],
//       ),
//     );
//   }
// }

// Widget CustomCard(
//     BuildContext context, String lang, String logo, Color color, String des) {
//   return InkWell(
//     onTap: () {
//       print(lang);
//       Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => LoadJsonScreen(lang),
//           ));
//     },
//     child: Padding(
//       padding: const EdgeInsets.all(15.0),
//       child: Material(
//         elevation: 20,
//         color: color,
//         borderRadius: BorderRadius.circular(20),
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Container(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Text(
//                   lang,
//                   style: TextStyle(
//                     fontSize: 40,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 10),
//                 CircleAvatar(
//                   backgroundColor: Colors.white70,
//                   radius: 80,
//                   child: Image.asset(
//                     logo,
//                     width: 130,
//                     height: 130,
//                   ),
//                 ),
//                 SizedBox(height: 15),
//                 Text(
//                   des,
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     ),
//   );
// }
