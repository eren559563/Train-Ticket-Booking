import 'package:flutter/material.dart';
import '../../../product/model/ticket_detail.dart';
import '../service/tickets_service.dart';

class TicketDetailViewModel {
  final Data _dataticket;

  TicketDetailViewModel({required Data data}) : _dataticket = data;

  String? get name {
    return _dataticket.passengerName;
  }

  String? get time {
    return _dataticket.departureTime;
  }

  String? get time2 {
    return _dataticket.arrivalTime;
  }

  String? get titleleft {
    return _dataticket.departureCity;
  }

  String? get titleright {
    return _dataticket.arrivalCity;
  }

  String? get seat {
    return _dataticket.seatNu;
  }

  String? get date {
    return _dataticket.date;
  }

  String? get ticketno {
    return _dataticket.ticketNumber;
  }

  String? get booking {
    return _dataticket.bookingNumber;
  }

  String? get qr {
    return _dataticket.qrCode;
  }

  String? get tour {
    return _dataticket.tourNumber;
  }

  String? get bus {
    return _dataticket.departureBusStop;
  }

  String? get bus2 {
    return _dataticket.arrivalBusStop;
  }
}

class TicketDetailListViewModel with ChangeNotifier {
  LoadingStatus loadingStatus = LoadingStatus.searching;

  List<TicketDetailViewModel> dataitems =
      List<TicketDetailViewModel>.empty(growable: true);

  void topHeadlines() async {
    List<Data> ticketdetail = await TicketDetailService().fetchTopHeadlines();
    loadingStatus = LoadingStatus.searching;
    notifyListeners();

    dataitems =
        ticketdetail.map((data) => TicketDetailViewModel(data: data)).toList();

    if (dataitems.isEmpty) {
      loadingStatus = LoadingStatus.empty;
    } else {
      loadingStatus = LoadingStatus.completed;
    }
  }
}

enum LoadingStatus { completed, searching, empty }
