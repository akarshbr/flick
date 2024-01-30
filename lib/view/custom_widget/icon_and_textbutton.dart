import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class IconAndTextButton extends StatelessWidget {
  const IconAndTextButton({super.key, required this.icon, required this.text});

  final Icon icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        TextButton(
            onPressed: () {},
            child: Text(text,
                style: const TextStyle(fontSize: settingsTextSize, color: settingsTextColor)))
      ],
    );
  }
}
