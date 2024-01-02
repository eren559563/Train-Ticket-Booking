class Data {
  String? route;
  String? departureTime;
  String? arrivalTime;
  String? tourType;
  List<String>? daysOfWeek;

  Data(
      {required this.route,
      required this.departureTime,
      required this.arrivalTime,
      required this.tourType,
      required this.daysOfWeek});

  Data.fromJson(Map<String, dynamic> json) {
    route = json['route'];
    departureTime = json['departureTime'];
    arrivalTime = json['arrivalTime'];
    tourType = json['tourType'];
    daysOfWeek = json['daysOfWeek'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['route'] = route;
    data['departureTime'] = departureTime;
    data['arrivalTime'] = arrivalTime;
    data['tourType'] = tourType;
    data['daysOfWeek'] = daysOfWeek;
    return data;
  }
}
