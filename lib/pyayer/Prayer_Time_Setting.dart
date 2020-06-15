import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_qiblah_example/pyayer/widgets/custom_widgets.dart';
import 'package:flutter_qiblah_example/qiblah/qiblah_compass.dart';

class PrayerTimeSetting extends StatefulWidget {
  @override
  _PrayerTimeSettingState createState() => _PrayerTimeSettingState();
}

class _PrayerTimeSettingState extends State<PrayerTimeSetting> {
  String dropdownValue1;
  String dropdownValue2;
  String dropdownValue3;

  bool showSinglePray = false;
  bool chosen1 = true;
  bool chosen2 = false;
  bool isSwitchedBackGround = false;

  bool isSwitchedAllBefore = false;
  bool isSwitchedAllAdhan = false;
  bool isSwitchedAllAfter = false;

  bool isSwitchedFajrBefore = false;
  bool isSwitchedFajrAdhan = false;
  bool isSwitchedFajrAfter = false;

  bool isSwitchedDhohrBefore = false;
  bool isSwitchedDhohrAdhan = false;
  bool isSwitchedDhohrAfter = false;

  bool isSwitchedAsrBefore = false;
  bool isSwitchedAsrAdhan = false;
  bool isSwitchedAsrAfter = false;

  bool isSwitchedMaghribBefore = false;
  bool isSwitchedMaghribAdhan = false;
  bool isSwitchedMaghribAfter = false;

  bool isSwitchedIshaBefore = false;
  bool isSwitchedIshaAdhan = false;
  bool isSwitchedIshaAfter = false;

  var scrollPosition;
  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    Timer.run(() {
      scrollPosition = _scrollController.position;

      _scrollController.animateTo(
        scrollPosition.maxScrollExtent,
        duration: new Duration(milliseconds: 200),
        curve: Curves.easeOut,
      );
    });

    dropdownValue1 = "رابطة العالم الاسلامى";
    dropdownValue2 = 'اختر المذهب';
    dropdownValue3 = 'اختر المؤذن';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: .5,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_forward_ios,
            color: Colors.transparent,
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () => Navigator.of(context).pop(true),
            icon: Icon(
              Icons.arrow_forward_ios,
              color: Color.fromRGBO(78, 161, 181, 1),
            ),
          )
        ],
        centerTitle: true,
        title: Text(
          'الاعدادات',
          style: TextStyle(
            fontFamily: 'Sukar',
            fontSize: 24,
            fontWeight: FontWeight.w800,
            color: Color.fromRGBO(78, 161, 181, 1),
          ),
        ),
        backgroundColor: Colors.grey[100],
      ),
      body: SingleChildScrollView(
        controller: scrollPosition,
        padding: EdgeInsets.only(top: 8, right: 8, left: 8),
        child: Column(
          children: <Widget>[
            CustomTextField(
              hint: "اختر المدينة",
              title: "المدينة",
              readOnly: false,
              icon: Icons.place,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'طريقة الحساب',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontFamily: 'Sukar',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  height: MediaQuery.of(context).size.height * (.3 / 4) - 20,
                  width: MediaQuery.of(context).size.width * .91,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey)),
                  child: DropdownButton<String>(
                    icon: Icon(Icons.keyboard_arrow_down,color: Color.fromRGBO(78, 161, 181, 1),size: 20,),

                    hint: Text(
                      dropdownValue1,
                      style: TextStyle(
                        fontFamily: 'Sukar',
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w200,
                      ),
                    ),

//
                    underline: Container(
                      color: Colors.white,
                    ),
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownValue1 = newValue;
                      });
                    },
                    items: <String>['One', 'Two', 'Free', 'Four']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Container(
                            width: MediaQuery.of(context).size.width * .8,
                            child: Text(
                              value,
                              style: TextStyle(
                                fontFamily: 'Sukar',
                                fontWeight: FontWeight.w200,
                              ),
                            )),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'المذهب',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      fontFamily: 'Sukar',
                      fontWeight: FontWeight.w600,
                      fontSize: 14),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  height: MediaQuery.of(context).size.height * (.3 / 4) - 20,
                  width: MediaQuery.of(context).size.width * .91,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey)),
                  child: DropdownButton<String>(
                    icon: Icon(Icons.keyboard_arrow_down,color: Color.fromRGBO(78, 161, 181, 1),size: 20,),
                    hint: Text(
                      dropdownValue2,
                      style: TextStyle(
                          fontFamily: 'Sukar',
                          color: Colors.black,
                          fontWeight: FontWeight.w200,
                          fontSize: 14),
                    ),

//
                    underline: Container(
                      color: Colors.white,
                    ),
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownValue2 = newValue;
                      });
                    },
                    items: <String>['One', 'Two', 'Free', 'Four']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Container(
                            width: MediaQuery.of(context).size.width * .8,
                            child: Text(value)),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(
                  height: 15,
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'المؤذن',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontFamily: 'Sukar',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  height: MediaQuery.of(context).size.height * (.3 / 4) - 20,
                  width: MediaQuery.of(context).size.width * .91,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey)),
                  child: DropdownButton<String>(
                    icon: Icon(Icons.keyboard_arrow_down,color: Color.fromRGBO(78, 161, 181, 1),size: 20,),
                    hint: Text(
                      dropdownValue3,
                      style: TextStyle(
                          fontFamily: 'Sukar',
                          color: Colors.black,
                          fontWeight: FontWeight.w200,
                          fontSize: 14),
                    ),

//
                    underline: Container(
                      color: Colors.white,
                    ),
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownValue3 = newValue;
                      });
                    },
                    items: <String>['One', 'Two', 'Free', 'Four']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Container(
                            width: MediaQuery.of(context).size.width * .8,
                            child: Text(value)),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(
                  height: 15,
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'العمل في الخلفية',
                    style: TextStyle(
                      fontFamily: 'Sukar',
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Switch(
                    value: isSwitchedBackGround,
                    onChanged: (value) {
                      setState(() {
                        isSwitchedBackGround = value;
                      });
                    },
                    activeTrackColor: Color.fromRGBO(78, 161, 181, 1),
                    activeColor: Color.fromRGBO(78, 161, 181, 1),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 7,
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Text(
                    'التنبيهات',
                    style: TextStyle(
                      fontFamily: 'Sukar',
                      // fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              width: MediaQuery.of(context).size.width * .95,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CustomButton(
                    title: 'اعدادات لكل الصلوات',
                    onPressed: () {
                      setState(() {
                        showSinglePray = false;
                        chosen1 = true;
                        chosen2 = false;
                      });
                    },
                    chosenButton: chosen1,
                    right: true,
                  ),
                  CustomButton(
                    title: 'اعدادات لكل صلاة علي حده',
                    onPressed: () {
                      setState(() {
                        showSinglePray = true;
                        chosen2 = true;
                        chosen1 = false;
                      });
                    },
                    chosenButton: chosen2,
                    right: false,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            showSinglePray
                ? Column(
                    children: <Widget>[
                      CustomPrayerAlarm(
                        title: "الفجر",
                        singlePrayer: true,
                        switchButtonBefore: Switch(
                          value: isSwitchedFajrBefore,
                          onChanged: (value) {
                            setState(() {
                              isSwitchedFajrBefore = value;
                            });
                          },
                          activeTrackColor: Color.fromRGBO(78, 161, 181, 1),
                          activeColor: Color.fromRGBO(78, 161, 181, 1),
                        ),
                        switchButtonAdhan: Switch(
                          value: isSwitchedFajrAdhan,
                          onChanged: (value) {
                            setState(() {
                              isSwitchedFajrAdhan = value;
                            });
                          },
                          activeTrackColor: Color.fromRGBO(78, 161, 181, 1),
                          activeColor: Color.fromRGBO(78, 161, 181, 1),
                        ),
                        switchButtonAfter: Switch(
                          value: isSwitchedFajrAfter,
                          onChanged: (value) {
                            setState(() {
                              isSwitchedFajrAfter = value;
                            });
                          },
                          activeTrackColor: Color.fromRGBO(78, 161, 181, 1),
                          activeColor: Color.fromRGBO(78, 161, 181, 1),
                        ),
                      ),
                      CustomPrayerAlarm(
                        title: "الظهر",
                        singlePrayer: true,
                        switchButtonBefore: Switch(
                          value: isSwitchedDhohrBefore,
                          onChanged: (value) {
                            setState(() {
                              isSwitchedDhohrBefore = value;
                            });
                          },
                          activeTrackColor: Color.fromRGBO(78, 161, 181, 1),
                          activeColor: Color.fromRGBO(78, 161, 181, 1),
                        ),
                        switchButtonAdhan: Switch(
                          value: isSwitchedDhohrAdhan,
                          onChanged: (value) {
                            setState(() {
                              isSwitchedDhohrAdhan = value;
                            });
                          },
                          activeTrackColor: Color.fromRGBO(78, 161, 181, 1),
                          activeColor: Color.fromRGBO(78, 161, 181, 1),
                        ),
                        switchButtonAfter: Switch(
                          value: isSwitchedDhohrAfter,
                          onChanged: (value) {
                            setState(() {
                              isSwitchedDhohrAfter = value;
                            });
                          },
                          activeTrackColor: Color.fromRGBO(78, 161, 181, 1),
                          activeColor: Color.fromRGBO(78, 161, 181, 1),
                        ),
                      ),
                      CustomPrayerAlarm(
                        title: "العصر",
                        singlePrayer: true,
                        switchButtonBefore: Switch(
                          value: isSwitchedAsrBefore,
                          onChanged: (value) {
                            setState(() {
                              isSwitchedAsrBefore = value;
                            });
                          },
                          activeTrackColor: Color.fromRGBO(78, 161, 181, 1),
                          activeColor: Color.fromRGBO(78, 161, 181, 1),
                        ),
                        switchButtonAdhan: Switch(
                          value: isSwitchedAsrAdhan,
                          onChanged: (value) {
                            setState(() {
                              isSwitchedAsrAdhan = value;
                            });
                          },
                          activeTrackColor: Color.fromRGBO(78, 161, 181, 1),
                          activeColor: Color.fromRGBO(78, 161, 181, 1),
                        ),
                        switchButtonAfter: Switch(
                          value: isSwitchedAsrAfter,
                          onChanged: (value) {
                            setState(() {
                              isSwitchedAsrAfter = value;
                            });
                          },
                          activeTrackColor: Color.fromRGBO(78, 161, 181, 1),
                          activeColor: Color.fromRGBO(78, 161, 181, 1),
                        ),
                      ),
                      Container(
                        child: CustomPrayerAlarm(
                          title: "المغرب",
                          singlePrayer: true,
//                        timerAfter: timerMaghribAfter,
//                        timerBefore: timerMaghribBefore,
                          switchButtonBefore: Switch(
                            value: isSwitchedMaghribBefore,
                            onChanged: (value) {
                              setState(() {
                                isSwitchedMaghribBefore = value;
                              });
                            },
                            activeTrackColor: Color.fromRGBO(78, 161, 181, 1),
                            activeColor: Color.fromRGBO(78, 161, 181, 1),
                          ),
                          switchButtonAdhan: Switch(
                            value: isSwitchedMaghribAdhan,
                            onChanged: (value) {
                              setState(() {
                                isSwitchedMaghribAdhan = value;
                              });
                            },
                            activeTrackColor: Color.fromRGBO(78, 161, 181, 1),
                            activeColor: Color.fromRGBO(78, 161, 181, 1),
                          ),
                          switchButtonAfter: Switch(
                            value: isSwitchedMaghribAfter,
                            onChanged: (value) {
                              setState(() {
                                isSwitchedMaghribAfter = value;
                              });
                            },
                            activeTrackColor: Color.fromRGBO(78, 161, 181, 1),
                            activeColor: Color.fromRGBO(78, 161, 181, 1),
                          ),
                        ),
                      ),
                      CustomPrayerAlarm(
                        title: "العشاء",
                        singlePrayer: true,
//                        timerAfter: timerIshaAfter,
//                        timerBefore: timerIshaBefore,
                        switchButtonBefore: Switch(
                          value: isSwitchedIshaBefore,
                          onChanged: (value) {
                            setState(() {
                              isSwitchedIshaBefore = value;
                            });
                          },
                          activeTrackColor: Color.fromRGBO(78, 161, 181, 1),
                          activeColor: Color.fromRGBO(78, 161, 181, 1),
                        ),
                        switchButtonAdhan: Switch(
                          value: isSwitchedIshaAdhan,
                          onChanged: (value) {
                            setState(() {
                              isSwitchedIshaAdhan = value;
                            });
                          },
                          activeTrackColor: Color.fromRGBO(78, 161, 181, 1),
                          activeColor: Color.fromRGBO(78, 161, 181, 1),
                        ),
                        switchButtonAfter: Switch(
                          value: isSwitchedIshaAfter,
                          onChanged: (value) {
                            setState(() {
                              isSwitchedIshaAfter = value;
                            });
                          },
                          activeTrackColor: Color.fromRGBO(78, 161, 181, 1),
                          activeColor: Color.fromRGBO(78, 161, 181, 1),
                        ),
                      ),
                    ],
                  )
                : CustomPrayerAlarm(
                    singlePrayer: false,
//                    timerAfter: timerAfter,
//                    timerBefore: timerBefore,
                    switchButtonBefore: Switch(
                      value: isSwitchedAllBefore,
                      onChanged: (value) {
                        setState(() {
                          isSwitchedAllBefore = value;
                        });
                      },
                      activeTrackColor: Color.fromRGBO(78, 161, 181, 1),
                      activeColor: Color.fromRGBO(78, 161, 181, 1),
                    ),
                    switchButtonAdhan: Switch(
                      value: isSwitchedAllAdhan,
                      onChanged: (value) {
                        setState(() {
                          isSwitchedAllAdhan = value;
                        });
                      },
                      activeTrackColor: Color.fromRGBO(78, 161, 181, 1),
                      activeColor: Color.fromRGBO(78, 161, 181, 1),
                    ),
                    switchButtonAfter: Switch(
                      value: isSwitchedAllAfter,
                      onChanged: (value) {
                        setState(() {
                          isSwitchedAllAfter = value;
                        });
                      },
                      activeTrackColor: Color.fromRGBO(78, 161, 181, 1),
                      activeColor: Color.fromRGBO(78, 161, 181, 1),
                    ),
                  ),
            Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: RaisedButton(
                elevation: 0,
                shape: StadiumBorder(
                    side: BorderSide(color: Color.fromRGBO(78, 161, 181, 1))),
                color: Colors.white,
                onPressed: () {},
                child: Text(
                  'تم',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Sukar',
                    fontWeight: FontWeight.w200,
                    color: Color.fromRGBO(78, 161, 181, 1),
                  ),
                ),
              ),
            )
          ],
        ),

      ),

    );
  }
}
