import 'package:flutter/material.dart';

class PrayerTimeSetting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('الاعدادات' ,),),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(children: <Widget>[
              Text('المدينة'),
              TextField(decoration: InputDecoration(prefixIcon: Icon(Icons.location_on) , hintText: 'اختر المدينة'),)
            ],)
          ],
        ),
      ),
    );
  }
}
