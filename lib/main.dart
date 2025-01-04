import 'package:flutter/material.dart';
import 'package:shopping_app_signup/screens/signup.dart';
import 'package:shopping_app_signup/widgets/display_product.dart';
import 'package:shopping_app_signup/widgets/grid_view.dart';
import 'package:shopping_app_signup/widgets/hot_offers.dart';

void main() {
  runApp(const ShoppingApp());
}

class ShoppingApp extends StatelessWidget {
  const ShoppingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SignUpScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping App'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Our Products",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              DisplayProducts(),
              const SizedBox(height: 20),
              GridViewProduct(),
              const SizedBox(height: 20),
              const Text(
                "Hot Offers",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              HotOffers(),
            ],
          ),
        ),
      ),
    );
  }
}