
import 'dart:collection';

import 'package:firebase_database/firebase_database.dart'
    show DataSnapshot, DatabaseReference, FirebaseDatabase;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'SignUp.dart';
import 'my_app_state.dart';
import 'package:provider/provider.dart';
import 'package:firebase_database/firebase_database.dart';

import 'firebase_options.dart' show DefaultFirebaseOptions;
DatabaseReference ref = FirebaseDatabase.instance.ref();

HashMap<dynamic, dynamic> master_database = HashMap();
void main() async{
  
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  DatabaseReference ref = FirebaseDatabase.instance.ref();
  DataSnapshot snapshot= await ref.get();
  if(snapshot.exists){
    master_database = HashMap.from(snapshot.value as Map);
    print("Data loaded successfully");
    print(master_database.toString());
  }
  MyAppState().resetUser();

  
  String data ="";
  runApp(MyApp());
  
}
var name = "";
var page2context;
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: SignUp(),
      ),
    );
  }
}
var selectedIndex = 0;
var usernames = [];
var descs = [];
var x = 0;
var rows = [
  Row(
    children: []
    ),
];