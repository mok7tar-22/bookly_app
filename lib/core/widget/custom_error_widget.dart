import 'package:flutter/material.dart';

import '../app_styles.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget(
      {super.key, required this.errMessage, this.onPressed});
  final String errMessage;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            errMessage,
            style: AppStyles.textStyle18,
            textAlign: TextAlign.center,
          ),
          IconButton(
              onPressed: onPressed,
              icon: const Icon(Icons.restart_alt_outlined))
        ],
      ),
    );
  }
}
