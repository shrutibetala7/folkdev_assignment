import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:folk_developers_assignment/bed_room.dart';
import 'package:folk_developers_assignment/homepage_layout.dart';

void main() {
  runApp(MyApp());
  SystemChrome.setEnabledSystemUIOverlays([]);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/bedroom': (context) => BedRoom()
      },
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final items = [
    BottomNavigationBarItem(
        icon: SvgPicture.asset('assets/bulb.svg'), label: ''),
    BottomNavigationBarItem(
        icon: SvgPicture.asset('assets/Icon feather-home.svg'), label: ''),
    BottomNavigationBarItem(
        icon: SvgPicture.asset('assets/Icon feather-settings.svg'), label: '')
  ];

  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 1;
    _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }

    return Scaffold(
        backgroundColor: Colors.blue[900],
        bottomNavigationBar: BottomNavigationBar(
          onTap: _onItemTapped,
          items: items,
          currentIndex: _selectedIndex,
        ),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: 140.0,
                child: SvgPicture.asset(
                  'assets/Circles.svg',
                  color: Colors.white,
                  fit: BoxFit.cover,
                ),
              ),
              Column(children: [
                Container(
                  child: Padding(
                      padding: const EdgeInsets.only(
                          right: 20.0, top: 40.0, left: 20.0, bottom: 20.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //padding: const EdgeInsets.only(left: 30.0, top: 60.0),
                            Text(
                              'Control\nPanel',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold),
                            ),

                            SvgPicture.asset(
                              'assets/user.svg',
                              height: 80.0,
                            ),
                          ])),
                ),
                Hero(tag: 'container', child: HomeLayout()),
              ]),
            ],
          ),
        ));
  }
}
