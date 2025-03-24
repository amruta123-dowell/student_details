import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  final String title;
  final bool? isRequired;
  final TextStyle? textStyle;
  const TitleWidget(
      {super.key,
      required this.title,
      this.isRequired = false,
      this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${title} ",
          style: const TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        if (isRequired == true)
          Text(
            "*",
            style: const TextStyle(
                color: Colors.red, fontSize: 16, fontWeight: FontWeight.bold),
          ),
      ],
    );
  }
}
