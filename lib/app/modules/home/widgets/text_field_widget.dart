import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({super.key, this.onChanged, this.controller, this.onPressedClose});
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final void Function()? onPressedClose;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: 'Search apps...',
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(),
          suffixIcon: IconButton(onPressed: onPressedClose, icon: Icon(Icons.close)),
        ),
        onChanged: onChanged,
      ),
    );
  }
}
