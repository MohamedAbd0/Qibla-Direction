import 'dart:async';
import 'dart:math' show pi;

import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:flutter_qiblah_example/loading_indicator.dart';
import 'package:flutter_qiblah_example/location_error_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';

class QiblahCompass extends StatefulWidget {
  @override
  _QiblahCompassState createState() => _QiblahCompassState();
}
Position _currentPosition;
String _currentAddress;
class _QiblahCompassState extends State<QiblahCompass> {
  final _locationStreamController =
      StreamController<LocationStatus>.broadcast();

  get stream => _locationStreamController.stream;


  @override
  void initState() {
    _checkLocationStatus();
    _getCurrentLocation();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(

      child: StreamBuilder(
        stream: stream,
        builder: (context, AsyncSnapshot<LocationStatus> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return LoadingIndicator();
          if (snapshot.data.enabled == true) {
            switch (snapshot.data.status) {
              case GeolocationStatus.granted:
                return QiblahCompassWidget();

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
        _currentAddress =
        "${place.locality}, ${place.postalCode}, ${place.country}";
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
  }
}

class QiblahCompassWidget extends StatelessWidget {
  final _compassSvg = SvgPicture.asset('assets/compass.svg');
  final _needleSvg = Column(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      Image.asset(
  'assets/kabah.png',
    fit: BoxFit.contain,
    height: 50,
    alignment: Alignment.center,
  ),

      SizedBox(height: 50,),
      //
      Image.asset(
        'assets/Group.png',
        fit: BoxFit.contain,
        height: 200,
        alignment: Alignment.center,
      ),
    ],
  );


  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FlutterQiblah.qiblahStream,
        builder: (_, AsyncSnapshot<QiblahDirection> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return LoadingIndicator();

          final qiblahDirection = snapshot.data;

          return Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Positioned(
                  top: 1,
                  child: Container(
                    child: Column(
                      children: <Widget>[

                        Text("القبلة"),
                        Text("${qiblahDirection.offset.toStringAsFixed(3)}°"),

                        Text(_currentAddress != null ? _currentAddress:"")
                        //  Text(position.),

                      ],
                    ),
                  )
              ),

              Container(
                child: Transform.rotate(
                  angle: ((qiblahDirection.direction ?? 0) * (pi / 180) * -1),
                  child: _compassSvg,
                ),
               // width: MediaQuery.of(context).size.width*0.7,
              ),

              Container(
                child: Transform.rotate(
                  angle: ((qiblahDirection.qiblah ?? 0) * (pi / 180) * -1),
                  alignment: Alignment.center,
                  child: Container(
                    child: _needleSvg,
                    //   width: MediaQuery.of(context).size.width,
                    // height: MediaQuery.of(context).size.width,

                  ),
                ),
              ),
              Positioned(
                  bottom: 1,
                  child:  Image.asset(
                    'assets/mosque.png',
                    fit: BoxFit.contain,
                   // height: 200,
                  //  alignment: Alignment.center,
                  ),
              ),

            ],
          );
        },
      );
  }
}
