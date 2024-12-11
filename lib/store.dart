import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StorePage(),
    );
  }
}

class StorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, // Number of tabs
      child: Scaffold(

        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset(
              'assets/Back.png',
              width: 25,
              height: 25,
            ),
          ),

          title: const Text(
            "STORE",
            style: TextStyle(
              fontFamily: 'SR',
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Color.fromRGBO(102, 61, 16, 1.0), // Custom color
              letterSpacing: 6.0,
            ),
          ),

          bottom: const TabBar(
            tabs: [
              Tab(text: "Furniture"),
              Tab(text: "Wallpaper"),
              Tab(text: "Bear"),
              Tab(text: "Redeem"),
            ],
            labelColor: Color.fromRGBO(102, 61, 16, 1.0),
            labelStyle: TextStyle(
              fontFamily: 'Schoolbell',
              fontWeight: FontWeight.bold,
            ),
            indicatorColor: Color.fromRGBO(102, 61, 16, 1.0),
          ),
        ),

        body: TabBarView(
          children: [
            StoreCategoryPage(category: "Furniture"),
            StoreCategoryPage(category: "Wallpaper"),
            StoreCategoryPage(category: "Bear"),
            StoreCategoryPage(category: "Redeem"),
          ],
        ),
      ),
    );
  }
}

class StoreCategoryPage extends StatelessWidget {
  final String category;

  StoreCategoryPage({Key? key, required this.category}) : super(key: key);

  // Dummy data for demonstration purposes
  final Map<String, List<Map<String, String>>> categoryItems = {
    'Furniture': [
      {'icon': 'assets/Wooden Table.png', 'name': 'Wooden Table', 'price': '\$100'},
      {'icon': 'assets/Blue Bed.png', 'name': 'Blue Bed', 'price': '\$50'},
    ],
    'Wallpaper': [
      {'icon': 'assets/Pink.png', 'name': 'Pink', 'price': '\$30'},
      {'icon': 'assets/Blue Sky.jpg', 'name': 'Blue Sky', 'price': '\$25'},
    ],
    'Bear': [
      {'icon': 'assets/Purple Bear.png', 'name': 'Purple Bear', 'price': '\$15'},
    ],
    'Redeem': [
      {'icon': 'assets/RedeemIcon.png', 'name': '5 Starzada Coins', 'price': '\$10'},
      {'icon': 'assets/RedeemIcon.png', 'name': '10 Starzada Coins', 'price': '\$5'},
    ],
  };

  @override
  Widget build(BuildContext context) {
    // Get the list of items for the selected category
    final items = categoryItems[category] ?? [];

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return StoreItem(
            icon: items[index]['icon']!,
            name: items[index]['name']!,
            price: items[index]['price']!,
          );
        },
      ),
    );
  }
}

class StoreItem extends StatelessWidget {
  final String icon;
  final String name;
  final String price;

  const StoreItem({
    Key? key,
    required this.icon,
    required this.name,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        leading: Image.asset(
          icon,
          width: 40,
          height: 40,
        ),
        title: Text(
          name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(price),
        trailing: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromRGBO(102, 61, 16, 1.0),
          ),
          child: const Text('Buy',
            style: TextStyle(
              color: Colors.white
            ),
          ),
        ),
      ),
    );
  }
}

