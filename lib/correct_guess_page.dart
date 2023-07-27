import 'package:flutter/material.dart';

import 'home_page.dart';

class CorrectGuessPage extends StatelessWidget {
  final int randomNumber;
  const CorrectGuessPage({super.key, required this.randomNumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 205, 236, 210),
      appBar: AppBar(
        title: const Center(child: Text('Guess Game')),
      ),
      body: Container(
        padding: const EdgeInsets.all(35),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Yes! you guessed it right. My secret number is',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "$randomNumber",
                style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54),
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                  );
                },
                child: const Text('Start the Game Again'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
