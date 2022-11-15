import 'package:flutter/material.dart';

class IcanScreen extends StatelessWidget {
  const IcanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.deepPurple,
        title: const Center(child: Text('Configuracion: ICAN')),
      ),
      body: Center(
          child: Center(
              child: Column(
        children: [
          const SizedBox(height: 20),
          const Text('En desarrollo...',style: TextStyle(fontSize: 20)),
          Image.asset('assets/waiting.gif')
        ],
      ))),
    );
  }
}