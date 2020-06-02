import 'dart:async';
import 'dart:math' show pi;
import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:flutter_qiblah_example/alert.dart';
import 'package:flutter_qiblah_example/loading_indicator.dart';
import 'package:flutter_qiblah_example/location_error_widget.dart';
import 'package:geolocator/geolocator.dart';
import 'package:vibration/vibration.dart';

class QiblahCompass extends StatefulWidget {
  @override
  _QiblahCompassState createState() => _QiblahCompassState();
}

Position _currentPosition;
String _currentAddress;

Color appColor = Color.fromARGB(1, 78, 161, 181);

class _QiblahCompassState extends State<QiblahCompass> with SingleTickerProviderStateMixin {
  final _locationStreamController =
      StreamController<LocationStatus>.broadcast();

  get stream => _locationStreamController.stream;

  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    controller = AnimationController(
      duration: Duration(milliseconds: 1300),
      vsync: this,
    );

    animation = Tween(begin: 0.0, end: 1.0).animate(controller)
      ..addListener(() {
        setState(() {});
      });




    _checkLocationStatus();
    _getCurrentLocation();
    super.initState();
  }

  Future<void> _alert(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'قم بتدوير هاتفك لتحسين دقة البوصلة بالحركة التالية',
                textAlign: TextAlign.center,
              ),
              Transform.translate(
                  child: Icon(Icons.my_location), offset: Offset(0.97, .22)),
            ],
          ),
        );
      },
    );
  }
  _vibration() async {
    if (await Vibration.hasVibrator()) {
      Vibration.vibrate();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'القبلة',
          style: TextStyle(
            color: Color.fromRGBO(78, 161, 181, 1),
            fontSize: 30,
          ),
        ),
        backgroundColor: Color.fromRGBO(251, 252, 252, 1),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Image.asset('assets/compassIcon.png'),
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => AlertScreen())),
          )
        ],
      ),
      body: Container(
        child: StreamBuilder(
          stream: stream,
          builder: (context, AsyncSnapshot<LocationStatus> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting)
              return LoadingIndicator();
            if (snapshot.data.enabled == true) {
              switch (snapshot.data.status) {
                case GeolocationStatus.granted:
                  return StreamBuilder(
                    stream: FlutterQiblah.qiblahStream,
                    builder: (_, AsyncSnapshot<QiblahDirection> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting)
                        return LoadingIndicator();

                      final qiblahDirection = snapshot.data;
//        print(((qiblahDirection.qiblah ?? 0) * (pi / 180) * -1));

                      if (qiblahDirection.direction.round() ==
                          qiblahDirection.offset.round()) {
                        _vibration();
                        controller.forward().then((_){
                          Duration(seconds: 2);
                          controller.reverse();
                        });



                      }

                      return Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: Stack(
                          alignment: Alignment.center,
                          children: <Widget>[
                            Positioned(
                                top: 1,
                                child: Container(
                                  child: Column(
                                    children: <Widget>[
                                      Text("القبلة"),
                                      Text("${qiblahDirection.offset.toStringAsFixed(3)}°"),

                                      Text(_currentAddress != null ? _currentAddress : "")
                                      //  Text(position.),
                                    ],
                                  ),
                                )),
                            Transform.scale(
                                scale: controller.value * .8,
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.green
                                ),
                              ),

                            ),

                            Container(
                              width: MediaQuery.of(context).size.width * .8,
                              child: Transform.rotate(
                                angle: ((qiblahDirection.direction ?? 0) * (pi / 180) * -1),
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: <Widget>[
                                    Image.asset('assets/compass.png'),
                                    Image.asset('assets/iconfinder.png')
                                  ],
                                ),
                              ),
                              // width: MediaQuery.of(context).size.width*0.7,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * .7,
                              child: Transform.rotate(
                                angle: ((qiblahDirection.qiblah ?? 0) * (pi / 180) * -1),
                                alignment: Alignment.center,
                                child: Container(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Image.asset(
                                        'assets/kabah.png',
                                        fit: BoxFit.contain,
                                        height: MediaQuery.of(context).size.width * .1,
                                        alignment: Alignment.center,
                                      ),

                                      SizedBox(
                                        height: MediaQuery.of(context).size.width * .085,
                                      ),
                                      //
                                      Image.asset(
                                        'assets/Group.png',
                                        fit: BoxFit.contain,
                                        height: MediaQuery.of(context).size.width * .5,
                                        alignment: Alignment.center,
                                      ),
                                      SizedBox(
                                        height: MediaQuery.of(context).size.width * .185,
                                      ),
                                    ],
                                  ),
                                  //   width: MediaQuery.of(context).size.width,
                                  // height: MediaQuery.of(context).size.width,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 1,
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                child: Image.asset('assets/mosque.png',
                                    height: MediaQuery.of(context).size.height * .23,
                                    width: MediaQuery.of(context).size.width,
                                    fit: BoxFit.fitHeight
                                  // height: 200,
                                  //  alignment: Alignment.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );

                case GeolocationStatus.denied:
                  return LocationErrorWidget(
                    error: "Location service permission denied",
                    callback: _checkLocationStatus,
                  );
                case GeolocationStatus.disabled:
                  return LocationErrorWidget(
                    error: "Location service disabled",
                    callback: _checkLocationStatus,
                  );
                case GeolocationStatus.unknown:
                  return LocationErrorWidget(
                    error: "Unknown Location service error",
                    callback: _checkLocationStatus,
                  );
                default:
                  return Container();
              }
            } else {
              return LocationErrorWidget(
                error: "Please enable Location service",
                callback: _checkLocationStatus,
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        //rgba(78, 161, 181, 1) 78, 161, 181
        child: Icon(
          Icons.my_location,
          color: Color.fromRGBO(78, 161, 181, 1),
        ),
        onPressed: _getCurrentLocation,
      ),
    );
  }

  Future<void> _checkLocationStatus() async {
    final locationStatus = await FlutterQiblah.checkLocationStatus();
    if (locationStatus.enabled &&
        locationStatus.status == GeolocationStatus.denied) {
      await FlutterQiblah.requestPermission();

      final s = await FlutterQiblah.checkLocationStatus();
      _locationStreamController.sink.add(s);
    } else
      _locationStreamController.sink.add(locationStatus);
  }

  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

  _getCurrentLocation() {
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });

      _getAddressFromLatLng();
    }).catchError((e) {
      print(e);
    });
  }

  _getAddressFromLatLng() async {
    print("dddddddddddddddddddddddddddddddddddd");
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      Placemark place = p[0];

      setState(() {
        _currentAddress = "${place.administrativeArea}, ${place.country}";
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void dispose() {
    _locationStreamController.close();
    FlutterQiblah().dispose();
    super.dispose();
    controller.dispose();

  }
}
