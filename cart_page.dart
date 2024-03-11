import "package:fastfood_offers/cart_provider.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {

    final cart = context.watch<CartProvider>().cart;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart')
      ),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          final cartItem = cart [index];

          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(cartItem['imageurl'] as String),
              radius: 35,
            ),
            trailing: IconButton(onPressed: () {
             showDialog(context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text('Delete the product',
                  style: Theme.of(context).textTheme.titleMedium,
                  ),
                  content: const Text('Are you sure you want to delete it from cart?'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      }, 
                      child: const Text('No', style: TextStyle(
                       color: Colors.blue,
                       fontWeight: FontWeight.bold,
                      ),),),
                    TextButton(
                      onPressed: () {
                        Provider.of<CartProvider>(context, listen: false).removeProduct(cartItem);
                      },
                      child: const Text('Yes', style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                      ),),
                  ],
                );
              } );
             
            }, icon: const Icon(Icons.delete),),
            title: Text(
              cartItem['title'].toString(),
              style: Theme.of(context).textTheme.bodySmall,
            ),
            
          );
        },
        ),
    );
  }
}