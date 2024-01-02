import 'package:flutter/material.dart';

import '../../core/constants/color/color_theme.dart';
import '../../core/constants/text/text_constants.dart';
import '../../view/authenticate/login/cupertino_dialog.dart';

class BottomNavigationTool extends StatelessWidget {
  const BottomNavigationTool({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.home,
                  color: AppColor.primaryorange,
                ),
              ),
              Text(
                AppTextConstants.bottomtext1,
              ),
            ],
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return const ShowmeCupertinoDialog();
                      });
                },
                icon: const Icon(
                  Icons.description,
                ),
              ),
              Text(
                AppTextConstants.bottomtext2,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
