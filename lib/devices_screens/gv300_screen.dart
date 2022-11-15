import 'package:flutter/material.dart';

class GV300Screen extends StatelessWidget {
  const GV300Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.deepPurple,
        title: const Center(child: Text('Configuracion: GV300')),
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