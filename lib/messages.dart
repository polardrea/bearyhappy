import 'package:flutter/material.dart';

// placeholder
class MessagesPage extends StatelessWidget {
  const MessagesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Messages Page")),
      body: const Center(child: Text("This is the Messages Page")),
    );
  }
}

// navbar