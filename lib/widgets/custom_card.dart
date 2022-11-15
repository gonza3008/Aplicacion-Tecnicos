import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String image;
  final String? name;
  final Widget screenWidget; 

  const CustomCard({super.key, required this.image, this.name, required this.screenWidget});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Card(
          shadowColor: Colors.deepPurple.withOpacity(0.5),
          clipBehavior: Clip.antiAlias,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 10,
          child: Column(
            children: [
              FadeInImage(
                  placeholder: const AssetImage('assets/jar-loading.gif'),
                  image: AssetImage(image),
                  width: double.infinity, //toma todo el ancho posible
                  height: 230,
                  fit: BoxFit
                      .cover, //La imagen se adapta a todo el tamaño posible de la carta.
                  fadeInDuration: const Duration(milliseconds: 300)),
              if (name !=
                  null) //Si name es distinto de null se ejecuta el container
                Container(
                  alignment: AlignmentDirectional
                      .centerEnd, //alineo el titulo segun el container
                  padding:
                      const EdgeInsets.only(right: 20, top: 10, bottom: 10),
                  child: Center(
                      child: Text(name!,
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(202, 104, 43, 209)))),
                )
            ],
          ),
        ),
        onTap: () {
          print('Carta presionada');
          // Navigate back to first route when tapped.
          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => screenWidget)));
        }
      );
  }
}
