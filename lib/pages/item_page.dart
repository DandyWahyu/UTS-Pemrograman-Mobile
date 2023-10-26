import 'package:belanja/models/item.dart';
import 'package:flutter/material.dart';

class ItemPage extends StatelessWidget {
  const ItemPage({super.key});
  @override
  Widget build(BuildContext context) {
    final itemArgs = ModalRoute.of(context)!.settings.arguments as Item;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Toko Item'),
      ),
      body: Container(
        margin: const EdgeInsets.all(15),
        child: Column(
          children: [
            Hero(
              tag: itemArgs.name,
              child: Image.asset(
                itemArgs.imageUrl,
                width: 500,
                height: 500,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              color: Colors.green, // Warna latar belakang hijau
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    itemArgs.name.toString(),
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      const Text(
                        'Stok: ',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Text(
                        itemArgs.stock.toString(),
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Text(
                        'Rating: ',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      const Icon(
                        Icons.star,
                        color: Colors.yellow, // Warna bintang kuning
                        size: 24,
                      ),
                      Text(
                        itemArgs.rating.toString(),
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
