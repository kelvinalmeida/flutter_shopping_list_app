import 'package:shopping_list/models/category.dart';
import 'package:flutter/material.dart';

class GroceryItem extends StatelessWidget {
  const GroceryItem(
      {required this.id,
      required this.name,
      required this.quantity,
      required this.category,
      super.key});

  final String id;
  final String name;
  final int quantity;
  final Category category;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.all(20),
            height: 40,
            width: 40,
            decoration: BoxDecoration(color: category.cor),
          )
        ],
      ),
    );
  }
}
