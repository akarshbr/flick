import 'package:flutter/material.dart';

class MovieDetailsEB extends StatelessWidget {
  const MovieDetailsEB({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            minimumSize: const Size.fromHeight(60),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
        child: Text(text, style: const TextStyle(fontSize: 30, color: Colors.white)),
      ),
    );
  }
}
