import 'package:flutter/material.dart';

class Counter_Screen extends StatefulWidget {
  const Counter_Screen({Key? key}) : super(key: key);

  @override
  State<Counter_Screen> createState() => _Counter_ScreenState();
}

class _Counter_ScreenState extends State<Counter_Screen> {

  int counter = 0;

  void increment()
  {
    setState(() {
      counter++;

    });
    print(counter);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: increment,
        child: Icon(Icons.add),

      ),
      body: Center(child: Text('$counter',style: TextStyle(fontSize: 50),))
    );
  }
}
