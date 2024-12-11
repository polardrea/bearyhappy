import 'package:flutter/material.dart';

class NewpostPage extends StatelessWidget {
  const NewpostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Light beige background

      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(102, 61, 16, 1.0),
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset(
            'assets/Back 2.png',
            width: 20,
            height: 20,
          ),
        ),

        title: const Text(
          "NEW POST",
          style: TextStyle(
            fontFamily: 'SR',
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Color.fromRGBO(239, 225, 216, 1.0), // Light beige text
            letterSpacing: 6.0,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Container(
              height: 150,
              decoration: BoxDecoration(
                color: Colors.grey[300], // Light grey container
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Logic for adding an image can go here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white, // White button
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    side: BorderSide(color: Colors.grey), // Grey border
                  ),
                  child: const Text(
                    "+ Add Image",
                    style: TextStyle(
                      fontFamily: 'Schoolbell',
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Color.fromRGBO(102, 61, 16, 1.0),
                      letterSpacing: 4.0,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Write a caption
            Container(
              padding: const EdgeInsets.only(left: 12, top: 10, right: 180, bottom: 200),
              decoration: BoxDecoration(
                border: Border.all(color: Color.fromRGBO(102, 61, 16, 1.0)),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                "Write a caption...",
                style: TextStyle(
                  fontFamily: 'Schoolbell',
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.grey,
                  letterSpacing: 4.0,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Dark brown "Share" button at the bottom
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      // Logic for sharing the post
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(102, 61, 16, 1.0), // Dark brown button
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      "Share",
                      style: TextStyle(
                        fontFamily: 'Schoolbell',
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.white,
                        letterSpacing: 4.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
