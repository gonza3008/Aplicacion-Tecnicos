import 'package:app_tecnicos/devices_screens/gv300_screen.dart';
import 'package:app_tecnicos/devices_screens/ican_screen.dart';
import 'package:app_tecnicos/devices_screens/trax_screen.dart';
import 'package:app_tecnicos/widgets/widgets.dart';
import 'package:flutter/material.dart';

class DeviceScreen extends StatelessWidget {
  const DeviceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const CustomCard(name: 'ICAN', image: 'assets/ican.jpg', screenWidget: IcanScreen()),
            const SizedBox(height: 20),
            const CustomCard(name: 'TRAX', image: 'assets/Trax.jpg', screenWidget: TraxScreen()),
            const SizedBox(height: 20),
            const CustomCard(name: 'GV300', image: 'assets/GV300.jpg', screenWidget: GV300Screen()),
          ],
        )
    );
  }
}
