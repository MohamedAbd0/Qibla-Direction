class PrayerModel {

  final String fajr;
  final String sunrise;
  final String dhuhr ;
  final String asr;
  final String sunset;
  final String maghrib;
  final String isha;
  final String imsak;
  final String midnight;


  PrayerModel({
    this.fajr, this.sunrise, this.dhuhr, this.asr, this.sunset, this.maghrib, this.isha, this.imsak, this.midnight
});


  factory PrayerModel.fromJson(Map<String, dynamic> json) => _modelFromJson(json);
}

PrayerModel _modelFromJson(Map<String, dynamic> json) {


  return PrayerModel(
    fajr: json["timings"]["Fajr"] as String,
    sunrise: json["timings"]["Sunrise"] as String,
    dhuhr: json["timings"]["Dhuhr"] as String,
    asr: json["timings"]["Asr"] as String,
    sunset: json["timings"]["Sunset"] as String,
    maghrib: json["timings"]["Maghrib"] as String,
    imsak: json["timings"]["Imsak"] as String,
    isha: json["timings"]["Isha"] as String,
    midnight: json["timings"]["Midnight"] as String,

  );
}
