import 'package:flutter/material.dart';
import 'package:screenwave/const.dart';

import 'placeholder_widget.dart';
import 'theme.dart';

class MoviePlaceholderRow extends StatelessWidget {
  const MoviePlaceholderRow({super.key});

  @override
  Widget build(BuildContext context) {
    var screeningWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: PlaceholderWiget(
        linearGradient: placeholderGradient,
        child: Card(
          elevation: 0,
          color: placeholderColor.withOpacity(0.4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: imageWidth,
                height: imageHeight,
                child: Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    color: placeholderColor,
                    child: Container()),
              ),
              const SizedBox(height: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Container(
                        margin: const EdgeInsets.only(left: 5, right: 5),
                        color: placeholderColor,
                        height: 15,
                        width: screeningWidth / 2),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Container(
                        margin: const EdgeInsets.only(left: 5, right: 5),
                        color: placeholderColor,
                        height: 15,
                        width: screeningWidth / 2),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Container(
                        margin: const EdgeInsets.only(left: 5, right: 5),
                        color: placeholderColor,
                        height: 20,
                        width: screeningWidth / 1.5),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Container(
                        margin: const EdgeInsets.only(left: 5, right: 5),
                        color: placeholderColor,
                        height: 15,
                        width: screeningWidth / 2),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
