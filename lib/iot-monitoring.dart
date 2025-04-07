import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Iotmonitoring extends StatefulWidget {
  const Iotmonitoring({super.key});

  @override
  State<Iotmonitoring> createState() => _IotmonitoringState();
}
class _IotmonitoringState extends State<Iotmonitoring> {
  
  final DatabaseReference myRTDB = FirebaseDatabase.instance.ref();
  String rssiValue = '0';



  void _readSensorValue(){
    //
  myRTDB.child('Sensor/rssi').onValue.listen(
      (event){
        final Object? rssiData = event.snapshot.value;
        setState(() {
          rssiValue = rssiData.toString();
        });
      }
  );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _readSensorValue();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sensor'),
        centerTitle: true,
        backgroundColor: Color(0xFEE16666)
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20,),
            Card(
              child: Column(
                children: [
                  Text('RSSI Value',style: TextStyle(fontSize: 35),),
                  Text('$rssiValue dBm',style: TextStyle(fontSize: 35),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
