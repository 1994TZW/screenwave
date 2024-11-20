import 'package:flutter/material.dart';
import 'package:screenwave/widget/theme.dart';

import '../const.dart';

String getGreeting() {
  String key = morning;
  int now = DateTime.now().hour;
  if ((now > 3 && now < 12)) {
    key = morning;
  }

  if ((now >= 12 && now < 17)) {
    key = afternoon;
  }

  if ((now >= 17 && now < 21)) {
    key = evening;
  }

  if ((now >= 21 && now <= 24)) {
    key = night;
  }

  return key;
}

Widget titleWidget(BuildContext context,
    {required String label, Function()? onPressed}) {
  return Row(
    children: [
      Expanded(
        child: Text(label,
            style: const TextStyle(
                fontSize: 18, color: textColor, fontWeight: FontWeight.bold)),
      ),
      onPressed != null
          ? InkWell(
            onTap: onPressed,
            child: const Text("See All",
                style: TextStyle(
                    fontSize: 14,
                    color: primaryColor,
                    fontWeight: FontWeight.w500)),
          )
          : const SizedBox()
    ],
  );
}
