import 'package:flutter/material.dart';

class BearygramPage extends StatelessWidget {
  const BearygramPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

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
          "BEARYGRAM",
          style: TextStyle(
            fontFamily: 'SR',
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Color.fromRGBO(239, 225, 216, 1.0),
            letterSpacing: 6.0,
          ),
        ),
      ),

      body: Column(
        children: [
          // Scrollable feed
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(10),
              children: [
                PostCard(
                  avatar: 'assets/Profile 1.png',
                  username: 'Loki',
                  image: 'assets/Post.png',
                  caption: 'My new purchase!',
                  time: '2 hours ago',
                  likes: 25,
                ),
              ],
            ),
          ),

          SizedBox(
            height: 70,
            child: BottomNavigationBar(
              backgroundColor: Colors.white,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.grey,
              items: [
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/Star.png',
                    width: 24,
                    height: 24,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/Search.png',
                    width: 24,
                    height: 24,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: GestureDetector(
                    onTap: () {

                      Navigator.pushNamed(context, '/newpost');
                    },
                    child: Image.asset(
                      'assets/New.png',
                      width: 24,
                      height: 24,
                    ),
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/Bell.png',
                    width: 24,
                    height: 24,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/Profile.png',
                    width: 24,
                    height: 24,
                  ),
                  label: '',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class PostCard extends StatelessWidget {
  final String avatar;
  final String username;
  final String image;
  final String caption;
  final String time;
  final int likes;

  const PostCard({
    Key? key,
    required this.avatar,
    required this.username,
    required this.image,
    required this.caption,
    required this.time,
    required this.likes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [

          ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            leading: CircleAvatar(
              backgroundImage: AssetImage(avatar),
              radius: 20,
            ),
            title: Text(
              username,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 2), // Reduced space between username and time
              child: Text(time),
            ),
          ),
          Image.asset(image),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Align children to the left
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.thumb_up),
                    onPressed: () {},
                    color: const Color.fromRGBO(102, 61, 16, 1.0),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0), // Moved likes up
                    child: Text(
                      '$likes likes',
                      style: const TextStyle(
                        color: Color.fromRGBO(102, 61, 16, 1.0),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

              Container(
                margin: const EdgeInsets.only(left: 10, bottom: 15),
                padding: const EdgeInsets.only(top: 5, left: 15, bottom: 5, right: 220),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(239, 225, 216, 1.0),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  caption,
                  style: const TextStyle(
                    color: Color.fromRGBO(102, 61, 16, 1.0),
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: BearygramPage(),
  ));
}
