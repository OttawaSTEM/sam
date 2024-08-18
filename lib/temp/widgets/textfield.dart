import 'package:flutter/material.dart';

import 'package:sam/constants/colors.dart';

class TextFieldWidget extends StatelessWidget {
  final Function onChange;

  const TextFieldWidget({Key? key, required this.onChange}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        fillColor: textColor,
        filled: true,
        border: InputBorder.none,
      ),
    );
  }
}
