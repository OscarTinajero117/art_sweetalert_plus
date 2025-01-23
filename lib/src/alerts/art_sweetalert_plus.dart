import 'package:flutter/material.dart';

import '../models/art_dialog_args.dart';
import 'art_dialog.dart';

/// A custom dialog manager to show a dialog with a sweet alert effect.
///
/// The [ArtSweetAlertPlus] class provides a static method `show()` to display a custom dialog
/// with a smooth animation and customizable properties like background color, barrier dismissibility,
/// and the content of the dialog.
///
/// ### Parameters for [show]:
/// - [context]: The current build context where the dialog will be shown.
/// - [artDialogArgs]: Custom arguments that define the appearance and behavior of the dialog.
/// - [barrierDismissible]: Whether the dialog can be dismissed by tapping outside of it. Defaults to `true`.
/// - [canPop]: A custom flag to determine whether the dialog can be popped. If `null`, it uses [barrierDismissible].
/// - [artDialogKey]: A key to identify the dialog widget.
class ArtSweetAlertPlus {
  /// Shows the custom dialog with a sweet alert effect.
  ///
  /// This method uses [showGeneralDialog] to display a dialog with custom animations and effects.
  /// It also provides options to control the dismissibility and appearance of the dialog.
  ///
  /// ### Customizations:
  /// - Barrier color: The background color behind the dialog is customizable via [artDialogArgs.barrierColor].
  /// - Transition duration: The duration of the dialog's transition is set to 600 milliseconds.
  /// - Transition builder: The dialog has a scale and fade transition effect for smooth appearance and disappearance.
  static show({
    required BuildContext
        context, // The context in which the dialog will be shown.
    required ArtDialogArgs
        artDialogArgs, // Custom arguments to define dialog's appearance and behavior.
    bool barrierDismissible =
        true, // Whether tapping outside the dialog dismisses it.
    bool?
        canPop, // Custom pop behavior (overrides [barrierDismissible] if provided).
    GlobalKey? artDialogKey, // Optional key for identifying the dialog widget.
  }) {
    // Determines whether the dialog can be popped (dismissed) based on `canPop` or `barrierDismissible`.
    final cnP = canPop ?? barrierDismissible;

    // Shows the general dialog using the [showGeneralDialog] method.
    return showGeneralDialog(
      context: context,
      pageBuilder: (BuildContext buildContext, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        // Wraps the dialog content with a PopScope widget, which determines whether the dialog can be popped.
        return PopScope(
          canPop: cnP,
          child: ArtDialog(
            key: artDialogKey, // Sets the key for the dialog widget.
            artDialogArgs:
                artDialogArgs, // Passes the dialog arguments to the ArtDialog widget.
          ),
        );
      },
      barrierDismissible:
          barrierDismissible, // Sets whether tapping outside the dialog dismisses it.
      barrierColor: artDialogArgs
          .barrierColor, // Sets the background color behind the dialog.
      transitionDuration: const Duration(
          milliseconds: 600), // Sets the transition duration to 600ms.
      transitionBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) {
        // Defines a custom transition effect for the dialog.
        return ScaleTransition(
          alignment: Alignment.center, // Centers the scale effect.
          scale: CurvedAnimation(
            parent: animation, // Uses the main animation for scaling.
            curve: Interval(
              0.00,
              1.0,
              curve:
                  Curves.easeInOutBack, // Smooth "ease-in-out" scale animation.
            ),
          ),
          child: FadeTransition(
            opacity: CurvedAnimation(
              parent: animation, // Uses the main animation for fading.
              curve: Curves.linear, // Linear fade transition.
            ),
            child: child, // The child widget is the dialog content.
          ),
        );
      },
      barrierLabel: MaterialLocalizations.of(context)
          .modalBarrierDismissLabel, // Sets the label for barrier dismissal.
    );
  }
}
