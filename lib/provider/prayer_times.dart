import 'dart:convert';
import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_qiblah_example/helper/http_helper.dart';


class PrayerTimes with ChangeNotifier {

  bool _waiting = true;
  final http = HttpHelper();




// ----------------------------  Get Value ----------------------------


  bool get waiting {
    return _waiting;
  }


// ----------------------------  Set Value ----------------------------



// ----------------------  Times ----------------------------

  Future<void> getTimes(double longitude, double latitude , {String lang = "ar"}) async {
    try {
      var response = await http.postJsonData(
          url: 'call/PrayerTimes/timings',
          data: {
            "lat": 30.5497,
            "lng": 31.2444,
            "lang": "ar",
            "loginuid": "9458b0ad-80fb-4c0f-a515-58159c1f51fb"
          },
        token: null
      );

      print("---------------------------------------------------------------------");
      print(response);
      print(response.data.toString());
      print(response.statusCode);


    } catch (error) {
      throw error;
    }
  }

}
