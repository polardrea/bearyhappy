import 'package:flutter/material.dart';
import 'livingroom.dart'; // Import the LivingRoomPage
import 'characterselect.dart'; // Import the CharacterSelectPage

class SelectionPage extends StatelessWidget {
  final String character;

  // Constructor to accept the selected character
  const SelectionPage({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(239, 225, 216, 1.0), // Light beige background
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text displayed above the bear
            Text(
              'YOU SELECTED $character!',
              style: const TextStyle(
                fontFamily: 'Schoolbell',
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Color.fromRGBO(102, 61, 16, 1.0),
                letterSpacing: 4.0,
              ),
            ),
            const SizedBox(height: 20), // Space between text and image

            // Display the selected character image (bear)
            Image.asset(
              character == "Brownie"
                  ? 'assets/Brown Bear.png'
                  : 'assets/White Bear.png', // Display the corresponding bear
              width: 150, // Adjust size as needed
              height: 150,
            ),
            const SizedBox(height: 40), // Space between bear and buttons

            // Row with Cancel and Confirm buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Cancel button (returns to CharacterSelectPage)
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Go back to the CharacterSelectPage
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(102, 61, 16, 1.0), // Brown color
                  ),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                      fontFamily: 'Schoolbell',
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 20), // Space between the two buttons

                // Confirm button (navigates to LivingRoomPage)
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LivingRoomPage(character: character), // Pass character to LivingRoomPage
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(102, 61, 16, 1.0), // Brown color
                  ),
                  child: const Text(
                    'Confirm',
                    style: TextStyle(
                      fontFamily: 'Schoolbell',
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white,
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
