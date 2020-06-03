import 'package:adhan_flutter/adhan_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hijri/umm_alqura_calendar.dart';

import 'model/player-model.dart';

class PrayerTime extends StatefulWidget {
  @override
  _PrayerTimeState createState() => _PrayerTimeState();
}

class _PrayerTimeState extends State<PrayerTime> {

  PrayerModel _prayerModel = PrayerModel();
  Color appColor =Color.fromRGBO(78, 161, 181, 1);
  DateTime time ;
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  Position _currentPosition;
  String _currentAddress;

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
          _currentPosition.latitude, _currentPosition.longitude,localeIdentifier:'ar');

      Placemark place = p[0];

      setState(() {
        _currentAddress = "${place.administrativeArea}, ${place.country}";
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
   // Intl.defaultLocale = 'ar';
    time = DateTime.now();
    _getCurrentLocation();
  }

  Widget itemTime(String name,DateTime time){
    return Container(
      padding: EdgeInsets.only(left: 20,right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
              DateFormat.jm().format(time),
            style: TextStyle(fontFamily: 'Sukar' , fontWeight: FontWeight.w600),
          ),
          Text(name,textAlign: TextAlign.right,
            style: TextStyle(fontFamily: 'Sukar' , fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  Widget itemTimer(String name,String number){
    return Container(
      child: Column(
        children: <Widget>[
          Text(
            name,
            style: TextStyle(fontFamily: 'Sukar' , fontWeight: FontWeight.w900),
          ),
          Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
            color: appColor,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(number,
              textAlign: TextAlign.center,
                style: TextStyle(fontFamily: 'Sukar' , fontWeight: FontWeight.w900,fontSize: 20,color: Colors.white),

              ),
            ),
          )

        ],
      ),
    );
  }


  Widget itemDivider(){
    return Container(
        width: MediaQuery.of(context).size.width*0.75,
        child: Divider()
    );

  }

  @override
  Widget build(BuildContext context) {
    print(_prayerModel.timeOfNext());
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'مواقيت الصلاة',
            style: TextStyle(fontFamily: 'Sukar' , fontWeight: FontWeight.w900, color: Color.fromRGBO(78, 161, 181, 1),fontSize: 23),
          ),
          backgroundColor: Color.fromRGBO(251, 252, 252, 1),
          centerTitle: true,
          actions: <Widget>[
           IconButton(
             icon: Icon(Icons.settings,color: appColor,),
           )
          ],
        ),
        body:
            _currentPosition == null ?
            Center(child: Text('Waiting...')):
        Stack(
          children: <Widget>[

            Container(
              padding: EdgeInsets.all(10),
              child: Center(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FutureBuilder(
                        future: getNextPrayer(),
                        builder: (context, AsyncSnapshot<Prayer> snapshot) {
                          if (snapshot.hasData) {
                            final prayer = snapshot.data;
                            return Text(
                              prayer == Prayer.FAJR?"الفجر"
                                  :prayer == Prayer.SUNRISE?"الشروق"
                                  :prayer == Prayer.DHUHR?"الظهر"
                                  :prayer == Prayer.ASR?"العصر"
                                  :prayer == Prayer.MAGHRIB?"المغرب"
                                  :prayer == Prayer.ISHA?"العشاء":'',

                              style: TextStyle(fontFamily: 'Sukar' , fontWeight: FontWeight.w900, color: Color.fromRGBO(159, 70, 51, 1),fontSize: 25),
                            );
                          } else if (snapshot.hasError) {
                            return Text(snapshot.error.toString());
                          } else {
                            return Text('Waiting...');
                          }
                        },
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: FutureBuilder(
                        future: getNextPrayer(),
                        builder: (context, AsyncSnapshot<Prayer> snapshot) {
                          if (snapshot.hasData) {
                            final prayer = snapshot.data;
                            return Container(
                              margin: EdgeInsets.only(left: 35),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  _prayerModel != null  ?
                                  prayer == Prayer.FAJR && _prayerModel.fajr != null?
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[

                                      itemTimer("ساعة","05"),
                                      itemTimer("دقيقة","25"),
                                      itemTimer("ثانية","47"),

                                      Container(
                                        padding: EdgeInsets.only(top: 20,left: 5),
                                        child:Text(
                                          "بعد",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontFamily: 'Sukar' , fontWeight: FontWeight.w900, color:Colors.grey,),

                                        ),
                                      ),
                                    ],
                                  )
                                      :prayer == Prayer.SUNRISE && _prayerModel.sun != null?
                                      SizedBox()
                                      :prayer == Prayer.DHUHR && _prayerModel.dhor != null?
                                  SizedBox()
                                      :prayer == Prayer.ASR && _prayerModel.asr != null?
                                      Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[

                                      itemTimer("ساعة",_prayerModel.asr.difference(DateTime.now()).inHours.toString()),
                                      itemTimer("دقيقة","25"),
                                      itemTimer("ثانية","47"),

                                      Container(
                                        padding: EdgeInsets.only(top: 20,left: 5),
                                        child:Text(
                                          "بعد",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontFamily: 'Sukar' , fontWeight: FontWeight.w900, color:Colors.grey,),

                                        ),
                                      ),
                                    ],
                                  )
                                      :prayer == Prayer.MAGHRIB && _prayerModel.maghrib != null?
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[

                                      itemTimer("ساعة",_prayerModel.isa.difference(DateTime.now()).inHours.toString()),
                                      itemTimer("دقيقة",(_prayerModel.isa.difference(DateTime.now()).inMinutes-(_prayerModel.isa.difference(DateTime.now()).inHours * 60)).toString()),
                                      itemTimer("ثانية",(_prayerModel.isa.difference(DateTime.now()).inSeconds-(_prayerModel.isa.difference(DateTime.now()).inMinutes * 60)).toString()),

                                      Container(
                                        padding: EdgeInsets.only(top: 20,left: 5),
                                        child:Text(
                                          "بعد",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontFamily: 'Sukar' , fontWeight: FontWeight.w900, color:Colors.grey,),

                                        ),
                                      ),
                                    ],
                                  )
                                      :prayer == Prayer.ISHA?
                                  SizedBox()
                                      :
                                  SizedBox()


                                      :SizedBox()


                                ],
                              ),
                            );

                          } else if (snapshot.hasError) {
                            return Text(snapshot.error.toString());
                          } else {
                            return Text('Waiting...');
                          }
                        },
                      ),
                    ),





                    SizedBox(height: 5,),
                    Text(
                      " ${ DateFormat.yMMMd().format(DateTime.now())} - ${UmmAlquraCalendar.fromDate(DateTime.now()).toFormat("MMMM dd, yyyy")} - ${ DateFormat.EEEE().format(DateTime.now())}",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontFamily: 'Sukar' , fontWeight: FontWeight.w600, color:Colors.black,),

                    ),
                    SizedBox(height: 5,),

                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(_currentAddress != null ? _currentAddress : "", style: TextStyle(fontFamily: 'Sukar' , fontWeight: FontWeight.w200, fontSize: 16),),
                        SizedBox(width: 5,),
                        Image.asset("assets/pin_.png"),

                      ],
                    ),

                    SizedBox(height: 5,),

                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Column(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                              color: appColor,
                            ),

                            child: ListTile(
                                title: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    "${UmmAlquraCalendar.fromDate(time).toFormat("MMMM dd, yyyy")}\n${ DateFormat.yMMMd().format(time)}\n${ DateFormat.EEEE().format(time)}",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontFamily: 'Sukar' , fontWeight: FontWeight.w200, color:Colors.white),


                                  ),
                                ),
                                leading: IconButton(
                                  icon: Icon(Icons.arrow_back_ios,color: Colors.white,),
                                  onPressed: (){

                                    setState(() {
                                      time =time.subtract(Duration(days: 1));
                                    });
                                  },
                                ),
                                trailing: IconButton(
                                  icon: Icon(Icons.arrow_forward_ios,color: Colors.white,),
                                  onPressed: (){
                                    print("object");
                                    setState(() {
                                      time = time.add(Duration(days: 1));
                                    });

                                  },
                                )
                            ),
                          ),
                          SizedBox(height: 5,),

                          FutureBuilder(
                            future: getTodayFajrTime(),
                            builder: (context, AsyncSnapshot<DateTime> snapshot) {
                              if (snapshot.hasData) {
                                final dateTime = snapshot.data.toLocal();
                                _prayerModel.setFajr(dateTime);

                                return itemTime("الفجر",dateTime);
                              } else if (snapshot.hasError) {
                                return Text(snapshot.error.toString());
                              } else {
                                return Text('Waiting...');
                              }
                            },
                          ),
                          itemDivider(),
                          FutureBuilder(
                            future: getTodaySunriseTime(),
                            builder: (context, AsyncSnapshot<DateTime> snapshot) {
                              if (snapshot.hasData) {
                                final dateTime = snapshot.data.toLocal();
                                _prayerModel.setSun(dateTime);

                                return itemTime("الشروق",dateTime);
                              } else if (snapshot.hasError) {
                                return Text(snapshot.error.toString());
                              } else {
                                return Text('Waiting...');
                              }
                            },
                          ),
                          itemDivider(),

                          FutureBuilder(
                            future: getTodayDhuhrTime(),
                            builder: (context, AsyncSnapshot<DateTime> snapshot) {
                              if (snapshot.hasData) {
                                final dateTime = snapshot.data.toLocal();
                                _prayerModel.setDhor(dateTime);

                                return itemTime("الظهر",dateTime);
                              } else if (snapshot.hasError) {
                                return Text(snapshot.error.toString());
                              } else {
                                return Text('Waiting...');
                              }
                            },
                          ),
                          itemDivider(),

                          FutureBuilder(
                            future: getTodayAsrTime(),
                            builder: (context, AsyncSnapshot<DateTime> snapshot) {
                              if (snapshot.hasData) {
                                final dateTime = snapshot.data.toLocal();
                                _prayerModel.setDhor(dateTime);
                                return itemTime("العصر",dateTime);
                              } else if (snapshot.hasError) {
                                return Text(snapshot.error.toString());
                              } else {
                                return Text('Waiting...');
                              }
                            },
                          ),
                          itemDivider(),


                          FutureBuilder(
                            future: getTodayMaghribTime(),
                            builder: (context, AsyncSnapshot<DateTime> snapshot) {
                              if (snapshot.hasData) {
                                final dateTime = snapshot.data.toLocal();
                                _prayerModel.setMaghrib(dateTime);
                                return itemTime("المغرب",dateTime);
                              } else if (snapshot.hasError) {
                                return Text(snapshot.error.toString());
                              } else {
                                return Text('Waiting...');
                              }
                            },
                          ),

                          itemDivider(),

                          FutureBuilder(
                            future: getTodayIshaTime(),
                            builder: (context, AsyncSnapshot<DateTime> snapshot) {
                              if (snapshot.hasData) {
                                final dateTime = snapshot.data.toLocal();
                                _prayerModel.setIsa(dateTime);

                                return itemTime("العشاء",dateTime);
                              } else if (snapshot.hasError) {
                                return Text(snapshot.error.toString());
                              } else {
                                return Text('Waiting...');
                              }
                            },
                          ),

                          SizedBox(height: 10,),



                        ],
                      ),
                    ),



                  ],
                ),
              ),
            ),

            Positioned(

              bottom: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Image.asset('assets/mosque.png',
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.fitHeight
                  // height: 200,
                  //  alignment: Alignment.center,
                ),
              ),
            ),

          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          //rgba(78, 161, 181, 1) 78, 161, 181
          child: Icon(
            Icons.my_location,
            color: Color.fromRGBO(78, 161, 181, 1),
          ),
          onPressed: (){
           // _alertLocation(context);
            _getCurrentLocation();
          },
        ),

      ),
    );
  }

  Future<DateTime> getTodayFajrTime() async {
    final adhan = AdhanFlutter.create(Coordinates(_currentPosition.latitude, _currentPosition.longitude), time, CalculationMethod.KARACHI);
    return await adhan.fajr;
  }
  Future<DateTime> getTodaySunriseTime() async {
    final adhan = AdhanFlutter.create(Coordinates(_currentPosition.latitude, _currentPosition.longitude), time, CalculationMethod.KARACHI);
    return await adhan.sunrise;
  }
  Future<DateTime> getTodayDhuhrTime() async {
    final adhan = AdhanFlutter.create(Coordinates(_currentPosition.latitude, _currentPosition.longitude), time, CalculationMethod.KARACHI);
    return await adhan.dhuhr;
  }
  Future<DateTime> getTodayAsrTime() async {
    final adhan = AdhanFlutter.create(Coordinates(_currentPosition.latitude, _currentPosition.longitude), time, CalculationMethod.KARACHI);
    return await adhan.asr;
  }
  Future<DateTime> getTodayMaghribTime() async {
    final adhan = AdhanFlutter.create(Coordinates(_currentPosition.latitude, _currentPosition.longitude),time, CalculationMethod.KARACHI);
    return await adhan.maghrib;
  }
  Future<DateTime> getTodayIshaTime() async {
    final adhan = AdhanFlutter.create(Coordinates(_currentPosition.latitude, _currentPosition.longitude),time, CalculationMethod.KARACHI);
    return await adhan.isha;
  }

  Future<Prayer> getCurrentPrayer() async {
    final adhan = AdhanFlutter.create(Coordinates(_currentPosition.latitude, _currentPosition.longitude), time, CalculationMethod.KARACHI);
    return await adhan.currentPrayer();
  }

  Future<Prayer> getNextPrayer() async {
    final adhan = AdhanFlutter.create(Coordinates(_currentPosition.latitude, _currentPosition.longitude), DateTime.now(), CalculationMethod.KARACHI);
    adhan.nextPrayer().then((p){
      _prayerModel.setNext(p.toString());
    });
    adhan.fajr.then((p){
      _prayerModel.setFajr(p);
    });
    adhan.sunrise.then((p){
      _prayerModel.setSun(p);
    });
    adhan.dhuhr.then((p){
      _prayerModel.setDhor(p);
    });
    adhan.asr.then((p){
      _prayerModel.setAsr(p);
    });

    return await adhan.nextPrayer();
  }
}
