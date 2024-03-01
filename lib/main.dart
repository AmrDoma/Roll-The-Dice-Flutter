import 'dart:math';

import 'package:flutter/material.dart';

int selectedImage = 2;
var random = Random();
void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  void rollDice() {
    setState(() {
      selectedImage = random.nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: appBar(),
        body: bodyContainer(),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 78, 118, 248),
      automaticallyImplyLeading: true,
      elevation: 2,
      shadowColor: Colors.black,
      title: const Center(child: Text("Roll the Dice")),
      titleTextStyle: const TextStyle(fontSize: 23),
    );
  }

  Container bodyContainer() {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.deepPurple, Colors.blueAccent])),
      child: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image(
              image: AssetImage('assets/images/dice-$selectedImage.png'),
              height: 200),
          const SizedBox(height: 50),
          OutlinedButton(
              onPressed: () {
                rollDice();
              },
              child: const Text("Roll the Dice!"),
              style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Color.fromARGB(255, 245, 227, 70))),
        ]),
      ),
    );
  }
}
