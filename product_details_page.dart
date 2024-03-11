
import 'package:fastfood_offers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailsPage extends StatefulWidget {
  final Map<String, Object> product;
  const ProductDetailsPage({
    super.key,
    required this.product,});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {

  void onTap() {
     Provider.of<CartProvider>(context, listen: false).addProduct(
      {
    'title': widget.product['title'],
    'price': widget.product['price'],
    'Company': widget.product['Company'],
    'imageurl': widget.product['imageurl'],
  },
  );
  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Product added successfully')));
  

  
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text( widget.product ['title'] as String,
          style: Theme.of(context).textTheme.titleLarge),
          const Spacer(flex: 2,),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset( widget.product ['imageurl'] as String,
            scale: 3, 
            ),
          ),
          const Spacer(flex: 2),
          Container(
            height: 250,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(245, 247, 249, 1),
              borderRadius: BorderRadius.circular(40),
            ),
            child:Column(
              children: [
                const Spacer(),
                
                const Text(
                  'Coupan Code:OurApp25252xyz',
                ),
                
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(onPressed: onTap,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    minimumSize: const Size(double.infinity, 50),
                    
                  ),
                  child: const Text('Add to cart', style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  
                  ),
                  ),
                  
                  ),
                ),
                const Spacer(),
              ],
            )
          ),
        ],
      ),

    );
  }
}