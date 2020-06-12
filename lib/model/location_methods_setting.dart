class LocationAndMethods {


  final String id ;

  final String name;

  LocationAndMethods({this.id, this.name});

  factory LocationAndMethods.fromJson(Map<String, dynamic> json) => _locationAndMethodsFromMap(json);

}
LocationAndMethods _locationAndMethodsFromMap(Map<String, dynamic> json) {


  return LocationAndMethods(
id: json ["data"]["id"] as String,
    name: json ["data"]["name"] as String,
  );
}
