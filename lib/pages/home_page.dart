import 'package:belanja/models/item.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<Item> items = [
    Item(
      name: 'Gula Palu Merah',
      price: 5000,
      imageUrl: 'assets/image/gula.png',
      stock: 50,
      rating: 4.5,
    ),
    Item(
      name: 'Garam Pak Tani',
      price: 2000,
      imageUrl: 'assets/image/garam.png',
      stock: 30,
      rating: 4.0,
    ),
  ];
  final routeName = '/item';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text('Toko Flutter'),
        ),
        body: Container(
          margin: const EdgeInsets.all(15),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.7,
            ),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return Material(
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, routeName, arguments: item);
                  },
                  child: Card(
                    elevation: 5,
                    margin: EdgeInsets.all(10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Hero(
                          tag: item.name,
                          child: Image.asset(
                            item.imageUrl,
                            width: 150,
                            height: 150,
                          ),
                        ),
                        const SizedBox(
                            height: 10), // Spasi antara gambar dan nama produk
                        Text(
                          item.name.toString(),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                            height: 5), // Spasi antara nama produk dan stok
                        Text(
                          'Stok: ${item.stock.toString()}',
                          style: const TextStyle(
                            color: Colors
                                .green, // Warna teks hijau untuk menunjukkan ketersediaan
                          ),
                        ),
                        const SizedBox(
                            height: 5), // Spasi antara stok dan rating
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                            Text(
                              ' ${item.rating.toString()}',
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            height: 50,
            color: Colors.green,
            alignment: Alignment.center,
            child: const Text(
              'Dandy Wahyu Syahputra || 2141720002',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
        ));
  }
}
