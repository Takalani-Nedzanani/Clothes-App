import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<Map<String, dynamic>> cartItems = [
    {"name": "Men’s Hoodie", "price": 300, "quantity": 1},
    {"name": "Men’s Sweatpants", "price": 200, "quantity": 2},
  ];

  @override
  Widget build(BuildContext context) {
    double subtotal = cartItems.fold(
        0, (sum, item) => sum + (item["price"] * item["quantity"]));
    double shipping = 150;
    double total = subtotal + shipping;

    return Scaffold(
      appBar: AppBar(title: const Text("Cart")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(cartItems[index]["name"]),
                  subtitle: Text("Price: R${cartItems[index]["price"]}"),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () {
                          setState(() {
                            if (cartItems[index]["quantity"] > 1) {
                              cartItems[index]["quantity"]--;
                            } else {
                              cartItems.removeAt(index);
                            }
                          });
                        },
                      ),
                      Text("${cartItems[index]["quantity"]}"),
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          setState(() {
                            cartItems[index]["quantity"]++;
                          });
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text("Subtotal: R$subtotal"),
                Text("Shipping: R$shipping"),
                Text("Total: R$total"),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to checkout
                  },
                  child: const Text("Checkout"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
