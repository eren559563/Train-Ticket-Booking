import 'package:flutter/material.dart';
import 'package:flutter_ticketapp_master/core/extension/context_extension.dart';

import '../../core/constants/image/image_constants.dart';
import '../../core/constants/text/text_constants.dart';
import '../../core/style/text_styles.dart';

class StackImage extends StatelessWidget {
  const StackImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height / 4,
      child: Stack(
        children: [
          Container(
            width: context.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  ImageConstants.imageUrl,
                ),
                fit: BoxFit.fill,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          Positioned(
            top: context.height / 5,
            left: 32,
            child: Text(
              AppTextConstants.imagetext,
              style: AppTextStyles.imageTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}
