import 'package:flutter/material.dart';

// placeholder
class BedroomPage extends StatelessWidget {
  final String character;

  const BedroomPage({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(239, 225, 216, 1.0),
      body: Stack(
        children: [
          // Top Left Button
          Positioned(
            top: 55,
            left: 20,
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/home');
              },
              child: Image.asset(
                'assets/Exit.png',
                width: 40,
                height: 40,
              ),
            ),
          ),

          // Currency Bar
          Positioned(
            top: 58,
            left: MediaQuery.of(context).size.width * 0.38,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.2),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/Bearing.png',
                    width: 20,
                    height: 20,
                  ),
                  const SizedBox(width: 5),
                  const Text(
                    '0', // Currency value
                    style: TextStyle(
                      fontFamily: 'Schoolbell',
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Top Right Buttons
          Positioned(
            top: 50,
            right: 80,
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/friends');
              },
              child: Image.asset(
                'assets/Friends.png',
                width: 50,
                height: 50,
              ),
            ),
          ),

          Positioned(
            top: 50,
            right: 20,
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/bearygram');
              },
              child: Image.asset(
                'assets/Bearygram.png',
                width: 50,
                height: 50,
              ),
            ),
          ),

          // Row between Currency Bar and Center Room
          Positioned(
            top: 160, // Adjust the position based on your layout
            left: 100,
            right: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/livingroom');
                  },
                  child: Image.asset(
                    'assets/Back.png', // Replace with your left icon
                    width: 40,
                    height: 40,
                  ),
                ),
                const Text(
                  'Bedroom',
                  style: TextStyle(
                    fontFamily: 'Schoolbell',
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/livingroom');
                  },
                  child: Image.asset(
                    'assets/Right.png', // Replace with your right icon
                    width: 40,
                    height: 40,
                  ),
                ),
              ],
            ),
          ),

          // Centered Room Content
          Center(
            child: Image.asset(
              'assets/Room.png',
              width: 300,
              height: 300,
            ),
          ),

          // Bottom Buttons
          Positioned(
            bottom: 20,
            left: 20,
            child: GestureDetector(
              onTap: () {
                // Take a screenshot logic here
              },
              child: Image.asset(
                'assets/Camera.png',
                width: 60,
                height: 60,
              ),
            ),
          ),

          Positioned(
            bottom: 30,
            left: MediaQuery.of(context).size.width / 2 - 10,
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/minigame');
              },
              child: Image.asset(
                'assets/Play.png',
                width: 30,
                height: 30,
              ),
            ),
          ),

          Positioned(
            bottom: 15,
            right: 20,
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/store');
              },
              child: Image.asset(
                'assets/Store.png',
                width: 60,
                height: 60,
              ),
            ),
          ),
        ],
      ),
    );
  }
}