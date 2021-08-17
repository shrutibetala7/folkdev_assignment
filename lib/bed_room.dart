import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:folk_developers_assignment/constants.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:animate_do/animate_do.dart';

class BedRoom extends StatefulWidget {
  const BedRoom({Key? key}) : super(key: key);

  @override
  _BedRoomState createState() => _BedRoomState();
}

class _BedRoomState extends State<BedRoom> {
  double val = 0;
  double brightness = 0;
  Color currentColor = Colors.amber;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    //function to set bulb color
    _selectColor(Color color) {
      setState(() {
        currentColor = color;
      });
    }

    //Color picker circle
    SlideInLeft colorSwatch(Color color, double from) {
      return SlideInLeft(
        delay: Duration(milliseconds: 70),
        from: from,
        animate: true,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              _selectColor(color);
            },
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Container(
                height: 30.0,
                width: 30.0,
                decoration: BoxDecoration(
                    color: color, borderRadius: BorderRadius.circular(20)),
              ),
            ),
          ),
        ),
      );
    }

    //Scenes label -- Birthday,Party,Relax,Fun
    Container sceneLabel(String route, String label, LinearGradient gradient) {
      return Container(
        width: 150.0,
        height: 60.0,
        padding: EdgeInsets.all(20.0),
        child: Row(
          children: [
            SvgPicture.asset(route),
            SizedBox(
              width: 18.0,
            ),
            Text(
              label,
              style: kTextStyleLight.copyWith(fontSize: 14.0),
            )
          ],
        ),
        decoration: BoxDecoration(
            gradient: gradient, borderRadius: BorderRadius.circular(10.0)),
      );
    }

    //Bottom sheet layout
    Stack bedRoomLayout(BuildContext context) {
      return Stack(
        clipBehavior: Clip.none,
        children: [
          Hero(
            tag: 'container',
            child: Container(
              height: size.height - 170,
              width: size.width,
              decoration: kBottomSheetDecoration,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 30.0,
                  left: 30.0,
                  right: 30.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Intensity',
                      style: kTextStyleOptions,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 20.0),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SvgPicture.asset(
                            'assets/solution2.svg',
                            color: Colors.grey,
                          ),
                          Expanded(
                            child: SfSliderTheme(
                              data: SfSliderThemeData(
                                  tickOffset: Offset(0.0, 10.0),
                                  thumbColor: Colors.white,
                                  inactiveTrackColor: Colors.grey,
                                  activeTrackColor: Colors.yellow,
                                  overlayColor: Colors.transparent,
                                  thumbRadius: 8.0),
                              child: SfSlider(
                                  min: 0,
                                  max: 225,
                                  interval: 50,
                                  value: val,
                                  showTicks: true,
                                  onChanged: (dynamic value) {
                                    setState(() {
                                      val = value;
                                      brightness = value;
                                    });
                                  }),
                            ),
                          ),
                          SvgPicture.asset(
                            'assets/solution1.svg',
                            color: brightness > 0 ? Colors.amber : Colors.grey,
                          )
                        ],
                      ),
                    ),
                    Text(
                      'Colors',
                      style: kTextStyleOptions,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                      child: Row(
                        children: [
                          colorSwatch(Color(0xfff19195), 0),
                          colorSwatch(Color(0xff81ccee), 20),
                          colorSwatch(Color(0xffa893f1), 40),
                          colorSwatch(Color(0xffeb8ef1), 60),
                          colorSwatch(Color(0xfff1d08b), 80),
                          SizedBox(
                            width: 8.0,
                          ),
                          SlideInLeft(
                            delay: Duration(milliseconds: 70),
                            from: 110,
                            child: Container(
                              height: 30.0,
                              width: 30.0,
                              padding: EdgeInsets.all(8.0),
                              child: SvgPicture.asset(
                                'assets/+.svg',
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30.0)),
                            ),
                          )
                        ],
                      ),
                    ),
                    Text(
                      'Scenes',
                      style: kTextStyleOptions,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              sceneLabel('assets/surface2.svg', 'Birthday',
                                  kOrangeGradient),
                              SizedBox(
                                width: 20.0,
                              ),
                              SlideInLeft(
                                  delay: Duration(milliseconds: 30),
                                  child: Expanded(
                                    flex: 1,
                                    child: sceneLabel('assets/surface2.svg',
                                        'Party', kPurpleGradient),
                                  ))
                            ],
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Row(
                            children: [
                              sceneLabel('assets/surface2.svg', 'Relax',
                                  kBlueGradient),
                              SizedBox(
                                width: 20.0,
                              ),
                              SlideInLeft(
                                delay: Duration(milliseconds: 30),
                                child: Expanded(
                                  flex: 1,
                                  child: sceneLabel('assets/surface2.svg',
                                      'Fun', kGreenGradient),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: -20.0,
            right: 30.0,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  'assets/Icon awesome-power-off.svg',
                  height: 24.0,
                ),
              ),
            ),
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          Spin(
            spins: 0.5,
            child: Transform.rotate(
              angle: -185,
              child: Container(
                height: 300.0,
                child: SvgPicture.asset(
                  'assets/Circles.svg',
                  color: Colors.white,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: SvgPicture.asset(
                                  'assets/Icon ionic-md-arrow-round-back.svg',
                                  height: 20.0,
                                ),
                              ),
                              SizedBox(
                                width: 3.0,
                              ),
                              Text(
                                'Bed',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 32.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Text(
                            'Room',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 32.0,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          BounceInDown(
                            delay: Duration(milliseconds: 30),
                            child: Text(
                              '4 Lights',
                              style: kTextStyleInfo.copyWith(
                                  fontSize: 18.0,
                                  color: Colors.amber,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),

                      //lamp svg
                      BounceInDown(
                        delay: Duration(milliseconds: 30),
                        child: Stack(
                          children: [
                            Positioned(
                              bottom: 36.0,
                              right: 65.0,
                              child: Container(
                                height: 4,
                                width: 4,
                                decoration: BoxDecoration(boxShadow: [
                                  BoxShadow(
                                      color: brightness == 0
                                          ? Colors.transparent
                                          : currentColor
                                              .withAlpha(brightness.toInt()),
                                      blurRadius: 20.0,
                                      spreadRadius: 17.0),
                                ]),
                              ),
                            ),
                            SvgPicture.asset(
                              'assets/light bulb.svg',
                              color: brightness == 0
                                  ? Colors.grey[700]
                                  : currentColor.withAlpha(brightness.toInt()),
                            ),
                            SvgPicture.asset('assets/Group 38.svg'),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  primary: false,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 30.0, left: 20.0),
                    child: ElasticInRight(
                      delay: Duration(seconds: 1),
                      child: Row(
                        children: [
                          Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Row(
                                children: [
                                  SvgPicture.asset('assets/surface1.svg'),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(
                                    'Main Light',
                                    style: kTextStyleLight.copyWith(
                                        color: Colors.black),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            color: Colors.indigo[900],
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                      'assets/furniture-and-household.svg'),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(
                                    'Desk Lights',
                                    style: kTextStyleLight,
                                  )
                                ],
                              ),
                            ),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Row(
                                children: [
                                  SvgPicture.asset('assets/bed (1).svg'),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(
                                    'Bed Light',
                                    style: kTextStyleLight.copyWith(
                                        color: Colors.black),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                bedRoomLayout(context),
              ],
            ),
          )
        ],
      ),
    );
  }
}
