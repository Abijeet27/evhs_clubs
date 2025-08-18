import 'package:flutter/material.dart';
import 'main.dart';
import 'settings.dart';
import 'registered.dart';
import 'unregistered.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    List<Widget> options = [Registered(), Unregistred(), Page1()];
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          body: Center(child: options.elementAt(selectedIndex)),
          bottomNavigationBar:
              BottomNavigationBar(
                backgroundColor: Color.fromARGB(255, 212, 176, 62),
                unselectedItemColor: Color.fromARGB(255, 0, 0, 0),
                selectedItemColor:Color.fromARGB(169, 252, 5, 5), 
                  items: [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.face_3),
                      label: "Your Clubs",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.face_4),
                      label: "Other Clubs",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.settings),
                      label: "Settings",
                    ),
                  ],
                  currentIndex: selectedIndex,
                  onTap: (value) {
                    setState(() {
                      selectedIndex = value;
                    });
                  },
              )
        );
      }
    );
  }
}