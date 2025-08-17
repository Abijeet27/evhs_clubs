import 'dart:math';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as Auth show FirebaseAuth;
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'main.dart';
import 'my_home_page.dart';
import 'package:intl/intl.dart';

class MyAppState extends ChangeNotifier {
  Auth.FirebaseAuth auth = Auth.FirebaseAuth.instance;
  var user;
  void resetUser(){
     user = auth.currentUser;
  }
  var email;
  List<Widget> registerList = [];
  var loading = false;
  String link1="";
  String link2="";
  String link3="";
  List<Widget> tileList = [];
  String data = "";
  var name;
  var desc = Text("");
  var pfp;
  var index = 0;
  var counter = 0;
  
  double randred = 0;
  double randgreen = 0;
  double randblue = 0;
  double randAlpha = 0;
  var colors = Color.fromARGB(100, 227, 30, 8);
  
  void doSomething(){
    counter++;
    if (counter >= 10){
      randred = Random().nextDouble()*255;
      randblue = Random().nextDouble()*255;
      randgreen = Random().nextDouble()*255;
      randAlpha = Random().nextDouble()*100;
      colors = Color.from(alpha:randAlpha, red: randred, green: randgreen, blue: randblue);
    }
    notifyListeners();
  }
  void append(){
    var length1 = rows.length - 1;
    var key1 = ValueKey(0);
    var text = usernames[index];
    var box = ElevatedButton(
      onPressed:(){ 
        name = text;
        for(int i = 0; i < usernames.length; i++){
          if (usernames[i] == text){
            desc = descs[i];
          }
        }
        selectedIndex = 3;
        Navigator.push(page2context, CupertinoPageRoute(builder:(context) => MyHomePage()));
        notifyListeners();
        }, 
      child: text,
    );
    print(usernames.toString());
    if (rows[length1].children.length == 1 || rows[length1].children.isEmpty){
      rows[length1].children.add(box);
    }
    else if (rows[length1].children.length == 2){
      rows.add(Row(children:[box]));
      print("no");
    }
    notifyListeners();
    index++;
  }
  var club;

  void register(var num){
    var time = DateTime.now().toLocal();
    var  format = DateFormat('yyyy-mm-dd');
    String date = format.format(time);
    print(num);
    resetUser();
    var email2 = user?.email.toString().split("@")[0];
    email = user?.email;
    var registry = master_database[num.toString()]["registry"];
    registry.addAll({
      email2: {
        "date": date,
        "email": email,
      }
    });
  } 
  int length() {
    return master_database.length - 1;
  }
  }