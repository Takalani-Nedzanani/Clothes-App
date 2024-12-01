import 'package:clothes_app/screens/productDetails';
import 'package:clothes_app/screens/promo.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
  final List<String> categories = ["Men", "Women", "Kids", "Trending"];

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const PromoBanner(),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Categories",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ProductDetailsScreen(category: categories[index])),
                    );
                  },
                  child: Card(
                    elevation: 4,
                    child: Center(child: Text(categories[index])),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
