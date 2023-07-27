import 'dart:math';
import 'package:flutter/material.dart';
import 'correct_guess_page.dart';
import 'try_again_page.dart';
import 'wrong_guess_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int randomNumber = 0;
  int userGuess = 0;
  int guessChances = 3;

  @override
  void initState() {
    super.initState();
    generateRandomNumber();
  }

  void generateRandomNumber() {
    final random = Random();
    randomNumber = random.nextInt(10) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Guess Game"),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(35),
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Image.asset(
                  'assets/images/guess.png',
                  height: 250,
                ),
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  'I have a secret number in my mind (1 - 10). You have 3 chances to guess it. Can you guess it? ',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54),
                ),
                Text('$randomNumber'),
                const SizedBox(
                  height: 35,
                ),
                Text(
                  '$guessChances of 3 chance are taken',
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      userGuess = int.tryParse(value) ?? -1;
                    });
                  },
                ),
                const SizedBox(
                  height: 35,
                ),
                ElevatedButton(
                  onPressed: () {
                    checkGuess();
                  },
                  child: const Text(
                    'Submit',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void checkGuess() {
    // if(guessChances == 0){
    //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>WrongGuessPage(),
    //   ),
    //   );
    // }
    // else {
    if (userGuess == randomNumber) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => CorrectGuessPage(randomNumber: randomNumber),
        ),
      );
    } else {
      setState(() {
        guessChances--;
      });

      if (guessChances == 0) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => WrongGuessPage(randomNumber: randomNumber),
          ),
        );
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const TryAgainPage(),
          ),
        );
      }
    }
  }
  // }
}
