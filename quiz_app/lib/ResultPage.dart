import 'package:flutter/material.dart';
import 'package:quiz_app/HomePage.dart';

class ResultScreen extends StatefulWidget {
  // ResultScreen({Key key, @required this.marks, @required this.name})
  //     : super(key: key);
  ResultScreen(this.marks, this.name);
  final marks, name;
  @override
  _ResultScreenState createState() => _ResultScreenState(marks, name);
}

class _ResultScreenState extends State<ResultScreen> {
  final marks;
  final name;
  _ResultScreenState(this.marks, this.name);
  String quote = "";
  String complement = "";
  String emoji = "";

  void ComplementFunction() {
    if (marks >= 0 && marks < 1000) {
      complement = "Good";
      emoji = "🙁";
    } else if (marks >= 1000 && marks < 2000) {
      complement = "Great";
      emoji = "🙂";
    } else if (marks >= 2000 && marks < 3000) {
      complement = "Superb";
      emoji = "🤟";
    } else if (marks >= 3000 && marks < 4000) {
      complement = "Amazing";
      emoji = "😮";
    } else {
      complement = "Fantastic";
      emoji = "👌";
    }
  }

  void QuoteFunction() {
    if (marks >= 0 && marks < 500) {
      quote = "";
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ComplementFunction();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.blueGrey, Colors.green, Colors.grey],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Text(
                "$complement\  $name",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(emoji,
                  style: TextStyle(color: Colors.yellow, fontSize: 100)),
              SizedBox(
                height: 30,
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                shadowColor: Colors.black,
                elevation: 10,
                color: Colors.orange[300],
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("You have collected $marks coins",
                  
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                "Solve More Questions and collect coins If you collect 5000 coins You will be awarded.Gain knowledge and Earn Money from STRATUS app",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 100,
              ),
              MaterialButton(
                  minWidth: MediaQuery.of(context).size.width,
                  height: 50,
                  color: Colors.cyan,
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                  child: Text(
                    "Start  Again",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
