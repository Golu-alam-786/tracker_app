import 'package:flutter/material.dart';

class HomeScreenBodyWidget extends StatelessWidget {
  final String userName;
  final bool isCountdownActive;
  final int countdown;

  const HomeScreenBodyWidget({
    super.key,
    required this.userName,
    required this.isCountdownActive,
    required this.countdown,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Welcome",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        Text(
          userName,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
          // textAlign: TextAlign.center,
        ),
        if (isCountdownActive) ...[
          const SizedBox(height: 8),
          Text(
            'You will be logged out in $countdown seconds unless you interact.',
            style: const TextStyle(
              fontSize: 16,
              color: Colors.redAccent,
              fontStyle: FontStyle.italic,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ],
    );
  }
}
