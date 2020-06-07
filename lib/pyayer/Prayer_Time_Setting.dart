import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qiblah_example/pyayer/widgets/custom_widgets.dart';

class PrayerTimeSetting extends StatefulWidget {
  @override
  _PrayerTimeSettingState createState() => _PrayerTimeSettingState();
}

class _PrayerTimeSettingState extends State<PrayerTimeSetting> {
  String dropdownValue = 'One';
  bool showSinglePray = false;
  bool chosen1 = true;
  bool chosen2 = false;
  bool isSwitchedBackGround = false;
  int timerAfter = 0,
      timerBefore = 0,
      timerFajrAfter = 0,
      timerFajrBefore = 0,
      timerDhohrAfter = 0,
      timerDhohrBefore = 0,
      timerAsrAfter = 0,
      timerAsrBefore = 0,
      timerMaghribAfter = 0,
      timerMaghribBefore = 0,
      timerIshaAfter = 0,
      timerIshaBefore = 0;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
//          onPressed: () => Navigator.of(context).pop(true),
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
        backgroundColor: Color.fromRGBO(251, 252, 252, 1),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            Column(
              children: <Widget>[
                CustomTextField(
                  readOnly: false,
                  icon: Icons.location_on,
                  title: "المدينة",
                  hint: "اختر المدينة",
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  readOnly: true,
                  hint: dropdownValue,
                  title: 'طريقة الحساب',
                  prefixWidget: DropdownButton<String>(
//                  value: dropdownValue
                    underline: Container(
                      color: Colors.white,
                    ),
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownValue = newValue;
                      });
                    },
                    items: <String>['One', 'Two', 'Free', 'Four']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Container(
                            width: MediaQuery.of(context).size.width * .5,
                            child: Text(value)),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  readOnly: false,
                  title: "المذهب",
                  hint: "اختر المذهب ",
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  readOnly: false,
                  title: "صوت المؤذن",
                  hint: "اختر المؤذن",
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'العمل في الخلفية',
                  style: TextStyle(
                    fontFamily: 'Sukar',
                    fontSize: 16,
                    fontWeight: FontWeight.w200,
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
            const SizedBox(
              height: 10,
            ),
            Text(
              'التنبيهات',
              style: TextStyle(
                fontFamily: 'Sukar',
                fontSize: 16,
                fontWeight: FontWeight.w900,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * .9,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                  ),
                ],
              ),
            ),
            showSinglePray
                ? Column(
                    children: <Widget>[
                      CustomPrayerAlarm(
                        title: "الفجر",
                        singlePrayer: true,
//                        timerAfter: timerFajrAfter,
//                        timerBefore: timerFajrBefore,
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
//                        timerAfter: timerDhohrAfter,
//                        timerBefore: timerDhohrBefore,
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
//                        timerAfter: timerAsrAfter,
//                        timerBefore: timerAsrBefore,
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
                      CustomPrayerAlarm(
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
            RaisedButton(
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
            )
          ],
        ),
      ),
    );
  }
}
