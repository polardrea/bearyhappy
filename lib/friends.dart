import 'package:flutter/material.dart';

class FriendsPage extends StatelessWidget {
  const FriendsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(239, 225, 216, 1.0),

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
          "FRIENDS",
          style: TextStyle(
            fontFamily: 'SR',
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Color.fromRGBO(102, 61, 16, 1.0), // Custom color
            letterSpacing: 6.0,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Invitation Box
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/Friends.png',
                        width: 40,
                        height: 40,
                      ),
                      const SizedBox(width: 10),
                      // Wrap the text with a Flexible widget to ensure it wraps
                      const Flexible(
                        child: Text(
                          "Invite a friend to get 10 Starzada coins!",
                          style: TextStyle(
                            fontFamily: 'Schoolbell',
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Color.fromRGBO(102, 61, 16, 1.0),
                            letterSpacing: 4.0,
                          ),
                          overflow: TextOverflow.ellipsis, // Avoid overflow
                          softWrap: true, // Wrap the text
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  // Invite Button
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // Add invite functionality here
                      },
                      child: const Text(
                        "Invite",
                        style: TextStyle(
                          fontFamily: 'Schoolbell',
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(102, 61, 16, 1.0),
                        // Button color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // Friend List
            Column(
              children: const [
                FriendTile(name: "Loki", imagePath: 'assets/Profile 1.png'),
                FriendTile(name: "Luna", imagePath: 'assets/Profile 2.png'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class FriendTile extends StatelessWidget {
  final String name;
  final String imagePath;

  const FriendTile({
    Key? key,
    required this.name,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: Colors.grey,
            backgroundImage: AssetImage(imagePath),
          ),
          const SizedBox(width: 10),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontFamily: 'Schoolbell',
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

