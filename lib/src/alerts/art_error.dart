import 'package:flutter/material.dart';

/// A widget that displays an error message with an error icon.
///
/// The [ArtError] widget is used to display an error message with an accompanying
/// red error icon. The error message is passed via the [title] parameter.
///
/// ### Parameters:
/// - [title]: The error message that will be displayed alongside the error icon.
class ArtError extends StatelessWidget {
  /// The error message to be displayed.
  final String title;

  /// Creates an [ArtError] widget with the specified [title].
  const ArtError({super.key, required this.title});

  /// Builds the [ArtError] widget tree.
  ///
  /// This consists of:
  /// - A [Row] containing:
  ///   - An [Icon] representing the error (red 'error' icon).
  ///   - A [Text] widget that displays the [title] error message.
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.only(bottom: 12.0), // Margin at the bottom for spacing.
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.center, // Centers the content horizontally.
        crossAxisAlignment:
            CrossAxisAlignment.center, // Centers the content vertically.
        children: [
          // Icon widget for displaying the error icon.
          Container(
            margin: EdgeInsets.only(
                right: 4.0), // Right margin for spacing between icon and text.
            child: Icon(
              Icons.error, // Error icon.
              size: 18.0, // Icon size.
              color: Colors.red, // Red color for the error icon.
            ),
          ),
          // The error message (text).
          Expanded(
            child:
                Text(title), // Displays the error message passed in the title.
          ),
        ],
      ),
    );
  }
}
