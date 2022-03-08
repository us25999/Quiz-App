// import 'package:audioplayers/audioplayers.dart';
import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:quiz_app/HomePage.dart';
import 'package:quiz_app/ResultPage.dart';
import 'package:vibrate/vibrate.dart';

class LoadJsonScreen extends StatelessWidget {
  final name;
  LoadJsonScreen(this.name);
  // const LoadJsonScreen({Key key}) : super(key: key);
  // String loadAsset;
  // setasset() {
  //   print(lang);
  //   if (lang == "C") {
  //     loadAsset = "assets/c.json";
  //   } else if (lang == "C++") {
  //     loadAsset = "assets/cpp.json";
  //   } else if (lang == "Java") {
  //     loadAsset = "assets/java.json";
  //   } else {
  //     loadAsset = "assets/python.json";
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return Scaffold(
      body: FutureBuilder(
        future: DefaultAssetBundle.of(context).loadString("assets/python.json"),
        builder: (context, snapshot) {
          List mydata = json.decode(snapshot.data.toString());
          if (mydata == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return QuizScreen(mydata, name);
          }
        },
      ),
    );
  }
}

class QuizScreen extends StatefulWidget {
  // QuizScreen({
  //   Key key,
  //   @required this.mydata,
  //   @required this.name,
  // }) : super(key: key);
  QuizScreen(this.mydata, this.name);
  final mydata;
  final name;
  @override
  _QuizScreenState createState() => _QuizScreenState(mydata, name);
}

class _QuizScreenState extends State<QuizScreen> {
  List mydata;
  final name;
  _QuizScreenState(this.mydata, this.name);

  int marks = 0;
  int timer = 20;
  String showTimer = "20";
  bool cancelTimer = false;
  Color colorShow = Colors.indigoAccent;
  Color right = Colors.green;
  Color wrong = Colors.red;
  Map<String, Color> btnColor = {
    "a": Colors.cyan,
    "b": Colors.cyan,
    "c": Colors.cyan,
    "d": Colors.cyan
  };
  int i = 1;
  // final AudioCache sound = new AudioCache();

  void nextQuestion() {
    cancelTimer = false;
    timer = 20;
    if (!mounted) return;

    setState(() {
      if (i <= 100) {
        i += 1;
      } else {
        cancelTimer = true;
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => ResultScreen(marks, name)));
      }
      btnColor["a"] = Colors.cyan;
      btnColor["b"] = Colors.cyan;
      btnColor["c"] = Colors.cyan;
      btnColor["d"] = Colors.cyan;
    });
    startTimer();
  }

  // void play() async {
  //   await sound.play("assets/beep.mp3");
  // }

  @override
  void initState() {
    // TODO: implement initState
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
    cancelTimer = true;
    startTimer();
  }

  void CheckAnswer(String k) {
    if (mydata[2][i.toString()] == mydata[1][i.toString()][k]) {
      marks += 50;
      colorShow = right;
      // play();
    } else {
      colorShow = wrong;
      Vibrate.vibrate();
    }
    setState(() {
      btnColor[k] = colorShow;
    });
  }

  void startTimer() async {
    const oneSec = Duration(seconds: 1);
    Timer.periodic(oneSec, (t) {
      if (!mounted) return;
      setState(() {
        if (timer < 1) {
          t.cancel();
          nextQuestion();
        } else if (cancelTimer) {
          t.cancel();
        } else {
          timer = timer - 1;
        }
        showTimer = timer.toString();
      });
    });
  }

  Widget ChoiceButton(String k) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: MaterialButton(
        onPressed: () => CheckAnswer(k),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            mydata[1][i.toString()][k],
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        color: btnColor[k],
        splashColor: Colors.cyan[700],
        highlightColor: Colors.cyan[700],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        minWidth: MediaQuery.of(context).size.width - 100,
        height: 45,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                title: Center(child: Text("Exit Quiz ??")),
                content: Text(
                    "Are you sure to exit the quiz.You will lost 100 coins."),
                actionsAlignment: MainAxisAlignment.spaceAround,
                // actionsPadding: EdgeInsets.only(bottom: 10),
                contentPadding: EdgeInsets.only(left: 15, top: 15, right: 15),
                actions: [
                  MaterialButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "No",
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      )),
                  MaterialButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()));
                      },
                      child: Text(
                        "Yes",
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      )),
                ],
              );
            });
      },
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.blueGrey, Colors.green, Colors.grey],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
          // margin: EdgeInsets.only(left:20,right: 20,bottom: 20,top: 80),
          // color: Colors.grey[300],
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "$i/101",
                              style: TextStyle(fontSize: 17),
                            ),
                            Row(
                              children: [
                                Icon(Icons.timer),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "$showTimer sec",
                                  style: TextStyle(fontSize: 17),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Divider(
                          color: Colors.black,
                          thickness: 1,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          // padding:
                          //     const EdgeInsets.only(left: 20, right: 20),
                          // alignment: Alignment.bottomLeft,
                          child: Text(
                            mydata[0][i.toString()],
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w900),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 6,
                child: Container(
                  child: SingleChildScrollView(
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ChoiceButton("a"),
                        ChoiceButton("b"),
                        ChoiceButton("c"),
                        ChoiceButton("d"),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  // alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          color: Colors.red,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text("Quit",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16)),
                          ),
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    title: Center(child: Text("Exit Quiz ??")),
                                    content: Text(
                                        "Are you sure to exit the quiz.You will lost 100 coins."),
                                    actionsAlignment:
                                        MainAxisAlignment.spaceAround,
                                    // actionsPadding: EdgeInsets.only(bottom: 10),
                                    contentPadding: EdgeInsets.only(
                                        left: 15, top: 15, right: 15),
                                    actions: [
                                      MaterialButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            "No",
                                            style: TextStyle(
                                                color: Colors.blue,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16),
                                          )),
                                      MaterialButton(
                                          onPressed: () {
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        HomeScreen()));
                                          },
                                          child: Text(
                                            "Yes",
                                            style: TextStyle(
                                                color: Colors.blue,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16),
                                          )),
                                    ],
                                  );
                                });
                          },
                        ),
                        MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            color: Colors.green,
                            child: Padding(
                              padding: const EdgeInsets.all(11),
                              child: Text(
                                "Show Result",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ResultScreen(marks, name)));
                            }),
                        MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          color: Colors.purple,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              "Next",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                          onPressed: () {
                            cancelTimer = true;
                            Timer(Duration(seconds: 1), () {
                              nextQuestion();
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
