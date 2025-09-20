import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Transform.translate(
            offset: const Offset(0, 2),
            child: const Icon(
              Icons.add_task,
              color: Colors.white,
              size: 30,
            ),
          ),
          const SizedBox(width: 7),
          RichText(
            text: const TextSpan(
              style: TextStyle(
                fontFamily: 'Dosis',
                fontSize: 30,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
              children: [
                TextSpan(text: "daily."),
                TextSpan(
                  text: "flow",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Color(0xFFF1D35B),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
