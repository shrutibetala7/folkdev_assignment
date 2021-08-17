import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:folk_developers_assignment/bed_room.dart';
import 'package:folk_developers_assignment/constants.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    Material gridTile(String path, String title, String info, String route) {
      return Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, route);
          },
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),
            child: Padding(
              padding: const EdgeInsets.only(top: 30.0, left: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 24.0),
                    child: SvgPicture.asset(
                      path,
                      height: 50.0,
                    ),
                  ),
                  Text(
                    title,
                    style: kTextStyleRoom,
                  ),
                  SizedBox(
                    height: 6.0,
                  ),
                  Text(info, style: kTextStyleInfo)
                ],
              ),
            ),
          ),
        ),
      );
    }

    return Container(
      height: size.height - 100,
      width: size.width,
      decoration: kBottomSheetDecoration,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 30.0),
                child: Text('All Rooms',
                    style: kTextStyleRoom.copyWith(fontSize: 22.0))),
            Expanded(
              child: GridView.count(
                primary: true,
                shrinkWrap: true,
                crossAxisCount: 2,
                mainAxisSpacing: 20.0,
                crossAxisSpacing: 20.0,
                childAspectRatio: 1,
                children: [
                  gridTile(
                      'assets/bed.svg', 'Bed room', '4 Lights', '/bedroom'),
                  gridTile('assets/room.svg', 'Living room', '2 Lights', ''),
                  gridTile('assets/kitchen.svg', 'Kitchen', '5 Lights', ''),
                  gridTile(
                    'assets/bathtube.svg',
                    'Bath room',
                    '1 Light',
                    '',
                  ),
                  gridTile('assets/house.svg', 'Outdoor', '5 Lights', ''),
                  gridTile('assets/balcony.svg', 'Balcony', '2 Lights', ''),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
