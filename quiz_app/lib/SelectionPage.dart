import 'package:flutter/material.dart';
import 'package:quiz_app/LoadJsonPage.dart';

class SelectionScreen extends StatefulWidget {
  final lang;
  SelectionScreen(this.lang);

  @override
  State<SelectionScreen> createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {
  bool showItems = false;

  @override
  Widget build(BuildContext context) {
    print(widget.lang);
    return Scaffold(
        appBar: AppBar(title: Text("Select Your Topic in ${widget.lang}")),
        body: Column(
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  showItems = !showItems;
                  
                });
                
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => LoadJsonScreen(lang)));
              },
              child: ListTile(
                leading: Text(
                  "1",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                title: Text(
                  "Introduction",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                trailing: Icon(
                  Icons.keyboard_arrow_right,
                  size: 40,
                  color: Colors.black,
                ),
              ),
            ),
            showItems
                ? Container(
                    margin: EdgeInsets.only(left: 80),
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: [
                        Text("Data Type",
                            style: TextStyle(
                              fontSize: 22,
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Function",
                            style: TextStyle(
                              fontSize: 22,
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Srtructure",
                            style: TextStyle(
                              fontSize: 22,
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Class",
                            style: TextStyle(
                              fontSize: 22,
                            )),
                      ],
                    ),
                  )
                : Container(),
            InkWell(
              onTap: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => LoadJsonScreen(lang)));
              },
              child: ListTile(
                leading: Text(
                  "2",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                title: Text(
                  "About",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                trailing: Icon(
                  Icons.keyboard_arrow_right,
                  size: 30,
                ),
              ),
            ),
          ],
        ));
  }
}
