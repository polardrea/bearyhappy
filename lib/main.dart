import 'package:flutter/material.dart';
import 'login.dart';
import 'home.dart';
import 'search.dart';
import 'messages.dart';
import 'cart.dart';
import 'notifications.dart';
import 'profile.dart';
import 'loading.dart';
import 'start.dart';
import 'characterselect.dart';
import 'selection.dart';
import 'livingroom.dart';
import 'bedroom.dart';
import 'friends.dart';
import 'bearygram.dart';
import 'newpost.dart';
import 'minigame.dart';
import 'store.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Optional, hides the debug banner
      title: 'Starzada',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

      // Set the initial route for the app
      initialRoute: '/login',

      // Define all routes for the app
      routes: {
        '/login': (context) => const LoginPage(),
        '/home': (context) => HomePage(username: 'User'),
        '/search': (context) => const SearchPage(),
        '/messages': (context) => const MessagesPage(),
        '/cart': (context) => const CartPage(),
        '/notifications': (context) => const NotificationsPage(),
        '/profile': (context) => const ProfilePage(),
        '/loading': (context) => const LoadingPage(),
        '/start': (context) => const StartPage(),
        '/characterselect': (context) => CharacterSelectPage(
          onCharacterSelected: (character) {
            // Handle selected character
            print("Character selected: $character");
          },
        ),
        '/selection': (context) => SelectionPage(character: 'User'),
        '/livingroom': (context) => LivingRoomPage(character: 'User'),
        '/bedroom': (context) => BedroomPage(character: 'User'),
        '/friends': (context) => const FriendsPage(),
        '/bearygram': (context) => const BearygramPage(),
        '/newpost': (context) => const NewpostPage(),
        '/minigame': (context) => const MinigamePage(),
        '/store': (context) => StorePage(),
      },

      // Handle unknown routes
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => const UnknownRouteScreen(),
        );
      },
    );
  }
}

// A simple fallback screen for unknown routes
class UnknownRouteScreen extends StatelessWidget {
  const UnknownRouteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page Not Found')),
      body: const Center(
        child: Text(
          '404 - Page Not Found',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
