import 'package:flutter/material.dart';

class DeviceScreen extends StatelessWidget {
  const DeviceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Text(
                'Seleccione un dispositivo',
                style: TextStyle(fontSize: 20),
              )
            ],
          ),
        ),

        //Primera carta
        Expanded(
            child: Row(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.red,
                image: ('lib/assets/ican.jpg'),
              ),
              margin: const EdgeInsets.only(
                  left: 10.0, right: 10.0, bottom: 10, top: 20),
            )),
            //segunda carta
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.yellow),
              margin: const EdgeInsets.only(
                  left: 10.0, right: 10.0, bottom: 10, top: 20),
            ))
          ],
        )),

        /*NUEVA FILA */
        Expanded(
            child: Row(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.blue),
              margin: const EdgeInsets.only(
                  left: 10.0, right: 10.0, bottom: 10, top: 20),
            )),
            //segunda carta
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.green),
              margin: const EdgeInsets.only(
                  left: 10.0, right: 10.0, bottom: 10, top: 20),
            ))
          ],
        )),
      ],
    ));
  }
}
