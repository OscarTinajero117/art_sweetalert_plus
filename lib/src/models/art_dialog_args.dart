import 'package:flutter/material.dart';

import '../alerts/enum/art_sweet_alert_type.dart';

class ArtDialogArgs {
  /// The title of the dialog
  final String? title;

  /// The text of the dialog
  final String? text;

  /// The color of the title
  final Color? titleColor;

  /// The color of the text
  final Color? textColor;

  /// Whether to show the cancel button
  final bool showCancelBtn;

  /// The text of the cancel button
  final String cancelButtonText;

  /// The text of the confirm button
  final String confirmButtonText;

  /// The text of the deny button
  final String? denyButtonText;

  /// The type of the dialog
  final ArtSweetAlertPlusType? type;

  // handle buttons on tap
  /// The function to call when the confirm button is tapped
  final Function? onConfirm;

  /// The function to call when the deny button is tapped
  final Function? onDeny;

  /// The function to call when the cancel button is tapped
  final Function? onCancel;

  /// The function to call when the dialog is disposed
  final Function? onDispose;

  //icon sizes
  /// The size of the success icon
  final double sizeSuccessIcon;

  /// The size of the info icon
  final double sizeInfoIcon;

  /// The size of the warning icon
  final double sizeWarningIcon;

  /// The size of the error icon
  final double sizeErrorIcon;

  /// The size of the question icon
  final double sizeQuestionIcon;

  // text size
  /// The size of the title text
  final double getTitleSize;

  /// The size of the text
  final double getTextSize;

  // text alignment
  /// The alignment of the title text
  final TextAlign titleAlign;

  /// The alignment of the text
  final TextAlign textAlign;

  //icon colors
  /// The color of the confirm button
  final Color confirmButtonColor;

  /// The color of the deny button
  final Color denyButtonColor;

  /// The color of the cancel button
  final Color cancelButtonColor;

  /// The padding of the dialog
  final EdgeInsets dialogPadding;

  /// The decoration of the dialog
  final Decoration? dialogDecoration;

  /// The elevation of the dialog
  final double dialogElevation;

  /// The main axis size of the dialog
  final MainAxisSize dialogMainAxisSize;

  /// The alignment of the dialog
  final AlignmentGeometry dialogAlignment;

  /// The image of the decoration
  final DecorationImage? decorationImage;

  /// The color of the barrier
  final Color barrierColor;

  /// The custom columns of the dialog
  final List<Widget>? customColumns;



  ArtDialogArgs(
      {this.sizeSuccessIcon = 50.0,
      this.sizeInfoIcon = 50.0,
      this.sizeWarningIcon = 50.0,
      this.sizeErrorIcon = 50.0,
      this.sizeQuestionIcon = 50.0,
      this.getTitleSize = 18.0,
      this.getTextSize = 14.0,
      this.text,
      this.title,
      this.titleColor,
      this.textColor,
      this.titleAlign = TextAlign.center,
      this.textAlign = TextAlign.center,
      this.showCancelBtn = false,
      this.cancelButtonText = "Cancel",
      this.confirmButtonText = "OK",
      this.denyButtonText,
      this.type,
      this.onConfirm,
      this.onDeny,
      this.onCancel,
      this.onDispose,
      this.confirmButtonColor = const Color.fromRGBO(115, 103, 240, 1),
      this.denyButtonColor = const Color.fromRGBO(221, 51, 51, 1),
      this.cancelButtonColor = const Color.fromRGBO(117, 117, 117, 1),
      this.customColumns,
      this.dialogPadding = const EdgeInsets.all(20),
      this.dialogDecoration,
      this.decorationImage,
      this.dialogElevation = 8.0,
      this.dialogMainAxisSize = MainAxisSize.min,
      this.dialogAlignment = Alignment.center,
      this.barrierColor = const Color.fromRGBO(0, 0, 0, 0.4)});

  /// Get the dialog decoration adapted to the current theme
  Decoration getDialogDecoration(BuildContext context) {
    if (dialogDecoration != null) {
      return dialogDecoration!;
    }
    return BoxDecoration(
        image: decorationImage,
        color: Theme.of(context).dialogTheme.backgroundColor ?? Theme.of(context).colorScheme.surface,
        borderRadius: const BorderRadius.all(Radius.circular(16.0)),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8.0,
            offset: Offset(0, 4),
          )
        ]);
  }
}
