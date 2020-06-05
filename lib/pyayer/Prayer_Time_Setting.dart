import 'package:flutter/material.dart';

class PrayerTimeSetting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                  icon: Icons.location_on,
                  title: "المدينة",
                  hint: "اختر المدينة",
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  title: "طريقة الحساب",
                  hint: " رابطة العالم الاسلامي",
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  title: "المذهب",
                  hint: "اختر المذهب ",
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
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
                Switch(value: false, onChanged: (_) {}),
                Text(
                  'العمل في الخلفية',
                  style: TextStyle(
                    fontFamily: 'Sukar',
                    fontSize: 16,
                    fontWeight: FontWeight.w200,
                  ),
                )
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
            Row(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width * .45 ,
                  child: FlatButton(onPressed: (){

                  }, child: Text('اعدادات لكل الصلوات')),
                ),
                Container(width: MediaQuery.of(context).size.width * .45 ,
               child: FlatButton(
                   onPressed: (){},
                   child: Text('اعدادات لكل ات')),)
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String title;
  final String hint;
  final IconData icon;
  CustomTextField(
      {@required this.hint, @required this.icon, @required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * (.3 / 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
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
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 0, horizontal: 8),
                suffixIcon: Icon(
                  icon,
                  size: 18,
                ),
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
