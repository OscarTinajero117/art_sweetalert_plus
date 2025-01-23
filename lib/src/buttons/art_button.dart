import 'package:flutter/material.dart';

/// A customizable button widget with an icon and text.
///
/// The [ArtButton] widget allows the user to create a button with a background
/// color, an optional icon, and custom text. It also accepts a callback for when the button is tapped.
///
/// ### Parameters:
/// - [bgColor]: The background color of the button. Defaults to a grey color.
/// - [btnIcon]: An optional icon to be displayed inside the button.
/// - [onTab]: A callback function to be executed when the button is tapped.
/// - [btnText]: The text to be displayed on the button. Defaults to "OK".
/// - [btnTextStyle]: The text style for the button's text. If not provided, defaults to white text with a font size of 15.
/// - [fontSize]: The font size of the button's text. Defaults to `15`.
class ArtButton extends StatefulWidget {
  final Color bgColor; // Background color of the button
  final Icon? btnIcon; // Optional icon to display in the button
  final Function? onTab; // Callback when the button is tapped
  final String btnText; // Text to display on the button
  final TextStyle? btnTextStyle; // Custom text style
  final double fontSize; // Font size for the button text

  /// Creates an [ArtButton] with customizable properties.
  const ArtButton(
      {super.key,
      this.bgColor = const Color.fromRGBO(
          117, 117, 117, 1), // Default grey background color
      this.btnIcon,
      this.onTab,
      this.btnText = "OK", // Default text "OK"
      this.btnTextStyle,
      this.fontSize = 15}); // Default font size 15

  @override
  _ArtButtonState createState() =>
      _ArtButtonState(); // Creates the state for the widget
}

class _ArtButtonState extends State<ArtButton> {
  List<Widget> btnColumns =
      <Widget>[]; // List to store the widgets for the button content

  /// Initializes the button columns with the text widget.
  void initBtnColumns() {
    // Creates the text widget for the button
    Widget button = Text(
      widget.btnText, // Button text from the widget
      style: widget.btnTextStyle ??
          TextStyle(
              color: Colors.white, // Default white color for text
              fontSize: widget.fontSize, // Font size from widget
              fontWeight: FontWeight.w500), // Medium font weight
    );

    // Adds the text widget wrapped in a GestureDetector for tap detection
    btnColumns.add(GestureDetector(
      onTap: () {
        widget.onTab!(); // Calls the onTap callback when the button is tapped
      },
      child: button,
    ));
  }

  @override
  void initState() {
    super.initState();
    initBtnColumns(); // Initializes the button columns when the widget state is created
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTab!(); // Calls the onTap callback when the button is tapped
      },
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: 6, horizontal: 12), // Padding inside the button
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
                Radius.circular(4.0)), // Rounded corners for the button
            color: widget.bgColor), // Background color of the button
        child: IgnorePointer(
          // Disables interactions with children (e.g., the text inside the button)
          child: Row(mainAxisSize: MainAxisSize.min, children: btnColumns),
        ),
      ),
    );
  }
}
