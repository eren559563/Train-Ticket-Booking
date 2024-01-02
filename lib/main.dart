import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/constants/color/color_theme.dart';
import 'view/authenticate/provider/view_model.dart';
import 'view/home/screens/homepage.dart';

void main() => runApp(ChangeNotifierProvider<TicketDetailListViewModel>(
    create: (_) => TicketDetailListViewModel(), child: const MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColor.primaryorange,
      ),
      title: 'ticketApp',
      home: const TicketHomePage(),
    );
  }
}
