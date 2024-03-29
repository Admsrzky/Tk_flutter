import 'package:flutter/material.dart';

class ProductDetail extends StatelessWidget {
  final Map product;
  // ignore: prefer_const_constructors_in_immutables
  ProductDetail({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Produk"),
      ),
      body: Column(children: [
        Container(child: Image.network(product['image_url'])),
        const SizedBox(
          height: 20.0,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                product['price'],
                style: const TextStyle(fontSize: 22),
              ),
              const Row(
                children: [
                  Icon(Icons.edit),
                  Icon(Icons.delete),
                ],
              )
            ],
          ),
        ),
        Text(product['description'])
      ]),
    );
  }
}
