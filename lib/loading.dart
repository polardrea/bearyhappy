import 'package:flutter/material.dart';
import 'start.dart';  // Import the StartPage screen

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  double _progress = 0.0;

  @override
  void initState() {
    super.initState();
    _startLoading();
  }

  // Simulate a loading process (e.g., API call, asset loading, etc.)
  void _startLoading() async {
    for (int i = 1; i <= 100; i++) {
      await Future.delayed(const Duration(milliseconds: 50));
      setState(() {
        _progress = i / 100.0;
      });
    }
    // After loading finishes, navigate to the StartPage
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const StartPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(239,225,216,1.000),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Small Image at the top
            Image.asset(
              'assets/Loading Bear.png', // Replace with your image path
              width: 100,
              height: 100,
            ),

            const SizedBox(height: 10), // Spacer between image and progress bar

            // Loading Bar (Progress Indicator)
            SizedBox(
              width: 180, // Set the width of the loading bar
              child: LinearProgressIndicator(
                value: _progress,
                backgroundColor: Color.fromRGBO(102,61,16,1.000),
                valueColor: const AlwaysStoppedAnimation<Color>(Color.fromRGBO(195,124,63,1.000)),
              ),
            ),

            const SizedBox(height: 20), // Spacer between progress bar and text

            // Loading Text
            const Text(
              'LOADING...',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Schoolbell',
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(102,61,16,1.000),
                letterSpacing: 4.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
