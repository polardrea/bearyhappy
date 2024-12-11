import 'package:flutter/material.dart';
import 'selection.dart';  // Import the LivingRoomPage

class CharacterSelectPage extends StatelessWidget {
  final Function(String) onCharacterSelected;

  const CharacterSelectPage({Key? key, required this.onCharacterSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(239, 225, 216, 1.0), // Light beige background
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Title Text
            const Text(
              "SELECT YOUR CHARACTER",
              style: TextStyle(
                fontFamily: 'Schoolbell',
                fontWeight: FontWeight.bold,
                fontSize: 20, // Adjust font size for better visibility
                color: Color.fromRGBO(102, 61, 16, 1.0),
                letterSpacing: 4.0,
              ),
            ),
            const SizedBox(height: 30), // Spacing between text and bears
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Brown Bear
                Flexible(
                  child: GestureDetector(
                    onTap: () {
                      onCharacterSelected("Brownie");
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SelectionPage(character: "Brownie"), // Pass selected character
                        ),
                      );
                    },
                    child: Image.asset(
                      'assets/Brown Bear.png', // Ensure this is in your assets
                      width: 120, // Adjust size
                      height: 120,
                    ),
                  ),
                ),
                const SizedBox(width: 20), // Space between the two bears
                // White Bear
                Flexible(
                  child: GestureDetector(
                    onTap: () {
                      onCharacterSelected("Polar");
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SelectionPage(character: "Polar"), // Pass selected character
                        ),
                      );
                    },
                    child: Image.asset(
                      'assets/White Bear.png', // Ensure this is in your assets
                      width: 100, // Adjust size
                      height: 100,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
