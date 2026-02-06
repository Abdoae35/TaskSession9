import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: const Text("CounterApp"))),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$counter',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton.filled(
                onPressed: () {
                  setState(() {
                    counter--;
                  });
                },
                icon: Icon(Icons.remove),
                style: IconButton.styleFrom(backgroundColor: Colors.black),
              ),
              IconButton.filled(
                onPressed: () {
                  setState(() {
                    counter++;
                  });
                },
                icon: Icon(Icons.add),
                style: IconButton.styleFrom(backgroundColor: Colors.black),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
