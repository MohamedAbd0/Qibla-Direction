import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  final String hint;
  final IconData icon;
  final Widget prefixWidget;
  final bool readOnly;

  CustomTextField(
      {@required this.hint,
      this.icon,
      @required this.title,
      this.prefixWidget,
      @required this.readOnly});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * (.33 / 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2),
            child: Text(
              title,
              style: TextStyle(
                fontFamily: 'Sukar',
                fontSize: 16,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * (.3 / 4) - 20,
            child: TextField(
              readOnly: readOnly,
              onTap: () {},
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(right: 2, left: 0),

                suffix: prefixWidget,
                prefixIcon: Icon(
                  icon,
                  size: 18,
                ),
//                suffixText: sHint,
//                prefixStyle: TextStyle(color: Colors.transparent),
                hintText: hint,
                hintStyle: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Sukar',
                  fontWeight: FontWeight.w200,
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.black54)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.black54)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.black54)),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final Function onPressed;
  final String title;
  final bool chosenButton;

  CustomButton(
      {@required this.onPressed, @required this.title, this.chosenButton});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: .1),
      child: Container(
        width: MediaQuery.of(context).size.width * .45 - 2,
        child: FlatButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2),
                side: BorderSide(
                  color: Color.fromRGBO(78, 161, 181, 1),
                  width: 2,
                )),
            color:
                chosenButton ? Color.fromRGBO(78, 161, 181, 1) : Colors.white,
            onPressed: onPressed,
            child: Text(
              title,
              style: TextStyle(
                fontFamily: 'Sukar',
                fontSize: 12,
                fontWeight: FontWeight.w800,
                color: chosenButton
                    ? Colors.white
                    : Color.fromRGBO(78, 161, 181, 1),
              ),
            )),
      ),
    );
  }
}

class CustomSettingAlarm extends StatefulWidget {
  final String title;
  int timer;
  final bool timerRow;
  final Switch switchButtonSingle;

  CustomSettingAlarm(
      {@required this.title,
      this.timer,
      this.timerRow,
      this.switchButtonSingle});

  @override
  _CustomSettingAlarmState createState() => _CustomSettingAlarmState();
}

class _CustomSettingAlarmState extends State<CustomSettingAlarm> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Text(
            widget.title,
            style: TextStyle(
              fontFamily: 'Sukar',
//                      fontSize: 24,
              fontWeight: FontWeight.w800,
              color: Colors.black,
            ),
          ),
        ),
        widget.timerRow == true
            ? Expanded(
                flex: 3,
                child: Row(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          border: Border.all(
                            color: Color.fromRGBO(78, 161, 181, 1),
                          )),
                      width: MediaQuery.of(context).size.width * .3,
                      height: 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                              flex: 2,
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(78, 161, 181, 1),
                                      borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                      )),
                                  alignment: Alignment.center,
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        widget.timer++;
                                        print(widget.timer);
                                      });
                                    },
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    ),
                                  ))),
                          Expanded(
                            flex: 3,
                            child: Text(
                              '${widget.timer}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Sukar',
                                fontSize: 20,
                                fontWeight: FontWeight.w200,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Expanded(
                              flex: 2,
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(78, 161, 181, 1),
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(20),
                                        topLeft: Radius.circular(20),
                                      )),
                                  alignment: Alignment.center,
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        if (widget.timer > 0) widget.timer--;
                                        print(widget.timer);
                                      });
                                    },
                                    child: Icon(
                                      Icons.remove,
                                      color: Colors.white,
                                    ),
                                  ))),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: Text(
                        'دقيقة',
                        style: TextStyle(
                          fontFamily: 'Sukar',
                          fontWeight: FontWeight.w200,
                          color: Colors.black,
                        ),
                      ),
                    )
                  ],
                ),
              )
            : Expanded(
                flex: 3,
                child: Container(),
              ),
        Expanded(flex: 1, child: widget.switchButtonSingle),
      ],
    );
  }
}

class CustomPrayerAlarm extends StatelessWidget {
  final bool singlePrayer;
  final String title;
  final Switch switchButtonBefore;
  final Switch switchButtonAdhan;
  final Switch switchButtonAfter;
  final int timerBefore;
  final int timerAfter;

  CustomPrayerAlarm({
    this.singlePrayer,
    this.title,
    this.switchButtonBefore,
    this.switchButtonAdhan,
    this.switchButtonAfter,
    this.timerBefore,
    this.timerAfter,
  });

  @override
  Widget build(BuildContext context) {
    return singlePrayer
        ? Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(10)),
                child: ExpansionTile(
                  title: Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Sukar',
                      fontWeight: FontWeight.w200,
                      color: Color.fromRGBO(78, 161, 181, 1),
                    ),
                  ),
                  children: <Widget>[
                    Card(
                      child: Column(
                        children: <Widget>[
                          CustomSettingAlarm(
                            title: 'تنبيه قبل الآذان',
                            timer: timerBefore,
                            timerRow: true,
                            switchButtonSingle: switchButtonBefore,
                          ),
                          CustomSettingAlarm(
                            title: 'تنبيه بالآذان',
                            timerRow: false,
                            switchButtonSingle: switchButtonAdhan,
                          ),
                          CustomSettingAlarm(
                            title: 'تنبيه بالإقامة.',
                            timer: timerAfter,
                            timerRow: true,
                            switchButtonSingle: switchButtonAfter,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              )
            ],
          )
        : Column(
            children: <Widget>[
              CustomSettingAlarm(
                title: 'تنبيه قبل الآذان',
                timer: timerAfter,
                timerRow: true,
                switchButtonSingle: switchButtonBefore,
              ),
              CustomSettingAlarm(
                title: 'تنبيه بالآذان',
                timerRow: false,
                switchButtonSingle: switchButtonAdhan,
              ),
              CustomSettingAlarm(
                title: 'تنبيه بالإقامة.',
                timer: timerBefore,
                timerRow: true,
                switchButtonSingle: switchButtonAfter,
              ),
            ],
          );
  }
}
