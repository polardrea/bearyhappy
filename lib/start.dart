import 'package:flutter/material.dart';
import 'characterselect.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const StartPage(),
    );
  }
}

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          // Navigate to characterselect.dart when tapped
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CharacterSelectPage(
                onCharacterSelected: (selectedCharacter) {
                  print("Selected character: $selectedCharacter");
                },
              ),
            ),
          );
        },
        child: Stack(
          fit: StackFit.expand, // Ensures the Stack takes up full screen
          children: [
            // Background Image
            Image.asset(
              'assets/BH.png', // Replace with your background image path
              fit: BoxFit.cover, // Make the image cover the screen
            ),

            // Centered Text
            Center(
              child: Text(
                "TAP TO BEGIN",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Schoolbell',
                  color: Color.fromRGBO(102, 61, 16, 1.000),
                  letterSpacing: 4.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
