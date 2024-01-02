class Data {
  String? passengerName;
  String? seatNu;
  String? departureCity;
  String? departureBusStop;
  String? departureTime;
  String? arrivalCity;
  String? arrivalBusStop;
  String? arrivalTime;
  String? tourNumber;
  String? date;
  String? ticketNumber;
  String? bookingNumber;
  String? qrCode;

  Data(
      {required this.passengerName,
      required this.seatNu,
      required this.departureCity,
      required this.departureBusStop,
      required this.departureTime,
      required this.arrivalCity,
      required this.arrivalBusStop,
      required this.arrivalTime,
      required this.tourNumber,
      required this.date,
      required this.ticketNumber,
      required this.bookingNumber,
      required this.qrCode});

  Data.fromJson(Map<String, dynamic> json) {
    passengerName = json['passengerName'];
    seatNu = json['seatNu'];
    departureCity = json['departureCity'];
    departureBusStop = json['departureBusStop'];
    departureTime = json['departureTime'];
    arrivalCity = json['arrivalCity'];
    arrivalBusStop = json['arrivalBusStop'];
    arrivalTime = json['arrivalTime'];
    tourNumber = json['tourNumber'];
    date = json['date'];
    ticketNumber = json['ticketNumber'];
    bookingNumber = json['bookingNumber'];
    qrCode = json['qrCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['passengerName'] = passengerName;
    data['seatNu'] = seatNu;
    data['departureCity'] = departureCity;
    data['departureBusStop'] = departureBusStop;
    data['departureTime'] = departureTime;
    data['arrivalCity'] = arrivalCity;
    data['arrivalBusStop'] = arrivalBusStop;
    data['arrivalTime'] = arrivalTime;
    data['tourNumber'] = tourNumber;
    data['date'] = date;
    data['ticketNumber'] = ticketNumber;
    data['bookingNumber'] = bookingNumber;
    data['qrCode'] = qrCode;
    return data;
  }
}
