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
  var link1 = "none";
  var link2 = "none";
  var link3 = "none";
  var link4 = "none ";
  var pres = "";
  var vp = "";
  var sec = "";
  var advisor = "";
  var treas = "";
  var pres2 = "";
  var vp2 = "";
  var sec2 = "";
  var treas2 = "";
  var advisor2 = "";
  var pr = "";
  var pr2 = "";
  var md = "";
  var md2 = "";
  var ec = "";
  var ec2 = "";
  var epres2 = "";
  var evp2 = "";
  var esec2 = "";
  var etreas2 = "";
  var eadvisor2 = "";
  var epr2 = "";
  var emd2 = "";
  var eec2 = "";
  var eadvisor = "";
  var epr = "";
  var emd = "";
  var eec = "";
  var epres = "";
  var evp = "";
  var esec = "";
  var etreas = "";
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
        if (myApp.user?.email == club["Pres Email"] ||
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
              myApp.user?.email == club["Advisor 2 Email"] ) {

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
                              "Secretary: ${club["Secretary"]}",
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () async {
                            showDialog<void>(
                              context: page2context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  content: ListView(
                                    children: [
                                      SizedBox(height: 50),
                                      TextFormField(
                                        initialValue: link1,
                                        decoration: InputDecoration(
                                          helperText:
                                              "Discord Link if applicable",
                                        ),
                                        onChanged: (input) async {
                                          link1 = input;
                                        },
                                      ),
                                      Divider(),
                                      SizedBox(height: 50),
                                      TextFormField(
                                        initialValue: link2,
                                        decoration: InputDecoration(
                                          helperText:
                                              "Instagram Link if applicable",
                                        ),
                                        onChanged: (input) async {
                                          link2 = input;
                                        },
                                      ),
                                      Divider(),
                                      SizedBox(height: 50),
                                      TextFormField(
                                        initialValue: link3,
                                        decoration: InputDecoration(
                                          helperText:
                                              "Facebook Link if applicable",
                                        ),
                                        onChanged: (input) async {
                                          link3 = input;
                                        },
                                      ),
                                      Divider(),
                                      SizedBox(height: 50),
                                      TextFormField(
                                        initialValue: link4,
                                        decoration: InputDecoration(
                                          helperText:
                                              "Other Links",
                                        ),
                                        onChanged: (input) async {
                                          link4 = input;
                                        },
                                      ),
                                      Divider(),
                                      SizedBox(height: 50),
                                      TextFormField(
                                        initialValue: club["President"],
                                        decoration: InputDecoration(
                                          helperText:
                                              "President Name",
                                        ),
                                        onChanged: (input) async {
                                          pres = input;
                                        },
                                      ),
                                      Divider(),
                                      SizedBox(height: 50),
                                      TextFormField(
                                        initialValue: club["Pres Email"],
                                        decoration: InputDecoration(
                                          helperText:
                                              "President Email",
                                        ),
                                        onChanged: (input) async {
                                          epres = input;
                                        },
                                      ),
                                      Divider(),
                                      SizedBox(height: 50),
                                      TextFormField(
                                        initialValue: club["Vice President"],
                                        decoration: InputDecoration(
                                          helperText:
                                              "Vice President Name",
                                        ),
                                        onChanged: (input) async {
                                          vp = input;
                                        },
                                      ),
                                      Divider(),
                                      SizedBox(height: 50),
                                      TextFormField(
                                        initialValue: club["VP Email"],
                                        decoration: InputDecoration(
                                          helperText:
                                              "Vice President Email",
                                        ),
                                        onChanged: (input) async {
                                          evp = input;
                                        },
                                      ),
                                      Divider(),
                                      SizedBox(height: 50),
                                      TextFormField(
                                        initialValue: club["Secretary"],
                                        decoration: InputDecoration(
                                          helperText:
                                              "Secretary Name",
                                        ),
                                        onChanged: (input) async {
                                          sec = input;
                                        },
                                      ),
                                      Divider(),
                                      SizedBox(height: 50),
                                      TextFormField(
                                        initialValue: club["Sec Email"],
                                        decoration: InputDecoration(
                                          helperText:
                                              "Secretary Email",
                                        ),
                                        onChanged: (input) async {
                                          esec = input;
                                        },
                                      ),
                                      Divider(),
                                      SizedBox(height: 50),
                                      TextFormField(
                                        initialValue: club["Treasurer"],
                                        decoration: InputDecoration(
                                          helperText:
                                              "Treasurer Name",
                                        ),
                                        onChanged: (input) async {
                                          treas = input;
                                        },
                                      ),
                                      Divider(),
                                      SizedBox(height: 50),
                                      TextFormField(
                                        initialValue: club["Treas Email"],
                                        decoration: InputDecoration(
                                          helperText:
                                              "Treasurer Email",
                                        ),
                                        onChanged: (input) async {
                                          etreas = input;
                                        },
                                      ),
                                      Divider(),
                                      SizedBox(height: 50),
                                      TextFormField(
                                        initialValue: club["Advisor"],
                                        decoration: InputDecoration(
                                          helperText:
                                              "Advisor Name",
                                        ),
                                        onChanged: (input) async {
                                          advisor = input;
                                        },
                                      ),
                                      Divider(),
                                      SizedBox(height: 50),
                                      TextFormField(
                                        initialValue: club["Advisor Email"],
                                        decoration: InputDecoration(
                                          helperText:
                                              "Advisor Email",
                                        ),
                                        onChanged: (input) async {
                                          eadvisor = input;
                                        },
                                      ),
                                      Divider(),
                                      SizedBox(height: 50),
                                      Text("Note: Any info after this will not be reflected in the front page, but will still give the students officer permissions"),
                                      Divider(),
                                      SizedBox(height: 50),
                                      TextFormField(
                                        initialValue: club["President 2"],
                                        decoration: InputDecoration(
                                          helperText:
                                              "President 2 Name",
                                        ),
                                        onChanged: (input) async {
                                          pres2 = input;
                                        },
                                      ),
                                      Divider(),
                                      SizedBox(height: 50),
                                      TextFormField(
                                        initialValue: club["President 2 Email"],
                                        decoration: InputDecoration(
                                          helperText:
                                              "President 2 Email",
                                        ),
                                        onChanged: (input) async {
                                          epres2 = input;
                                        },
                                      ),
                                      Divider(),
                                      SizedBox(height: 50),
                                      TextFormField(
                                        initialValue: club["Vice President 2"],
                                        decoration: InputDecoration(
                                          helperText:
                                              "Vice President 2 Name",
                                        ),
                                        onChanged: (input) async {
                                          vp2 = input;
                                        },
                                      ),
                                      Divider(),
                                      SizedBox(height: 50),
                                      TextFormField(
                                        initialValue: club["Vice President 2 Email"],
                                        decoration: InputDecoration(
                                          helperText:
                                              "Vice President 2 Email",
                                        ),
                                        onChanged: (input) async {
                                          evp2 = input;
                                        },
                                      ),
                                      Divider(),
                                      SizedBox(height: 50),
                                      TextFormField(
                                        initialValue: club["Secretary 2"],
                                        decoration: InputDecoration(
                                          helperText:
                                              "Secretary 2 Name",
                                        ),
                                        onChanged: (input) async {
                                          sec2 = input;
                                        },
                                      ),
                                      Divider(),
                                      SizedBox(height: 50),
                                      TextFormField(
                                        initialValue: club["Secretary 2 Email"],
                                        decoration: InputDecoration(
                                          helperText:
                                              "Secretary 2 Email",
                                        ),
                                        onChanged: (input) async {
                                          esec2 = input;
                                        },
                                      ),
                                      Divider(),
                                      SizedBox(height: 50),
                                      TextFormField(
                                        initialValue: club["Treasurer 2"],
                                        decoration: InputDecoration(
                                          helperText:
                                              "Treasurer 2 Name",
                                        ),
                                        onChanged: (input) async {
                                          treas2 = input;
                                        },
                                      ),
                                      Divider(),
                                      SizedBox(height: 50),
                                      TextFormField(
                                        initialValue: club["Treasurer 2 Email"],
                                        decoration: InputDecoration(
                                          helperText:
                                              "Treasurer 2 Email",
                                        ),
                                        onChanged: (input) async {
                                          etreas2 = input;
                                        },
                                      ),
                                      
                                      Divider(),
                                      SizedBox(height: 50),
                                      TextFormField(
                                        initialValue: club["Public Relations"],
                                        decoration: InputDecoration(
                                          helperText:
                                              "Public Relations Name",
                                        ),
                                        onChanged: (input) async {
                                          link4 = input;
                                        },
                                      ),
                                      Divider(),
                                      SizedBox(height: 50),
                                      TextFormField(
                                        initialValue: club["Public Relations Email"],
                                        decoration: InputDecoration(
                                          helperText:
                                              "Public Relations Email",
                                        ),
                                        onChanged: (input) async {
                                          epr = input;
                                        },
                                      ),
                                      Divider(),
                                      SizedBox(height: 50),
                                      TextFormField(
                                        initialValue: club["Public Relations 2"],
                                        decoration: InputDecoration(
                                          helperText:
                                              "Public Relations 2 Name",
                                        ),
                                        onChanged: (input) async {
                                          pr2 = input;
                                        },
                                      ),
                                      Divider(),
                                      SizedBox(height: 50),
                                      TextFormField(
                                        initialValue: club["Public Relations 2 Email"],
                                        decoration: InputDecoration(
                                          helperText:
                                              "Public Relations 2 Email",
                                        ),
                                        onChanged: (input) async {
                                          epr2 = input;
                                        },
                                      ),
                                      Divider(),
                                      SizedBox(height: 50),
                                      TextFormField(
                                        initialValue: club["Marketing Director"],
                                        decoration: InputDecoration(
                                          helperText:
                                              "Marketing Director Name",
                                        ),
                                        onChanged: (input) async {
                                          md = input;
                                        },
                                      ),
                                      Divider(),
                                      SizedBox(height: 50),
                                      TextFormField(
                                        initialValue: club["Marketing Director Email"],
                                        decoration: InputDecoration(
                                          helperText:
                                              "Marketing Director Email",
                                        ),
                                        onChanged: (input) async {
                                          emd = input;
                                        },
                                      ),
                                      Divider(),
                                      SizedBox(height: 50),
                                      TextFormField(
                                        initialValue: club["Marketing Director 2"],
                                        decoration: InputDecoration(
                                          helperText:
                                              "Marketing Director 2 Name",
                                        ),
                                        onChanged: (input) async {
                                          md2 = input;
                                        },
                                      ),
                                      Divider(),
                                      SizedBox(height: 50),
                                      TextFormField(
                                        initialValue: club["Marketing Director 2 Email"],
                                        decoration: InputDecoration(
                                          helperText:
                                              "Marketing Director 2 Email",
                                        ),
                                        onChanged: (input) async {
                                          emd2 = input;
                                        },
                                      ),
                                      Divider(),
                                      SizedBox(height: 50),
                                      TextFormField(
                                        initialValue: club["Events Coordinator"],
                                        decoration: InputDecoration(
                                          helperText:
                                              "Events Coordinator Name",
                                        ),
                                        onChanged: (input) async {
                                          ec = input;
                                        },
                                      ),
                                      Divider(),
                                      SizedBox(height: 50),
                                      TextFormField(
                                        initialValue: club["Events Coordinator Email"],
                                        decoration: InputDecoration(
                                          helperText:
                                              "Events Coordinator Email",
                                        ),
                                        onChanged: (input) async {
                                          eec = input;
                                        },
                                      ),
                                      Divider(),
                                      SizedBox(height: 50),
                                      TextFormField(
                                        initialValue: club["Events Coordinator 2"],
                                        decoration: InputDecoration(
                                          helperText: 
                                              "Events Coordinator 2 Name",
                                        ),
                                        onChanged: (input) async {
                                          ec2 = input;
                                        },
                                      ),
                                      Divider(),
                                      SizedBox(height: 50),
                                      TextFormField(
                                        initialValue: club["Events Coordinator 2 Email"],
                                        decoration: InputDecoration(
                                          helperText:
                                              "Events Coordinator 2 Email",
                                        ),
                                        onChanged: (input) async {
                                          eec2 = input;
                                        },
                                      ),
                                      

                                    ],
                                  ),
                                  actions: [
                                    ElevatedButton(
                                      onPressed: () async {
                                        master_database[j.toString()]["link1"] = link1;
                                        master_database[j.toString()]["link2"] = link2;
                                        master_database[j.toString()]["link3"] = link3;
                                        master_database[j.toString()]["link4"] = link4;
                                        master_database[j.toString()]["President"] = pres;
                                        master_database[j.toString()]["Pres Email"] = epres;
                                        master_database[j.toString()]["Vice President"] = vp;
                                        master_database[j.toString()]["VP Email"] = evp;
                                        master_database[j.toString()]["Secretary"] = sec;
                                        master_database[j.toString()]["Sec Email"] = esec;
                                        master_database[j.toString()]["Treasurer"] = treas;
                                        master_database[j.toString()]["Treas Email"] = etreas;
                                        master_database[j.toString()]["Advisor"] = advisor;
                                        master_database[j.toString()]["Advisor Email"] = eadvisor;
                                        master_database[j.toString()]["President 2"] = pres2;
                                        master_database[j.toString()]["President 2 Email"] = epres2;
                                        master_database[j.toString()]["Vice President 2"] = vp2;
                                        master_database[j.toString()]["Vice President 2 Email"] = evp2;
                                        master_database[j.toString()]["Secretary 2"] = sec2;
                                        master_database[j.toString()]["Secretary 2 Email"] = esec2;
                                        master_database[j.toString()]["Treasurer 2"] = treas2;
                                        master_database[j.toString()]["Treasurer 2 Email"] = etreas2;
                                        master_database[j.toString()]["Public Relations"] = pr;
                                        master_database[j.toString()]["Public Relations Email"] = epr;
                                        master_database[j.toString()]["Public Relations 2 Email"] = epr2;
                                        master_database[j.toString()]["Public Relations 2"] = pr2;
                                        master_database[j.toString()]["Marketing Director"] = md;
                                        master_database[j.toString()]["Marketing Director Email"] = emd;
                                        master_database[j.toString()]["Marketing Director 2"] = md2;
                                        master_database[j.toString()]["Marketing Director 2 Email"] = emd2;
                                        master_database[j.toString()]["Events Coordinator"] = ec;
                                        master_database[j.toString()]["Events Coordinator Email"] = eec;
                                        master_database[j.toString()]["Events Coordinator 2"] = ec2;
                                        master_database[j.toString()]["Events Coordinator 2 Email"] = eec2;
                                        Navigator.of(context).pop();
                                        first_loading= true;
                                        setState(() {newList2 = registerList;});
                                      },
                                      child: Text("Save and Close"),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: Icon(Icons.settings),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:[
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
                          SizedBox(width: 10),
                          ElevatedButton(
                            child: Text("Info"),
                            onPressed: () async {
                              return showDialog<void>(
                                context: context,
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
                                      SizedBox(height: 100),
                                      ElevatedButton(
                                        onPressed: () async {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text("Close"),
                                      ),
                                    ],
                                  ),
                                );
                              });
                            },
                          ),
                        ],
                        ),],
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
        title: Text("Registered Clubs"),
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
