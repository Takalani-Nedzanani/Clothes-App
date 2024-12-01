import 'package:flutter/material.dart';

class ClothesDetailsScreen extends StatefulWidget {
  final Map<String, String> clothing;

  const ClothesDetailsScreen({super.key, required this.clothing});

  @override
  _ClothesDetailsScreenState createState() => _ClothesDetailsScreenState();
}

class _ClothesDetailsScreenState extends State<ClothesDetailsScreen> {
  String? selectedColor; // Store the selected color

  final List<String> colors = [
    "Red",
    "Blue",
    "Black",
    "Green"
  ]; // Available colors

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.clothing["name"]!),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              widget.clothing["image"]!,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.clothing["name"]!,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.clothing["price"]!,
                    style: const TextStyle(fontSize: 20, color: Colors.green),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Description",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text(widget.clothing["description"]!),
                  const SizedBox(height: 20),
                  const Text(
                    "Select Color",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: colors.map((color) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedColor = color;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _getColor(color),
                            border: Border.all(
                              color: selectedColor == color
                                  ? Colors.black
                                  : Colors.transparent,
                              width: 2,
                            ),
                          ),
                          width: 40,
                          height: 40,
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: selectedColor != null
                        ? () {
                            // Add to cart logic
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  "${widget.clothing["name"]} in $selectedColor added to cart.",
                                ),
                              ),
                            );
                          }
                        : null, // Disable button if no color is selected
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    child: const Text("Add to Cart"),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Comments",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  const CommentWidget(user: "Alice", comment: "Great quality!"),
                  const CommentWidget(user: "Bob", comment: "Loved the fit."),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Helper method to get the color from the name
  Color _getColor(String colorName) {
    switch (colorName) {
      case "Red":
        return Colors.red;
      case "Blue":
        return Colors.blue;
      case "Black":
        return Colors.black;
      case "Green":
        return Colors.green;
      default:
        return Colors.grey;
    }
  }
}

class CommentWidget extends StatelessWidget {
  final String user;
  final String comment;

  const CommentWidget({super.key, required this.user, required this.comment});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          CircleAvatar(child: Text(user[0])),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(user, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(comment),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
