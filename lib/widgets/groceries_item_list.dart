import 'package:shopping_list/models/category.dart';
import 'package:flutter/material.dart';

class GroceryItemList extends StatelessWidget {
  const GroceryItemList(
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
    return ListTile(
      title: Text(
        name,
        style: const TextStyle(fontSize: 16),
      ),
      leading: Container(
        width: 24,
        height: 24,
        color: category.color,
      ),
      trailing: Text(
        quantity.toString(),
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
