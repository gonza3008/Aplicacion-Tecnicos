import 'package:flutter/material.dart';
import 'package:app_tecnicos/screens/screens.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  PageController pageController = PageController();

  void onTapped(int index) {
    setState(() => {_selectedIndex = index});

    if (index == 2) {//Si presiono el icono de Log Out 
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Desea salir de la aplicacion?"),
          content: const Text("Presione Si para salir."),
          actions: [
            ElevatedButton(
              style: const ButtonStyle(backgroundColor:  MaterialStatePropertyAll<Color>(Colors.deepPurple)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => const LoginScreen())));
              },
              child: const Text("Si")
            ),
            ElevatedButton(
              style: const ButtonStyle(backgroundColor:  MaterialStatePropertyAll<Color>(Colors.deepPurple)),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancel")
            ),
          ],
        )
        ).then((value) => print(value));

    } else {
      pageController.animateToPage(index,
          duration: const Duration(milliseconds: 500), curve: Curves.ease);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.deepPurple,
        title: const Center(child: Text('Devices')),
      ),
      body: PageView(
        controller: pageController,
        /*Paginas a las cuales navegar */
        children: const [
          DeviceScreen(),
          BluetoothScreen(
            title: 'Bluetooth',
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bluetooth),
            label: 'Conexion',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout),
            label: 'Log Out',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepPurple,
        onTap: onTapped,
      ),
    );
  }
}
