import 'package:flutter/material.dart';
import 'package:shopping_list/models/grocery_item.dart';
import 'package:shopping_list/screem/new_item.dart';
import 'package:shopping_list/widgets/groceries_item_list.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  final List<GroceryItem> _groceryItems = [];
  Widget mainContent = const Text('');

  void _addItem() async {
    final newItem = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => const NewItem(),
      ),
    );

    if (newItem == null) return;

    setState(() {
      _groceryItems.add(newItem);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_groceryItems.isEmpty) {
      mainContent = const Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'No Items yet!',
            style: TextStyle(fontSize: 25),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Try add one! : )',
            style: TextStyle(fontSize: 25),
          ),
        ],
      ));
    } else {
      mainContent = ListView.builder(
          itemCount: _groceryItems.length,
          itemBuilder: (context, index) => Dismissible(
              background: Container(
                color: Colors.red,
              ),
              key: ValueKey(_groceryItems[index].id),
              onDismissed: (DismissDirection direction) {
                setState(() {
                  _groceryItems.remove(_groceryItems[index]);
                });
              },
              child: GroceryItemList(
                id: _groceryItems[index].id,
                name: _groceryItems[index].name,
                quantity: _groceryItems[index].quantity,
                category: _groceryItems[index].category,
              )));
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Your Groceries',
        ),
        actions: [IconButton(onPressed: _addItem, icon: const Icon(Icons.add))],
      ),
      body: mainContent,
    );
  }
}
