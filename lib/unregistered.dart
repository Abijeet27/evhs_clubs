import 'main.dart';
import 'package:firebase_auth/firebase_auth.dart' as Auth;
import 'my_app_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:audioplayers/audioplayers.dart';

var lists = [];
var player = AudioPlayer();
var x = lists.length;
var page5context;
List<Widget> app = [];

class Unregistred extends StatefulWidget {
  const Unregistred({super.key});

  @override
  State<Unregistred> createState() => _UnregistredState();
}


class _UnregistredState extends State<Unregistred> {
  
  Auth.FirebaseAuth auth = Auth.FirebaseAuth.instance;
  var first_loading_page_5 = true;

  var link1;
  var link2;
  var link3;
  var link4;
  List<Widget> tileList = [];
  List<Widget> newList = [];
  
  var loading = false;
  @override
  Widget build(BuildContext context) {
    var myApp = context.watch<MyAppState>();
    var firstP5 = true;
    List<Widget> tile() {
      List<Widget> tileList = [];
      myApp.resetUser();
      var len = myApp.length();
      ShapeBorder shape = BoxBorder.all();
      if (myApp.user?.email == "admin@gmail.com" && firstP5) {
        firstP5 = false;
        var name = "";
        var pres = "";
        var vp = "";
        var secretary = "";
        var treasurer = "";
        var Epres = "";
        var Evp = "";
        var Esecretary = "";
        var Etreasurer = "";
        var Ename = "";
        var link1_ = "";
        var link2_ = "";
        var link3_ = "";
        var link4_ = "";
        newList.add(
          ElevatedButton(
            child: Text("Add New Club"),
            onPressed: () async {
              showDialog<void>(
                context: page5context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: ListView(
                      children: [
                        TextField(
                          decoration: InputDecoration(hintText: "Club Name"),
                          onChanged: (value) {
                            name = value;
                          },
                        ),
                        TextField(
                          decoration: InputDecoration(
                            hintText: "Club President",
                          ),
                          onChanged: (value) {
                            pres = value;
                          },
                        ),
                        TextField(
                          decoration: InputDecoration(hintText: "Club Email"),
                          onChanged: (value) {
                            Ename = value;
                          },
                        ),
                        TextField(
                          decoration: InputDecoration(
                            hintText: "President Email",
                          ),
                          onChanged: (value) {
                            Epres = value;
                          },
                        ),
                        TextField(
                          decoration: InputDecoration(
                            hintText: "Club Vice President",
                          ),
                          onChanged: (value) {
                            vp = value;
                          },
                        ),
                        TextField(
                          decoration: InputDecoration(
                            hintText: "Vice President Email",
                          ),
                          onChanged: (value) {
                            Evp = value;
                          },
                        ),
                        TextField(
                          decoration: InputDecoration(
                            hintText: "Club Secretary",
                          ),
                          onChanged: (value) {
                            secretary = value;
                          },
                        ),
                        TextField(
                          decoration: InputDecoration(
                            hintText: "Secretary Email",
                          ),
                          onChanged: (value) {
                            Esecretary = value;
                          },
                        ),
                        TextField(
                          decoration: InputDecoration(
                            hintText: "Club Treasurer",
                          ),
                          onChanged: (value) {
                            treasurer = value;
                          },
                        ),
                        TextField(
                          decoration: InputDecoration(
                            hintText: "Treasurer Email",
                          ),
                          onChanged: (value) {
                            Etreasurer = value;
                          },
                        ),
                        TextField(
                          decoration: InputDecoration(
                            hintText: "Social Media Link 1",
                          ),
                          onChanged: (value) {
                            link1_ = value;
                          },
                        ),
                        TextField(
                          decoration: InputDecoration(
                            hintText: "Social Media Link 2",
                          ),
                          onChanged: (value) {
                            link2_ = value;
                          },
                        ),
                        TextField(
                          decoration: InputDecoration(
                            hintText: "Social Media Link 3",
                          ),
                          onChanged: (value) {
                            link3_ = value;
                          },
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            var refLength = myApp.length();
                            Navigator.of(context).pop();
                            master_database[refLength]["Club Name"] = name;
                            master_database[refLength]["President"] = pres;
                            master_database[refLength]["Vice President"] = vp;
                            master_database[refLength]["Secretary"] = secretary;
                            master_database[refLength]["Treasurer"] = treasurer;
                            master_database[refLength]["President Email"] = Epres;
                            master_database[refLength]["Treasurer Email"] = Etreasurer;
                            master_database[refLength]["Vice President Email"] = Evp;
                            master_database[refLength]["Secretary Email"] = Esecretary;
                            master_database[refLength]["Club Email"] = Ename;
                            master_database[refLength]["link1"] = link1_;
                            master_database[refLength]["link2"] = link2_;
                            master_database[refLength]["link3"] = link3_;
                            master_database[refLength]["link4"] = link4_;
                            Navigator.of(context).pop();
                            first_loading_page_5= true;
                            setState(() {tileList = newList;});
                          },
                          child: Text("Save and Close"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text("Back"),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        );
      }
      for (var j = 0; j < len; j++) {
        var num = j;
        var club = master_database[j.toString()];
        
        if (club["link1"] != null) {
          link1 = club["link1"];
        } else {
          print("1");
          link1 = "";
        }
        if (club["link2"] != null) {
          link2 = club["link2"];
        } else {
          print("2");
          link2 = "";
        }
        if (club["link3"] != null) {
          link3 = club["link3"];
        } else {
          print("3");
          link3 = "";
        }
        if (club["link4"] != null) {
          link4 = club["link4"];
        } else {
          print("4");
          link4 = "";
        }
        var email2 = myApp.user?.email.toString().split("@")[0];
        if (!club["registry"].keys.contains(email2) & 
              !(myApp.user?.email == club["Pres Email"] ||
              myApp.user?.email == club["VP Email"] ||
              myApp.user?.email == club["Sec Email"] ||
              myApp.user?.email == club["Treas Email"]||
              myApp.user?.email == club["Advisor Email"] ||
              myApp.user?.email == club["Public Relations Email"] ||
              myApp.user?.email == club["Marketing Director Email"] ||
              myApp.user?.email == club["Events Coordinator Email"] ||
              myApp.user?.email == club["Public Relations 2 Email"] ||
              myApp.user?.email == club["Marketing Director 2 Email"] ||
              myApp.user?.email == club["Events Coordinator 2 Email"]||
              myApp.user?.email == club["President 2 Email"]||
              myApp.user?.email == club["Vice President 2 Email"]|| 
              myApp.user?.email == club["Treasurer 2 Email"]||
              myApp.user?.email == club["Secretary 2 Email"]||
              myApp.user?.email == club["Advisor 2 Email"])) {
            newList.add(
              SizedBox(
                height: 230,
                child: Card(
                  shape: shape,
                  color: Color.fromARGB(217, 27, 195, 237),
                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        Text(
                          textAlign: TextAlign.center,
                          club["Club Name"],
                        ),
                        SizedBox(height: 10),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              textAlign: TextAlign.center,
                              "President: ${club["President"]}",
                            ),
                            Text(
                              textAlign: TextAlign.center,
                              "Vice President: ${club["Vice President"]}",
                            ),
                            Text(
                              textAlign: TextAlign.center,
                              "Treasurer: ${club["Treasurer"]}",
                            ),
                            Text(
                              textAlign: TextAlign.center,
                              "Secretary ${club["Secretary"]}",
                            ),
                            Text(
                              textAlign: TextAlign.center,
                              "Advisor(s) ${club["Advisor"]}",
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () async {
                            showDialog<void>(
                              context: page5context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  content: ListView(
                                    children: [
                                      Text(
                                        "Discord: ${club["link1"]}"
                                      ),
                                      Text(
                                        "Instagram: ${club["link2"]}"
                                      ),
                                      Text(
                                        "Facebook: ${club["link3"]}"
                                      ),
                                      Text(
                                        "Other: ${club["link4"]}"
                                      ),
                                      SizedBox(height: 100),
                                      Text(
                                        club["Mission Statement"]
                                      ),
                                    ],
                                  ),
                                  actions: [
                                    ElevatedButton(
                                      onPressed: (){
                                        myApp.register(num);
                                        Navigator.of(context).pop();
                                        first_loading_page_5= true;
                                        setState(() {tileList = newList;});
                                      },
                                      child: Text("Register"),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text("Back"),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: Text("Register"),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
      }
      return newList;
    }

    wait(){
      print("started");
      Future.delayed(Duration(seconds:2));
      setState(() {
        tileList = [
          SizedBox(height: 200),
          LoadingAnimationWidget.inkDrop(
            color: Color.fromARGB(217, 27, 195, 237),
            size: 100,
          ),
          SizedBox(height: 100),
          Text(textAlign: TextAlign.center, "DO NOT LEAVE THIS PAGE UNLESS IT LOADS FOR OVER A MINUTE")
        ];
      });
      newList = tile();
      print("tileList: ${newList.toString()}");
      setState(() {
        print("reloading");
        tileList = newList;
      });
    }

    if (first_loading_page_5) {
      print("are waiting");
      first_loading_page_5= false;
      wait();
    }
    else{
      tileList = newList;
    }
    page5context = context;
    return  Scaffold(
        backgroundColor: Color.fromARGB(255, 212, 176, 62),
        appBar: AppBar(title: Text("Unregistered Clubs"), backgroundColor: Color.fromARGB(255, 212, 176, 62)),
        body: RefreshIndicator(
          child: ListView(children: tileList),
          onRefresh: () async {
            wait();
          },
        ),
    );
  }
}
