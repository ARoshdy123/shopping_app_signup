import 'package:flutter/material.dart';

import '../consts/url.dart';

class GridViewProduct extends StatelessWidget {
  GridViewProduct({super.key});


  final List<Map<String, String>> products = [
    {"image": GridUrl.gImageUrl1, "name": "Product 1"},
    {
      "image":
      GridUrl.gImageUrl2,
      "name": "Product 2"
    },
    {
      "image":
      GridUrl.gImageUrl3,
      "name": "Product 3"
    },
    {
      "image":
      GridUrl.gImageUrl3,
      "name": "Product 4"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return Card(
          child: Column(
            children: [
              Image.network(products[index]['image']!, height: 200, width: 400),
              const SizedBox(height: 10),
              Text(products[index]['name']!),
              const SizedBox(height: 60),
              IconButton(
                alignment: Alignment.bottomCenter,
                icon: const Icon(Icons.add_shopping_cart),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content:
                            Text('${products[index]['name']} added to cart')),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
