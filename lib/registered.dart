import 'package:flutter/material.dart';
import 'main.dart';
import 'my_app_state.dart';
import 'package:provider/provider.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

List<Widget> newList2 = [];
class Registered extends StatefulWidget {
  const Registered({super.key});

  @override
  State<Registered> createState() => _RegisteredState();
}

class _RegisteredState extends State<Registered> {
  List<Widget> newList2 = [];
  var first_loading = true;
  @override
  Widget build(BuildContext context) {
    page2context = context;
    var myApp = context.watch<MyAppState>();
    myApp.resetUser();    
    List<Widget> registerList = [];
    void unregister(var num){
      var email2 = myApp.user?.email.toString().split("@")[0];
      dynamic registry = master_database[num.toString()]["registry"];
      registry.remove(email2);
    }

    List<Widget> tileRegister(){
      var len = myApp.length();
      registerList = [];
      var email2 = myApp.user?.email.toString().split("@")[0];
      for (var j = 0; j < len; j++) {
        print(j);
        ShapeBorder shape = BoxBorder.all();
        var club = master_database[j.toString()];
        if (master_database[j.toString()]["registry"].keys.contains(email2)) {
          registerList.add(
            SizedBox(
              height: 230,
              child: Card(
                shape: shape,
                color: Color.fromARGB(217, 27, 195, 237),
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      Text(textAlign: TextAlign.center, club["Club Name"]),
                      SizedBox(height: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            textAlign: TextAlign.center,
                            club["President"],
                          ),
                          Text( 
                            textAlign: TextAlign.center,
                            club["Vice President"],
                          ),
                          Text(
                            textAlign: TextAlign.center,
                            club["Treasurer"],
                          ),
                          Text(
                            textAlign: TextAlign.center,
                            club["Secretary"],
                          ),
                          SizedBox(height: 10),
                          ElevatedButton(
                            child: Text("Unregister"),
                            onPressed: () async {
                              return showDialog<void>(
                                context: context,
                                builder: (BuildContext context) {
                                return AlertDialog(
                                  content: ListView(
                                    children: [
                                      Text(
                                        "Are you sure you want to unregister from this club",
                                      ),
                                      SizedBox(height: 100),
                                      ElevatedButton(
                                        onPressed: () async {
                                          Navigator.of(context).pop();
                                          unregister(j);
                                          first_loading = true;
                                          setState((){newList2 = registerList;});
                                        },
                                        child: Text("unregister"),
                                      ),
                                    ],
                                  ),
                                );
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
          
        }
      }
      return registerList;
    }

    print(registerList);
    wait() {
      print("started");
      setState(() {
        newList2 = [
          SizedBox(height: 200),
          LoadingAnimationWidget.inkDrop(
            color: Color.fromARGB(217, 27, 195, 237),
            size: 100,
          ),
          SizedBox(height: 100),
          Text(textAlign: TextAlign.center, "DO NOT LEAVE THIS PAGE UNLESS IT LOADS FOR OVER A MINUTE")
        ];
      });
      registerList = tileRegister();
      print("tileList: ${newList2.toString()}");
      setState((){newList2 = registerList;});
    }
    if (first_loading){
      first_loading = false;
      wait();
    }
       return Scaffold(
      appBar: AppBar(
        title: Text("Registered clubs"),
        backgroundColor:Color.fromARGB(255, 212, 176, 62)),
      backgroundColor: Color.fromARGB(255, 212, 176, 62),
      body: Center(
        child: RefreshIndicator(
          onRefresh: () async {
            setState(() {
              wait();
            });
          },
          child: ListView(children: newList2),
        ),
      ),
    );
  }
}
