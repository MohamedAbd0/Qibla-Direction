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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 5, top: 10),
            child: Text(
              title,
              style: TextStyle(
                fontFamily: 'Sukar',
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
                contentPadding: EdgeInsets.only(right: 15, left: 15),

                suffix: prefixWidget,
                prefixIcon: icon != null
                    ? Icon(
                        icon,
                        size: 18,
                      )
                    : null,
//                suffixText: sHint,
//                prefixStyle: TextStyle(color: Colors.transparent),
                hintText: hint,

                hintStyle: TextStyle(
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
  final bool right;

  CustomButton(
      {@required this.onPressed,
      @required this.title,
      this.chosenButton,
      @required this.right});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      width: MediaQuery.of(context).size.width * .45,
      decoration: BoxDecoration(
        color: chosenButton ? Color.fromRGBO(78, 161, 181, 1) : Colors.white,
        borderRadius: right
            ? BorderRadius.only(
                topRight: Radius.circular(7), bottomRight: Radius.circular(7))
            : BorderRadius.only(
                topLeft: Radius.circular(7), bottomLeft: Radius.circular(7)),
        border: Border.all(
          color: Color.fromRGBO(78, 161, 181, 1),
        ),
      ),
      child: InkWell(
          onTap: onPressed,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              fontFamily: 'Sukar',
              fontWeight: FontWeight.w100,
              color:
                  chosenButton ? Colors.white : Color.fromRGBO(78, 161, 181, 1),
            ),
          )),
    );
  }
}

//class CustomSettingAlarm extends StatelessWidget {
//  final String title;
//  final Function add;
//  final Function remove;
//  final int timer;
//  final bool timerRow;
//  final Switch switchButtonSingle;
//  const CustomSettingAlarm(
//      {@required this.title,
//        this.add,
//        this.remove,
//        this.timer,
//        this.timerRow,
//        this.switchButtonSingle});
//
//  @override
//  Widget build(BuildContext context) {
//    return Row(
//      mainAxisAlignment: MainAxisAlignment.spaceBetween,
//      children: <Widget>[
//        Expanded(
//          flex: 2,
//          child: Text(
//            title,
//            style: TextStyle(
//              fontFamily: 'Sukar',
////                      fontSize: 24,
//              fontWeight: FontWeight.w800,
//              color: Colors.black,
//            ),
//          ),
//        ),
//        timerRow == true
//            ? Expanded(
//          flex: 3,
//          child: Row(
//            children: <Widget>[
//              Container(
//                decoration: BoxDecoration(
//                    borderRadius: BorderRadius.all(Radius.circular(20)),
//                    border: Border.all(
//                      color: Color.fromRGBO(78, 161, 181, 1),
//                    )),
//                width: MediaQuery.of(context).size.width * .3,
//                height: 30,
//                child: Row(
//                  mainAxisAlignment: MainAxisAlignment.center,
//                  children: <Widget>[
//                    Expanded(
//                        flex: 2,
//                        child: Container(
//                            decoration: BoxDecoration(
//                                color: Color.fromRGBO(78, 161, 181, 1),
//                                borderRadius: BorderRadius.only(
//                                  bottomRight: Radius.circular(20),
//                                  topRight: Radius.circular(20),
//                                )),
//                            alignment: Alignment.center,
//                            child: GestureDetector(
//                              onTap: () {
//                                add;
//                              },
//                              child: Icon(
//                                Icons.add,
//                                color: Colors.white,
//                              ),
//                            ))),
//                    Expanded(
//                      flex: 3,
//                      child: Text(
//                        '$timer',
//                        textAlign: TextAlign.center,
//                        style: TextStyle(
//                          fontFamily: 'Sukar',
//                          fontSize: 20,
//                          fontWeight: FontWeight.w200,
//                          color: Colors.black,
//                        ),
//                      ),
//                    ),
//                    Expanded(
//                        flex: 2,
//                        child: Container(
//                            decoration: BoxDecoration(
//                                color: Color.fromRGBO(78, 161, 181, 1),
//                                borderRadius: BorderRadius.only(
//                                  bottomLeft: Radius.circular(20),
//                                  topLeft: Radius.circular(20),
//                                )),
//                            alignment: Alignment.center,
//                            child: GestureDetector(
//                              child: Icon(
//                                Icons.remove,
//                                color: Colors.white,
//                              ),
//                            ))),
//                  ],
//                ),
//              ),
//              Padding(
//                padding: const EdgeInsets.only(right: 5),
//                child: Text(
//                  'دقيقة',
//                  style: TextStyle(
//                    fontFamily: 'Sukar',
//                    fontWeight: FontWeight.w200,
//                    color: Colors.black,
//                  ),
//                ),
//              )
//            ],
//          ),
//        )
//            : Expanded(
//          flex: 3,
//          child: Container(),
//        ),
//        Expanded(flex: 1, child: switchButtonSingle),
//      ],
//    );
//  }
//}

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
    return Padding(
      padding: const EdgeInsets.only(right:10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Text(
              widget.title,
              style: TextStyle(
                fontFamily: 'Sukar',
//                      fontSize: 24,
                fontWeight: FontWeight.w400,
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
                        height: 25,
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
                                        size: 15,
                                      ),
                                    ))),
                            Expanded(
                              flex: 3,
                              child: Container(
                                child: Center(
                                  child: Text(
                                    '${widget.timer}',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'Sukar',
                                      fontSize: 18,
                                      fontWeight: FontWeight.w200,
                                      color: Colors.black,
                                    ),
                                  ),
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
                                        size: 15,

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
      ),
    );
  }
}

class CustomPrayerAlarm extends StatefulWidget {
  final bool singlePrayer;
  final String title;
  final Switch switchButtonBefore;
  final Switch switchButtonAdhan;
  final Switch switchButtonAfter;

  const CustomPrayerAlarm({
    this.singlePrayer,
    this.title,
    this.switchButtonBefore,
    this.switchButtonAdhan,
    this.switchButtonAfter,
  });

  @override
  _CustomPrayerAlarmState createState() => _CustomPrayerAlarmState();
}

bool isExpand ;


class _CustomPrayerAlarmState extends State<CustomPrayerAlarm> {
  @override
  void initState() {
    super.initState();
    isExpand = false;
  }
  @override
  Widget build(BuildContext context) {
    return widget.singlePrayer
        ? Column(
            children: <Widget>[
              Container(
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(10)),
                child: ExpansionTile(

                  onExpansionChanged: (val){
                   setState(() {
                     isExpand = val;
                   });

                  },
                  trailing: !isExpand ?Icon(
                    Icons.keyboard_arrow_down,
                    color: Color.fromRGBO(78, 161, 181, 1),
                  )
                      :Container(height: 0,width: 0,),
                  title: Text(
                    widget.title,
                    style: TextStyle(
                      fontFamily: 'Sukar',
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(78, 161, 181, 1),
                    ),
                  ),
                  children: <Widget>[
                    Card(
                      child: Column(
                        children: <Widget>[
                          CustomSettingAlarm(
                            title: 'تنبيه قبل الآذان',
                            timer: 25,
                            timerRow: true,
                            switchButtonSingle: widget.switchButtonBefore,
                          ),
                          CustomSettingAlarm(
                            title: 'تنبيه بالآذان',
                            timer: 25,
                            timerRow: false,
                            switchButtonSingle: widget.switchButtonAdhan,
                          ),
                          CustomSettingAlarm(
                            title: 'تنبيه بالإقامة.',
                            timer: 25,
                            timerRow: true,
                            switchButtonSingle: widget.switchButtonAfter,
                          ),
                          isExpand ? Icon(
                            Icons.keyboard_arrow_up ,
                            color: Color.fromRGBO(78, 161, 181, 1),
                          ):Container(height: 0, width: 0,)
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
                timer: 25,
                timerRow: true,
                switchButtonSingle: widget.switchButtonBefore,
              ),
              CustomSettingAlarm(
                title: 'تنبيه بالآذان',
                timer: 25,
                timerRow: false,
                switchButtonSingle: widget.switchButtonAdhan,
              ),
              CustomSettingAlarm(
                title: 'تنبيه بالإقامة.',
                timer: 25,
                timerRow: true,
                switchButtonSingle: widget.switchButtonAfter,
              ),
            ],
          );
  }
}
