import 'package:app_tecnicos/models/models.dart';
import 'package:app_tecnicos/providers/db_provider.dart';
import 'package:flutter/material.dart';


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