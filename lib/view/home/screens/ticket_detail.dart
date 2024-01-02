import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:qr_flutter/qr_flutter.dart';

import '../../../core/constants/color/color_theme.dart';
import '../../../core/constants/text/text_constants.dart';
import '../../../core/style/text_styles.dart';
import '../../authenticate/provider/view_model.dart';

class TicketDetailPage extends StatefulWidget {
  const TicketDetailPage({super.key});

  @override
  State<TicketDetailPage> createState() => _TicketDetailPageState();
}

class _TicketDetailPageState extends State<TicketDetailPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<TicketDetailListViewModel>(context, listen: false)
        .topHeadlines();
  }

  @override
  Widget build(BuildContext context) {
    var listViewModel = Provider.of<TicketDetailListViewModel>(context);

    return Scaffold(
      appBar: _appbar,
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: 400,
            child: buildListViewTicket(listViewModel),
          ),
        ],
      ),
    );
  }
}

PreferredSizeWidget? get _appbar => AppBar(
      backgroundColor: AppColor.primaryorange,
      leading: const Icon(Icons.directions_bus),
      title: Center(child: Text(AppTextConstants.titlesecondpage)),
      actions: const [
        Icon(
          Icons.directions_bike,
          color: Colors.transparent,
        )
      ],
    );

ListView buildListViewTicket(TicketDetailListViewModel listViewModel) {
  return ListView.builder(
    itemCount: listViewModel.dataitems.length,
    itemBuilder: (context, index) {
      var data = listViewModel.dataitems[index];
      return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          height: 400,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter * 20,
              end: Alignment.bottomRight % 4,
              colors: const [
                Color(0xFFFE5301),
                Colors.white,
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                rowTop(data),
                const SizedBox(
                  height: 20,
                ),
                row2(data),
                const SizedBox(
                  height: 20,
                ),
                row3(data),
                const SizedBox(
                  height: 20,
                ),
                row4(data),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Ticket Number",
                          style: TextStyle(color: AppColor.greytextColor),
                        ),
                        Text(data.ticketno!),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Booking Number",
                          style: TextStyle(
                            color: AppColor.greytextColor,
                          ),
                        ),
                        Text(
                          data.booking!,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        QrImageView(
                          data: data.qr!,
                          version: QrVersions.auto,
                          size: 100,
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

Row row4(TicketDetailViewModel data) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Tour Number",
            style: TextStyle(color: AppColor.greytextColor),
          ),
          Text(data.tour!),
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "Date",
            style: TextStyle(color: AppColor.greytextColor),
          ),
          Text(data.date!)
        ],
      )
    ],
  );
}

Row row3(TicketDetailViewModel data) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Passenger",
            style: TextStyle(color: AppColor.greytextColor),
          ),
          Text(
            data.name!,
            style: AppTextStyles.ticketStyle,
          ),
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "Seat",
            style: TextStyle(color: AppColor.greytextColor),
          ),
          Wrap(
            children: [
              Text(
                data.seat!,
              ),
            ],
          ),
        ],
      )
    ],
  );
}

Row row2(TicketDetailViewModel data) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${data.titleleft}       ----->---",
            style: TextStyle(
              color: AppColor.primaryorange,
              fontSize: 24,
            ),
          ),
          Text(
            data.bus!,
          ),
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            data.titleright!,
            style: TextStyle(
              color: AppColor.primaryorange,
              fontSize: 24,
            ),
          ),
          Text(
            data.bus2!,
          ),
        ],
      )
    ],
  );
}

Row rowTop(TicketDetailViewModel data) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Departure Time",
            style: TextStyle(color: AppColor.greytextColor),
          ),
          Text(
            data.time!,
          ),
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "Arrival time",
            style: TextStyle(color: AppColor.greytextColor),
          ),
          Text(
            data.time2!,
          ),
        ],
      )
    ],
  );
}
