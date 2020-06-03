class PrayerModel{
  DateTime _fajr;
  DateTime _sun;
  DateTime _dhor;
  DateTime _asr;
  DateTime _maghrib;
  DateTime _isa;
  String _next;

  String get next{
    return _next;
  }

  DateTime get fajr {
    return _fajr;
  }
  DateTime get sun {
    return _sun;
  }
  DateTime get dhor {
    return _dhor;
  }
  DateTime get asr {
    return _asr;
  }
  DateTime get maghrib {
    return _maghrib;
  } DateTime get isa {
    return _isa;
  }

  void setNext(String next) {
    _next = next;
  }
  void setFajr(DateTime time) {
    _fajr = time;
  }

  void setSun(DateTime time) {
    this._fajr = time;
  }
  void setDhor(DateTime time) {
    this._dhor = time;
  }
  void setAsr(DateTime time) {
    this._asr = time;
  }
  void setMaghrib(DateTime time) {
    this._maghrib = time;
  }
  void setIsa(DateTime time) {
    this._isa = time;
  }

  DateTime timeOfNext(){
    print("_next");

    print(_next);

    if(_next == "Prayer.SUNRISE")
      return _sun;
    else if (_next == "Prayer.FAJR")
      return _fajr;
    else if (_next == "Prayer.DHUHR")
      return _dhor;
    else if (_next == "Prayer.ASR")
      return _asr;
    else if (_next == "Prayer.MAGHRIB")
      return _maghrib;
    else if (_next == "Prayer.ISHA")
      return _isa;
    else return null;
  }

}