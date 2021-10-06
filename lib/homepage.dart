import 'package:flutter/material.dart';
import 'package:villa/Calculator/Calc.dart';
import 'package:villa/location.dart';
import 'package:villa/tabview.dart';
import 'package:villa/location.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:permission_handler/permission_handler.dart';

class Homepage extends StatefulWidget {
  static String routeName = "/";
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  get child => null;
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurple,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Colors.deepPurple,
          leading: Icon(Icons.menu_sharp),

          // backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: IconButton(
                  icon: Icon(Icons.gps_fixed),
                  color: Colors.white,
                  iconSize: 30,
                  onPressed: () {
                    Navigator.pushNamed(context, LocationApp.routeName);
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon: Icon(Icons.calculate),
                color: Colors.white,
                iconSize: 30,
                onPressed: () {
                  Navigator.pushNamed(context, Calc.routeName);
                },
              ),
            ),
          ],
        ),
        bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40.0),
            topRight: Radius.circular(40.0),
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.black,
            showSelectedLabels: false,
            showUnselectedLabels: false,

            /// currentIndex: index,
            //onTap: null,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                  title: Text("Home")),
              BottomNavigationBarItem(
                icon: Icon(Icons.chat, color: Colors.white),
                title: Text("Home"),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.chat, color: Colors.white),
                title: Text("Home"),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Shoes for ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.white,
                          fontStyle: FontStyle.italic)),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Unique Style",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 23,
                          color: Colors.white,
                          fontStyle: FontStyle.italic)),
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text("We have a wide range of Shoes",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white,
                            fontStyle: FontStyle.italic))),
                SizedBox(
                  height: 20,
                ),
                Tabview(),
              ],
            ),
          ),
        ));
  }
}
