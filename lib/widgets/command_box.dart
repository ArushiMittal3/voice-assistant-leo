import 'package:flutter/material.dart';

class CommandBox extends StatelessWidget {
  final Color color;
  final String heading;
  final String text;
  const CommandBox({
    super.key,
    required this.color,
    required this.heading,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Container(
          height: 95,
          width: MediaQuery.sizeOf(context).width - 50,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(heading,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16))),
                Text(text)
              ],
            ),
          )),
    );
  }
}
