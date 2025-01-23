import 'package:flutter/material.dart';

class ArtError extends StatelessWidget {
  final String title;

  const ArtError({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(right: 4.0),
            child: Icon(
              Icons.error,
              size: 18.0,
              color: Colors.red,
            ),
          ),
          Expanded(
            child: Text(title),
          )
        ],
      ),
    );
  }
}
