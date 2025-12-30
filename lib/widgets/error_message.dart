import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  const ErrorMessage({
    super.key,
    required this.errorText,
    required this.retryFunction,
  });

  final String errorText;
  final Function retryFunction;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(Icons.error, size: 50, color: Colors.red),
          SizedBox(height: 20),
          Text(
            "Error: $errorText",
            style: TextStyle(color: Colors.red, fontSize: 16),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              retryFunction();
            },
            child: Text("Retry", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
