import 'dart:convert';
import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_qiblah_example/helper/http_helper.dart';
import 'package:http/http.dart' as http2;

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

      Map<String,dynamic> userData = {
        "lat": 30.5497,
        "lng": 31.2444,
        "lang": "ar",
        "loginuid": "9458b0ad-80fb-4c0f-a515-58159c1f51fb"

      };
      var headers = {
        "content-type": "application/json",
        //  "accept": "application/json",
        //"Host":"<calculated when request is sent>",
        //"Content-Length":"<calculated when request is sent>"

      };
      http2.post(
         "https://cms.gdforce.com/call/PrayerTimes/timings",
          body: json.encode(userData),
          headers: headers
          //headers: headersMap
      ).then((http2.Response response){
        print(response.body);
      });

      print("---------------------------------------------------------------------");



    } catch (error) {
      throw error;
    }
  }


  Future<void> prayerMethodType() async {
    try {
      var response = await http.postJsonData(
          url: 'https://cms.gdforce.com/api3/get/prayer_method_type',
          data: {
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
