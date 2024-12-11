import 'package:flutter/material.dart';
import 'search.dart';
import 'messages.dart';
import 'cart.dart';
import 'notifications.dart';
import 'profile.dart';
import 'loading.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(username: "User"), // Provide a username here
    );
  }
}

class HomePage extends StatefulWidget {
  final String username;

  const HomePage({Key? key, required this.username}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0; // State for BottomNavigationBar

  final List<Widget> _pages = [
    const Center(child: Text("Home Page")),
    const MessagesPage(), // Placeholder page for Messages
    const CartPage(), // Placeholder page for Cart
    const NotificationsPage(), // Placeholder page for Notifications
    const ProfilePage(), // Placeholder page for Profile
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/Home Bg.png', // Replace with your image path
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width, // Ensures the image stretches across the screen
              height: 240, // Adjust this as needed for your design
            ),
          ),

          // Foreground Content (Text and Search Bar)
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 50), // Added top padding
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Greeting Text
                  Text(
                    "Hello, ${widget.username}",
                    style: const TextStyle(
                      fontSize: 40,
                      fontFamily: 'Playfair',
                      color: Color.fromRGBO(69,68,68,1.000),
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Search Bar
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SearchPage()),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Row(
                        children: const [
                          Icon(Icons.search, color: Colors.grey),
                          SizedBox(width: 10),
                          Text(
                            "Search",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 95),

                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0, 2),
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Section 1: Wallet Icon and Info
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.add_card, color: Color.fromRGBO(123, 155, 184, 1.000), size: 20),
                                  const SizedBox(width: 5),
                                  const Text("RM 0.00", style: TextStyle(fontSize: 14, color: Color.fromRGBO(69,68,68,1.000))),
                                ],
                              ),
                              const SizedBox(height: 3),
                              const Text("Top up and get 5% cashback", style: TextStyle(fontSize: 9, color: Color.fromRGBO(123, 155, 184, 1.000))),
                            ],
                          ),
                        ),

                        // Divider
                        Container(
                          width: 1,
                          height: 40,
                          color: Colors.grey[300],
                        ),
                        const SizedBox(width: 12), // Space between sections

                        // Section 2: Coin Icon and Info
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.monetization_on, color: Color.fromRGBO(123, 155, 184, 1.000), size: 20),
                                  const SizedBox(width: 5),
                                  const Text("0", style: TextStyle(fontSize: 14, color: Color.fromRGBO(69,68,68,1.000))),
                                ],
                              ),
                              const SizedBox(height: 3),
                              const Text("Check-in daily for more free coins!", style: TextStyle(fontSize: 9, color: Color.fromRGBO(123, 155, 184, 1.000))),
                            ],
                          ),
                        ),

                        // Divider
                        Container(
                          width: 1,
                          height: 40,
                          color: Colors.grey[300],
                        ),
                        const SizedBox(width: 12), // Space between sections

                        // Section 3: Voucher Icon and Info
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.wallet_giftcard_outlined, color: Color.fromRGBO(123, 155, 184, 1.000), size: 18),
                                  const SizedBox(width: 5),
                                  const Text("0", style: TextStyle(fontSize: 14, color: Color.fromRGBO(69,68,68,1.000))),
                                ],
                              ),
                              const SizedBox(height: 3),
                              const Text("Vouchers / Discounts", style: TextStyle(fontSize: 9, color: Color.fromRGBO(123, 155, 184, 1.000))),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Button with image that takes up the whole container
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const LoadingPage()),
                      );
                    },
                    child: Container(
                      height: 110, // Set the desired height for the button container
                      width: double.infinity, // Make the width expand to the available space
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          'assets/Game.png', // Add your image path here
                          fit: BoxFit.cover, // This ensures the image fills the entire container
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  // SafeArea to make the content stay within the screen
                  SafeArea(
                    top: false, // Disable top padding to bring the content closer
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Daily Discover",
                          style: TextStyle(
                            fontSize: 28,
                            fontFamily: 'Playfair',
                            color: Color.fromRGBO(69, 68, 68, 1.000),
                          ),
                        ),

                        GridView.builder(

                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 4,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 2 / 2.5,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                          itemBuilder: (context, index) {
                            // Define the different product information for each index
                            List<String> productNames = ["Round Table", "Short Table", "Long Table", "Tall Table"];
                            List<String> productPrices = ["RM 19.99", "RM 19.99", "RM 19.99", "RM 19.99"];
                            List<String> productSales = ["10 sold", "25 sold", "5 sold", "30 sold"];
                            List<String> productImages = [
                              'assets/Round Table.png', // Replace with your actual product images
                              'assets/Short Table.png',
                              'assets/Long Table.png',
                              'assets/Tall Table.png',
                            ];

                            return Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 7,
                                    child: Image.asset(
                                      productImages[index], // Show different image based on the index
                                      fit: BoxFit.cover, // Make the image cover the top area
                                    ),
                                  ),
                                  // Bottom part of the box with product name, price, and sales info
                                  Expanded(
                                    flex: 3,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          // Product Name and Price at the bottom left
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                productNames[index], // Show different product name
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                ),
                                              ),
                                              Text(
                                                productPrices[index], // Show different price
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromRGBO(123, 155, 184, 1.0),
                                                ),
                                              ),
                                            ],
                                          ),
                                          // Number sold at the bottom right
                                          Text(
                                            productSales[index], // Show different sales data
                                            style: const TextStyle(
                                              fontSize: 10,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.grey.shade300, // Grey color for the top line
              width: 1, // Line width
            ),
          ),
        ),
        child: SizedBox(
          height: 70, // Set the height to make the bar taller
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
                if (_currentIndex != 0) {
                    // Navigate to the placeholder pages for non-home buttons
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => _pages[_currentIndex]),
                  );
                }
              });
            },
            type: BottomNavigationBarType.fixed, // Ensures all icons are shown
            selectedItemColor: Color.fromRGBO(123, 155, 184, 1.000), // Blue color for selected icons
            unselectedItemColor: Colors.grey, // Grey for unselected icons
            iconSize: 22, // Set smaller icon size
            selectedLabelStyle: const TextStyle(
              fontSize: 10, // Smaller text size for selected label
              color: Colors.grey,
            ),
            unselectedLabelStyle: const TextStyle(
              fontSize: 10, // Smaller text size for unselected label
              color: Colors.grey,
            ),
            items: [
              BottomNavigationBarItem(
                icon: _currentIndex == 0
                    ? const Icon(Icons.home) // Filled icon for selected tab
                    : const Icon(Icons.home_outlined), // Outline icon for unselected tabs
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: _currentIndex == 1
                    ? const Icon(Icons.message) // Filled icon for selected tab
                    : const Icon(Icons.message_outlined), // Outline icon for unselected tabs
                label: "Messages",
              ),
              BottomNavigationBarItem(
                icon: _currentIndex == 2
                    ? const Icon(Icons.shopping_cart) // Filled icon for selected tab
                    : const Icon(Icons.shopping_cart_outlined), // Outline icon for unselected tabs
                label: "Cart",
              ),
              BottomNavigationBarItem(
                icon: _currentIndex == 3
                    ? const Icon(Icons.notifications) // Filled icon for selected tab
                    : const Icon(Icons.notifications_outlined), // Outline icon for unselected tabs
                label: "Notifications",
              ),
              BottomNavigationBarItem(
                icon: _currentIndex == 4
                    ? const Icon(Icons.person) // Filled icon for selected tab
                    : const Icon(Icons.person_outline), // Outline icon for unselected tabs
                label: "Profile",
              ),
            ],
          ),
        ),
      ),
    );
  }
}



