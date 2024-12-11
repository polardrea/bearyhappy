import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<String> allItems = [
    "Round Table",
    "Short Table",
  ];
  List<String> filteredItems = [];

  @override
  void initState() {
    super.initState();
    filteredItems = allItems; // Initially, show all items
  }

  void _filterItems(String query) {
    if (query.isEmpty) {
      setState(() {
        filteredItems = allItems;
      });
    } else {
      setState(() {
        filteredItems = allItems
            .where((item) => item.toLowerCase().contains(query.toLowerCase()))
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10), // Adjust vertical padding for no app bar
          child: Column(
            children: [
              // Row to hold the Back button and the Search Bar
              Row(
                children: [
                  // Back button
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context); // Goes back to the previous screen (Home page)
                    },
                  ),
                  const SizedBox(width: 10), // Space between the button and the search bar

                  // Search Bar
                  Container(
                    height: 40, // Fixed height for the search bar
                    width: 280, // Adjust width to fit screen
                    child: TextField(
                      onChanged: _filterItems,
                      decoration: InputDecoration(
                        hintText: "Search",
                        hintStyle: TextStyle(color: Colors.grey), // Set the hint text color to grey
                        prefixIcon: const Icon(Icons.search, color: Colors.grey),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey), // Set the border color to grey when focused
                          borderRadius: BorderRadius.circular(8),
                        ),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8), // Adjust content padding to reduce height
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10), // Reduced space between the search bar and product list

              // Results List
              Expanded(
                child: filteredItems.isNotEmpty
                    ? ListView.builder(
                  itemCount: filteredItems.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(filteredItems[index]),
                      leading: Image.asset(
                        // Display the correct image based on the table type
                        filteredItems[index] == "Long Table"
                            ? 'assets/Round Table.png' // Image for Long Table
                            : 'assets/Short Table.png', // Image for Short Table
                        width: 25, // Set width as needed
                        height: 40, // Set height as needed
                        fit: BoxFit.cover, // Ensure image is not distorted
                      ),
                      onTap: () {
                        // Add logic for navigating to product detail
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                "Tapped on ${filteredItems[index]}!"),
                          ),
                        );
                      },
                    );
                  },
                )
                    : const Center(
                  child: Text(
                    "No results found.",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
