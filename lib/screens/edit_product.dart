// ignore_for_file: must_be_immutable

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tk_online_flutter/screens/homepage.dart';
import 'package:http/http.dart' as http;

class EditProduct extends StatelessWidget {
  final Map product;
  EditProduct({required this.product});

  final _formkey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _deskripsiController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  TextEditingController _imageUrlController = TextEditingController();

  Future updateProduct() async {
    final response = await http.put(
        Uri.parse(
            "http://10.0.2.2:8000/api/products/" + product['id'].toString()),
        body: {
          "name": _nameController.text,
          "description": _deskripsiController.text,
          "price": _priceController.text,
          "image_url": _imageUrlController.text,
        });

    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Product'),
      ),
      body: Form(
          key: _formkey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController..text = product['name'],
                decoration: InputDecoration(labelText: "Nama Produk"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Masukkan nama produk";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _deskripsiController..text = product['description'],
                decoration: InputDecoration(labelText: "Deskripsi"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Masukkan deskripsi produk";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _priceController..text = product['price'],
                decoration: InputDecoration(labelText: "Harga"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Masukkan harga produk";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _imageUrlController..text = product['image_url'],
                decoration: InputDecoration(labelText: "image URL"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Masukkan alamat image produk";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      updateProduct().then((value) => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage())),
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text("data Berhasil di ubah😎")))
                          });
                    }
                  },
                  child: Text("Update"))
            ],
          )),
    );
  }
}
