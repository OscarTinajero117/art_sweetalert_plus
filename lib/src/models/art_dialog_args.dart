import 'package:flutter/material.dart';

import '../alerts/enum/art_sweet_alert_type.dart';

class ArtDialogArgs {
  final String? title;
  final String? text;

  // text colors
  final Color titleColor;
  final Color textColor;

  final bool showCancelBtn;
  final String cancelButtonText;
  final String confirmButtonText;
  final String? denyButtonText;
  final ArtSweetAlertPlusType? type;

  //handle buttons on tap
  final Function? onConfirm;
  final Function? onDeny;
  final Function? onCancel;
  final Function? onDispose;

  //icon sizes
  final double sizeSuccessIcon;
  final double sizeInfoIcon;
  final double sizeWarningIcon;
  final double sizeErrorIcon;
  final double sizeQuestionIcon;

  // text size
  final double getTitleSize;
  final double getTextSize;

  // text alignment
  final TextAlign titleAlign;
  final TextAlign textAlign;

  //icon colors
  final Color confirmButtonColor;
  final Color denyButtonColor;
  final Color cancelButtonColor;

  final EdgeInsets dialogPadding;
  Decoration? dialogDecoration;
  final double dialogElevation;
  final MainAxisSize dialogMainAxisSize;
  final AlignmentGeometry dialogAlignment;
  final DecorationImage? decorationImage;

  final Color barrierColor;

  final List<Widget>? customColumns;

  late Decoration _dialogDecoration;

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
      this.titleColor = const Color.fromRGBO(89, 89, 89, 1),
      this.textColor = const Color.fromRGBO(84, 84, 84, 1),
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
      this.dialogElevation = 0.0,
      this.dialogMainAxisSize = MainAxisSize.min,
      this.dialogAlignment = Alignment.center,
      this.barrierColor = const Color.fromRGBO(0, 0, 0, 0.4)}) {
    if (dialogDecoration != null) {
      _dialogDecoration = dialogDecoration!;
    } else {
      _dialogDecoration = BoxDecoration(
          image: decorationImage,
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(4.0)));
    }
  }

  Decoration getDialogDecoration() {
    return _dialogDecoration;
  }
}
