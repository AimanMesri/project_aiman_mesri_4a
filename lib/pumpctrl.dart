import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';


class pmct extends StatefulWidget {
  const pmct({super.key});

  @override
  State<pmct> createState() => _PumpCtrlState();
}

class _PumpCtrlState extends State<pmct> {

  final DatabaseReference myRTDB = FirebaseDatabase.instanceFor(
    app: Firebase.app(),
    databaseURL: "https://fir-auth-40a78-default-rtdb.asia-southeast1.firebasedatabase.app", // Replace with your database URL
  ).ref();
  bool pumpSwitch = false;

  void readSwitchStatus(){
    myRTDB.child('Actuator/led').onValue.listen((event){
      setState(() {
        pumpSwitch = event.snapshot.value as bool? ?? false;
      });
    });
  }

  void updatePumpSwitch(bool value){
    myRTDB.child('Actuator/led').set(value);
    setState(() {
      pumpSwitch = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IoT Controlling'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Padding(padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 15),
              Text('Actuator Control'),
              Card(
                color: Colors.green,
                child: ListTile(
                  title: Text('Pump'),
                  trailing: Switch(
                      value: pumpSwitch,
                      onChanged: (bool value){updatePumpSwitch(value);}
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}