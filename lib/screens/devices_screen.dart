import 'package:app_tecnicos/models/models.dart';
import 'package:flutter/material.dart';

import 'package:app_tecnicos/providers/db_provider.dart';


class DeviceScreen extends StatelessWidget {
   
  const DeviceScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
  var products = [
    Product(1, "Laptop Uno", "Un laptop muy eficiente", 2000),
    Product(2, "Laptop Dos", "Este lapto está en descuento", 1500),
    Product(3, "Laptop Tres", "El laptop más caro", 8000)
  ];
    return Scaffold(
      body: Center(
         child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                await addTodb(products.last);
                
                // ignore: use_build_context_synchronously
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Producto agregado!'),
                    duration: Duration(milliseconds: 1000)
                  ),
                );
                 
                  print( await DBProvider.instance.getAllItems());
                  const DbData();
                
              }, 
              child: const Text('Path')
            ),
            Text('hola'),
            Column(
              children: [
                DbData(),
              ],
            ),
          ],
         )
      ),
    );
  
  }
}

Future <void> addTodb (Product product) async{
  final item = CartItem(id: product.id, name: product.name, price: product.price, quantity: 1);
  await DBProvider.instance.insert(item);
}

class DbData extends StatelessWidget {
  const DbData({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DBProvider.instance.getAllItems(),
      builder: ( 
        BuildContext context, 
        AsyncSnapshot<dynamic> snapshot) {  
          if (snapshot.hasData) {
            List<CartItem> cartItems = snapshot.data!;
            return cartItems.isEmpty
            ? const Center(
              child: Text('No hay data'),
            ) 
            : ListView.separated(
              itemBuilder: (context, index) {
                return Container(
                  child: Text(cartItems[index].name)
                );
              },
              separatorBuilder: (context, index) => 
                const Divider(
                  height: 10,
                ),
              itemCount: cartItems.length,
            ); 

          } else {
            return const Center(
              child: Text('No hay data'),
            );
          }
        });
  }
}