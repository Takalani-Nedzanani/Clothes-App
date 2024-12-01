import 'package:clothes_app/screens/clothesDetails.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  final List<Map<String, String>> clothes = [
    {
      "name": "Men's Hoodie",
      "price": "R300",
      "description": "A comfortable and stylish hoodie for men.",
      "image":
          "https://via.placeholder.com/150", // Replace with your image URLs
    },
    {
      "name": "Women's Jacket",
      "price": "R500",
      "description": "A sleek jacket perfect for cold weather.",
      "image": "https://via.placeholder.com/150",
    },
    {
      "name": "Kids' T-Shirt",
      "price": "R150",
      "description": "Colorful and fun t-shirt for kids.",
      "image": "https://via.placeholder.com/150",
    },
  ];

  MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50, // Height for the categories row
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                CategoryButton(
                  label: "Men",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const CategoryScreen(category: "Men"),
                      ),
                    );
                  },
                ),
                CategoryButton(
                  label: "Women",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const CategoryScreen(category: "Women"),
                      ),
                    );
                  },
                ),
                CategoryButton(
                  label: "Kids",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const CategoryScreen(category: "Kids"),
                      ),
                    );
                  },
                ),
                CategoryButton(
                  label: "Trending",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const CategoryScreen(category: "Trending"),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: clothes.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ClothesDetailsScreen(clothing: clothes[index]),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                          clothes[index]["image"]!,
                          height: 100,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            clothes[index]["name"]!,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(clothes[index]["price"]!),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const CategoryButton({required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(label),
      ),
    );
  }
}

class CategoryScreen extends StatelessWidget {
  final String category;

  const CategoryScreen({required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("$category Clothes")),
      body: Center(
        child: Text("Display $category-related items here."),
      ),
    );
  }
}
