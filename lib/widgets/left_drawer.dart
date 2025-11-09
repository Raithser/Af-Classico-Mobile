import 'package:flutter/material.dart';
import 'package:af_classico_mobile/screens/menu.dart';
import 'package:af_classico_mobile/screens/productlist_form.dart';
import 'package:af_classico_mobile/widgets/product_card.dart';


class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
    const DrawerHeader(
      decoration: BoxDecoration(
        color: Colors.blue,
      ),
      child: Column(
        children: [
          Text(
            'Af Classico',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Padding(padding: EdgeInsets.all(10)),
          Text("Seluruh perlengkapan sepak bola terkini ada di sini!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
                fontWeight: FontWeight.normal,
                )
              ),
        ],
      ),
    ),    
        ListTile(
          leading: const Icon(Icons.home_outlined),
          title: const Text('Home'),
          // Bagian redirection ke MyHomePage
          onTap: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => MyHomePage(),
                ));
          },
        ),
        ListTile(
          leading: const Icon(Icons.post_add),
          title: const Text('Add Product'),
          // Bagian redirection ke ProductFormPage
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductFormPage(),
                ));
          },
        ), 
        // TODO: Buat ListTile baru untuk ke halaman melihat news
      
        
        ],
      ),
    );
  }
}