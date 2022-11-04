import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class BluetoothScreen extends StatefulWidget {
   
  const BluetoothScreen({Key? key}) : super(key: key);

  @override
  State<BluetoothScreen> createState() => _BluetoothScreenState();
}

class _BluetoothScreenState extends State<BluetoothScreen> {

  BluetoothState _bluetoothState = BluetoothState.UNKNOWN;

  _getBTState(){
    FlutterBluetoothSerial.instance.state.then((state)  {
      _bluetoothState = state;
      setState((){});
    });
  }
  
  _stateChangeListener (){
    FlutterBluetoothSerial.instance.onStateChanged().listen((BluetoothState state) { 
      _bluetoothState = state;
      print("State is Enabled: ${state.isEnabled}");
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
         child: Column(
          children: [
            SwitchListTile(
              title: const Text('Enable Bluetooth'),
              value:_bluetoothState.isEnabled, 
              onChanged: (bool value) {
                Future() async {
                  if (value) {
                    await FlutterBluetoothSerial.instance.requestEnable();
                  }
                  else
                  {
                    await FlutterBluetoothSerial.instance.requestDisable();
                  }
                  Future().then((_){
                    setState(() {});
                  });
                }
              }
            ),
            ListTile(
              title: const Text("Bluetooth status"),
              subtitle: Text(_bluetoothState.toString()),
              trailing: RaisedButtom(),
            )
        ]),
      ),
    );
  }
}