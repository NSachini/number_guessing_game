import 'package:flutter/material.dart';

class TryAgainPage extends StatefulWidget {
  const TryAgainPage({super.key});

  @override
  State<TryAgainPage> createState() => _TryAgainPageState();
}

class _TryAgainPageState extends State<TryAgainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[100],
      appBar: AppBar(
        title: const Text('Guess Game'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Sorry! wrong guess. Please try again...',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Try Again'),
            ),
          ],
        ),
      ),
    );
  }
}
