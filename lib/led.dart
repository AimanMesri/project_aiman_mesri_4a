import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LEDControlPage(),
    );
  }
}

class LEDControlPage extends StatefulWidget {
  @override
  _LEDControlPageState createState() => _LEDControlPageState();
}

class _LEDControlPageState extends State<LEDControlPage> {
  bool isLedOn = false;

  void toggleLed() {
    setState(() {
      isLedOn = !isLedOn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){},
            icon: Icon(Icons.toggle_off)),
      ),
      backgroundColor: Colors.teal,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isLedOn ? Icons.lightbulb : Icons.lightbulb_outline,
              size: 80,
              color: isLedOn ? Colors.yellow : Colors.white,
            ),
            SizedBox(height: 20),
            Text(
              'Welcome to LED Control',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Tap the button to toggle the LED!',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white70,
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: toggleLed,
              style: ElevatedButton.styleFrom(
                backgroundColor: isLedOn ? Colors.red : Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              child: Text(isLedOn ? 'Turn Off LED' : 'Turn On LED'),
            ),
          ],
        ),
      ),
    );
  }
}
