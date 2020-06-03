import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertScreen extends StatefulWidget {
  @override
  _AlertScreenState createState() => _AlertScreenState();
}

class _AlertScreenState extends State<AlertScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child:Column(
            mainAxisSize: MainAxisSize.min,

            children: <Widget>[
              Text('قم بتدوير هاتفك لتحسين دقة البوصلة بالحركة التالية',textAlign: TextAlign.center ,),
              Transform.translate(
                  child: Icon(Icons.my_location),

                  offset: Offset(20, 40)),


            ],
          ),
        ),
      ),
    );
  }
}
