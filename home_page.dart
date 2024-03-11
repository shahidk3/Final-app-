import "package:fastfood_offers/cart_page.dart";
import "package:fastfood_offers/product_list.dart";
import "package:flutter/material.dart";


class HomePage extends StatefulWidget {
  const HomePage ({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentpage = 0;


  List<Widget> pages = const [
    ProductList(),
    CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentpage == 0? const ProductList() : const CartPage(),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 35,
        onTap: (value) {
          setState(() {
            currentpage = value;
          });

        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
        ]
        ), 
    );
  }
}