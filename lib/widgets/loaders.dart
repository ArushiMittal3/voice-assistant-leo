import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        const SizedBox(
          height: 180,
        ),
        Opacity(
          opacity: 0.7,
          child: Image.asset(
            "assets/images/loader.gif",
            height: 80.0,
            width: 80.0,
            
          ),
        ),
      ],
    ));
  }
}


class Bars extends StatelessWidget {
  const Bars({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: 
        Opacity(
          opacity: 0.7,
          child: Image.asset(
            "assets/images/bars.gif",
            height: 50.0,
            width: 50.0,
            
          ),
        ),
      );
  }
}
