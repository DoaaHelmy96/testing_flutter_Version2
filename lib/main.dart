import 'dart:convert';
import 'package:http/http.dart';
import 'package:flutter/material.dart';

class Product {
  final String name;
  final double price;

  Product({required this.name, required this.price});

  bool isDiscounted(DateTime now) {
    final currentDay = now.weekday;
    if (currentDay == DateTime.monday || currentDay == DateTime.friday) {
      return true;
    }
    return false;
  }
}

Future<Product?> fetchProduct(String productId, Client client) async {
  final response = await client
      .get(Uri.parse('https://mystore.com/api/products/$productId'));
  if (response.statusCode == 200) {
    final json = jsonDecode(response.body);
    return Product(name: json['name'], price: json['price']);
  }
  return null;
}

void main() {
  runApp(CounterWidget());
}

class CounterWidget extends StatefulWidget {
  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _count = 0;
  void _incrementCounter() {
    setState(() {
      _count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('$_count'),
              ElevatedButton(
                onPressed: _incrementCounter,
                child: Text('Increment'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
